local FzfMenu = {}

local NuiText = require("nui.text")
local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event
local Path = require("plenary.path")
local Table = require("util.table")

---@class Pathspecs
---@field include table<string, boolean>
---@field exclude table<string, boolean>

---@alias PathspecType '"include"' | '"exclude"'

---@type Pathspecs
local pathspecs = {
  include = {},
  exclude = {},
}

--- Get all file extensions under cwd
---@param opts table
---@return table<string, boolean>
local get_all_extensions = function(opts)
  local files = require("util.command").get_os_command_output(
    { "fd", "--color=never", "--type", "f", "--hidden", "--follow", "--exclude", ".git" },
    opts.cwd
  )
  local extensions = {}
  extensions[""] = true
  for _, file in ipairs(files) do
    local extension = file:match("^.+(%..+)$")
    if extension then
      extensions[extension] = true
    end
  end
  return extensions
end

--- Get all directories under cwd
---@param opts table
---@return string[]
local get_directories = function(opts)
  local directories = require("util.command").get_os_command_output(
    { "fd", "--color=never", "--type", "d", "--hidden", "--follow", "--exclude", ".git" },
    opts.cwd
  )
  table.insert(directories, 1, "")
  return directories
end

--- Set pathspec for files/grep
---@param pathspec string
---@param type PathspecType
function FzfMenu.set_pathspec(pathspec, type)
  pathspecs[type][pathspec] = true
end

--- Unset pathspec for files/grep
---@param pathspec string
---@param type PathspecType
function FzfMenu.unset_pathspec(pathspec, type)
  pathspecs[type][pathspec] = nil
end

--- Get pathspec string
---@param type FzfCmdType
---@return string
function FzfMenu.get_pathspec_string(type)
  print("type " .. type)
  print("include " .. tostring(Table.table_len(pathspecs.include)), vim.inspect(pathspecs.include))
  print("exclude " .. tostring(Table.table_len(pathspecs.exclude)), vim.inspect(pathspecs.exclude))
  if Table.table_len(pathspecs.include) == 0 and Table.table_len(pathspecs.exclude) == 0 then
    return ""
  end

  local glob_args = ""
  if type == "rg" then
    for include in pairs(pathspecs.include) do
      glob_args = glob_args .. ("%s %s "):format("--iglob", require("fzf-lua.libuv").shellescape(include))
    end
    for exclude in pairs(pathspecs.exclude) do
      glob_args = glob_args .. ("%s %s "):format("--iglob", require("fzf-lua.libuv").shellescape("!" .. exclude))
    end
    return glob_args
  elseif type == "git_grep" then
    glob_args = glob_args .. "-- "
    for include in pairs(pathspecs.include) do
      glob_args = glob_args .. ("%s "):format(require("fzf-lua.libuv").shellescape(include))
    end
    for exclude in pairs(pathspecs.exclude) do
      glob_args = glob_args .. ("%s "):format(require("fzf-lua.libuv").shellescape(":!" .. exclude))
    end
    return glob_args
  end
  return ""
end

--- Fzf to select pathspec for files/grep
---@param opts table?
---@param type PathspecType
function FzfMenu.fzf_pathspec(opts, type)
  opts = opts or {}
  local title = (type == "include") and "Include Patterns" or "Exclude Patterns"
  opts = vim.tbl_deep_extend("force", opts, {
    cwd = require("plugins.fuzzy_finder.fzf-lua.cmds").get_cwd(opts),
    winopts = {
      height = 0.6,
      width = 0.6,
      row = 0.35,
      col = 0.5,
      title = " " .. title .. " ",
      title_pos = "center",
    },
    actions = {
      ["default"] = function(selected, opts)
        for _, sel in ipairs(selected) do
          FzfMenu.set_pathspec(sel, type)
        end

        -- HACK: fzf-lua terminal buffer remains at first time
        if vim.bo.filetype == "fzf" then
          vim.api.nvim_buf_delete(vim.api.nvim_get_current_buf(), { force = true })
        end
        vim.schedule(function()
          require("plugins.fuzzy_finder.fzf-lua.menu").fzf_menu(pathspecs)
        end)
      end,
    },
  })

  local extensions = get_all_extensions(opts)
  local directories = get_directories(opts)

  require("fzf-lua").fzf_exec(function(fzf_cb)
    coroutine.wrap(function()
      local co = coroutine.running()
      for _, directory in ipairs(directories) do
        for extension in pairs(extensions) do
          fzf_cb(directory .. "**" .. extension, function()
            coroutine.resume(co)
          end)
          coroutine.yield()
        end
      end
      fzf_cb()
    end)()
  end, opts)
end

