local FzfMenu = {}

local NuiText = require("nui.text")
local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event
local Path = require("plenary.path")
local Table = require("util.table")

---@alias Set table<string, boolean>

---@class Pathspecs
---@field include Set
---@field exclude Set

---@alias PathspecType '"include"' | '"exclude"'

---@alias DirExtensionSet table<string, DirExtensions>

---@class SubDirExtensions
---@field extensions Set
---@field dirs DirExtensionSet

---@class DirExtensions
---@field path string
---@field extensions Set
---@field subdirs SubDirExtensions

---@type Pathspecs
local pathspecs = {
  include = {},
  exclude = {},
}

---@type table
local last_opts = {}

---@type string
local last_cmd = ""

---@return string
local get_last_cwd = function()
  return last_opts.cwd
end

--- Calculate all directory and file extension combinations
---@param cwd string
---@return DirExtensions
local calc_dir_extensions = function(cwd)
  ---@param path string
  ---@return DirExtensions
  local function initialize_dir_extensions(path)
    return {
      path = path,
      extensions = {},
      subdirs = {
        extensions = {},
        dirs = {},
      },
    }
  end

  -- NOTE: `fd` is faster than `git ls-files` in my envoronment
  local files = require("util.command").get_os_command_output(
    { "fd", "--color=never", "--type", "f", "--hidden", "--follow", "--exclude", ".git" },
    cwd
  )

  ---@param extensions Set
  ---@param extension string
  local function add_extension(extensions, extension)
    extensions[extension] = true
  end

  local sep = require("util.path").sep()
  local dir_extensions = initialize_dir_extensions("")

  -- Save all file extensions under the directory
  for _, file in ipairs(files) do
    local parent_dirs = require("util.string").split(file, sep)
    local path = ""
    local dir_iter = dir_extensions
    for i, dirname in ipairs(parent_dirs) do
      path = path .. dirname .. "/"
      if i == #parent_dirs then
        local extension = file:match("^.+(%..+)$")
        if extension then
          add_extension(dir_iter.extensions, extension)
        end
      else
        dir_iter.subdirs.dirs[dirname] = dir_iter.subdirs.dirs[dirname] or initialize_dir_extensions(path)
        dir_iter = dir_iter.subdirs.dirs[dirname]
      end
    end
  end

  -- Calculate all file extensions under the subdirectories
  ---@param dir_extensions DirExtensions
  local function calc_extensions_of_subdirs(dir_extensions)
    local subdirs = dir_extensions.subdirs.dirs
    local extensions = dir_extensions.subdirs.extensions

    -- depth-first ordering
    for _, subdir in pairs(subdirs) do
      calc_extensions_of_subdirs(subdir)
    end

    -- Calc extensions set
    for _, subdir in pairs(subdirs) do
      for extension in pairs(subdir.extensions) do
        add_extension(extensions, extension)
      end
      for extension in pairs(subdir.subdirs.extensions) do
        add_extension(extensions, extension)
      end
    end
  end

  calc_extensions_of_subdirs(dir_extensions)

  return dir_extensions
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

---@type function
local fzf_menu

--- Fzf to select pathspec for files/grep
---@param type PathspecType
---@param cwd string?
---@param query string?
local fzf_pathspec = function(type, cwd, query)
  local title = (type == "include") and "Include Patterns" or "Exclude Patterns"
  local opts = {
    cwd = cwd,
    winopts = {
      height = 0.6,
      width = 0.6,
      row = 0.35,
      col = 0.5,
      title = " " .. title .. " ",
      title_pos = "center",
    },
    query = query,
    no_resume = true,
    actions = {
      ["default"] = function(selected, opts)
        if #selected == 0 then
          FzfMenu.set_pathspec(require("fzf-lua").get_last_query(), type)
        else
          for _, sel in ipairs(selected) do
            FzfMenu.set_pathspec(sel, type)
          end
        end

        vim.schedule(function()
          fzf_menu()
        end)
      end,
    },
  }

  require("fzf-lua").fzf_exec(function(fzf_cb)
    coroutine.wrap(function()
      local co = coroutine.running()
      local dir_extensions = calc_dir_extensions(opts.cwd)

      ---@param entry string
      local function fzf_callback_with_coroutine(entry)
        fzf_cb(entry, function()
          coroutine.resume(co)
        end)
        coroutine.yield()
      end

      ---@param dir_extensions DirExtensions
      local function create_pathspec_from_dir_extensions(path, dir_extensions)
        fzf_callback_with_coroutine(path .. "**")

        for extension in pairs(dir_extensions.extensions) do
          fzf_callback_with_coroutine(path .. "*" .. extension)
        end
        for extension in pairs(dir_extensions.subdirs.extensions) do
          fzf_callback_with_coroutine(path .. "**/*" .. extension)
        end

        for _, subdir in pairs(dir_extensions.subdirs.dirs) do
          create_pathspec_from_dir_extensions(subdir.path, subdir)
        end
      end

      create_pathspec_from_dir_extensions("", dir_extensions)

      fzf_cb()
    end)()
  end, opts)
end

--- Open menu to set pathspecs for files/grep
fzf_menu = function()
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
        Menu.item(NuiText(include, { virt_text = { { " " .. icon .. "  ", hl } }, virt_text_pos = "inline" }), { type = "include" })
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
        Menu.item(NuiText(exclude, { virt_text = { { " " .. icon .. "  ", hl } }, virt_text_pos = "inline" }), { type = "exclude" })
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

      local Opts = require("plugins.fuzzy_finder.fzf-lua.opts")
      local opts
      if last_opts.raw_cmd and string.match(last_opts.raw_cmd, "^git%s%-C%s.*%sgrep") ~= nil then
        opts = vim.tbl_deep_extend("force", last_opts, { raw_cmd = Opts.get_gitgrep_cmd(get_last_cwd(), last_opts.search) })
      elseif last_opts.rg_opts and not last_opts.raw_cmd then
        opts = vim.tbl_deep_extend("force", last_opts, { rg_opts = Opts.get_rg_opts() })
      else
        opts = vim.deepcopy(last_opts)
      end
      vim.schedule(function()
        require("fzf-lua")[last_cmd](opts)
      end)
    end,
    on_submit = function(item)
      if item.blank == true then
        fzf_pathspec(item.type, get_last_cwd())
      else
        FzfMenu.unset_pathspec(item.text:content(), item.type)
        vim.schedule(function()
          fzf_pathspec(item.type, get_last_cwd(), item.text:content())
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
    fzf_menu()
  end)

  menu:on({ event.BufLeave }, function()
    menu:unmount()
  end, { once = true })

  menu:mount()
end

---@param opts FzfOpts
FzfMenu.fzf_menu = function(opts)
  local __call_opts = require("fzf-lua.config").__resume_data.opts.__call_opts
  local last_query = require("fzf-lua").get_last_query()
  last_cmd = require("fzf-lua.config").__resume_data.opts.__INFO.cmd
  last_opts = vim.tbl_deep_extend("force", __call_opts, { query = last_query })
  fzf_menu()
end

return FzfMenu