--- Open menu to set pathspecs for files/grep
---@param opts lazyvim.util.pick.Opts?
function FzfMenu.fzf_menu(opts)
  ---@return table<string, string>, string
  local get_winhighlight = function()
    local hls = {
      normal = "FzfLuaNormal",
      border = "FzfLuaBorder",
      cursorline = "FzfLuaCursorLine",
      cursorlinenr = "FzfLuaCursorLineNr",
      title = "FzfLuaTitle",
      tab_title = "FzfLuaTabTitle",
    }
    local highlights = {
      { "NormalFloat", hls.normal },
      { "FloatBorder", hls.border },
      { "Cursor", hls.border },
      { "CursorLine", hls.cursorline },
      { "CursorLineNr", hls.cursorlinenr },
      { "FloatTitle", hls.title },
    }
    local hl
    for _, h in ipairs(highlights) do
      hl = string.format("%s%s:%s", hl and hl .. "," or "", h[1], h[2])
    end
    return hls, hl
  end

  ---@param hls table<string, string>
  ---@param contents Pathspecs
  ---@return NuiTree.Node[]
  local get_lines = function(hls, contents)
    local get_icon = function(pathspec)
      pathspec = pathspec:gsub("*", "")
      local path = Path:new(pathspec)
      local icon, hl
      if path:is_dir() then
        icon, hl = require("mini.icons").get("directory", pathspec)
      else
        icon, hl = require("mini.icons").get("file", pathspec)
      end
      return icon, hl
    end
    local blank_icon = ""
    local blank_hl = "MiniIconsRed"

    local lines = {}

    -- Include patterns
    table.insert(lines, Menu.separator(NuiText(" Include Patterns ", hls.tab_title), { text_align = "left" }))
    for include in pairs(contents.include) do
      local icon, hl = get_icon(include)
      table.insert(
        lines,
        Menu.item(
          NuiText(include, { virt_text = { { " " .. icon .. "  ", hl } }, virt_text_pos = "inline" }),
          { type = "include" }
        )
      )
    end
    table.insert(
      lines,
      Menu.item(
        NuiText(" ", { virt_text = { { " " .. blank_icon .. "  ", blank_hl } }, virt_text_pos = "inline" }),
        { type = "include", blank = true }
      )
    )

    -- blank line
    table.insert(lines, Menu.separator("", { char = " " }))

    -- Exclude Patterns
    table.insert(lines, Menu.separator(NuiText(" Exclude Patterns ", hls.tab_title), { text_align = "left" }))
    for exclude in pairs(contents.exclude) do
      local icon, hl = get_icon(exclude)
      table.insert(
        lines,
        Menu.item(
          NuiText(exclude, { virt_text = { { " " .. icon .. "  ", hl } }, virt_text_pos = "inline" }),
          { type = "exclude" }
        )
      )
    end
    table.insert(
      lines,
      Menu.item(
        NuiText(" ", { virt_text = { { " " .. blank_icon .. "  ", blank_hl } }, virt_text_pos = "inline" }),
        { type = "exclude", blank = true }
      )
    )
    return lines
  end

  local hls, winhighlight = get_winhighlight()
  local lines = get_lines(hls, pathspecs)

  local popup_options = {
    position = {
      row = "35%",
      col = "50%",
    },
    size = {
      height = "50%",
      width = "50%",
    },
    enter = true,
    relative = "editor",
    border = {
      padding = {
        top = 1,
        bottom = 1,
        left = 3,
        right = 3,
      },
      style = "rounded",
      text = {
        top = " " .. "Glob Patterns" .. " ",
        top_align = "center",
      },
    },
    buf_options = {
      readonly = true,
      buflisted = false,
      bufhidden = "wipe",
    },
    win_options = {
      winhighlight = winhighlight,
    },
  }

  local menu = Menu(popup_options, {
    lines = lines,
    keymap = {
      focus_next = { "j", "<Down>" },
      focus_prev = { "k", "<Up>" },
      close = { "<Esc>", "q" },
      submit = { "<CR>", "i" },
    },
    on_close = function()
      -- HACK: Close anonymous listed buffer
      local buflist = vim.api.nvim_list_bufs()
      for _, bufnr in ipairs(buflist) do
        if (vim.api.nvim_buf_get_name(bufnr) == "") and (vim.fn.buflisted(bufnr) == 1) then
          vim.api.nvim_buf_delete(bufnr, { force = true })
        end
      end

      -- TODO:
      --  [ ] save search kind and query
      --  [ ] add glob pattern to command
      --  [ ] restart the commands here
      print("TODO: resume fzf-lua finder by hand")
    end,
    on_submit = function(item)
      if item.blank == true then
        FzfMenu.fzf_pathspec(opts, item.type)
      else
        FzfMenu.unset_pathspec(item.text:content(), item.type)
        vim.schedule(function()
          FzfMenu.fzf_pathspec(vim.tbl_extend("force", opts, { query = item.text:content() }), item.type)
        end)
      end
    end,
  })

  -- delete from pathspecs
  menu:map("n", "d", function()
    local item = menu.tree:get_node()
    if item == nil then
      return
    end

    FzfMenu.unset_pathspec(item.text:content(), item.type)

    -- reopen
    menu:unmount()
    FzfMenu.fzf_menu(opts)
  end)

  menu:on({ event.BufLeave }, function()
    menu:unmount()
  end, { once = true })

  menu:mount()
end

return FzfMenu
