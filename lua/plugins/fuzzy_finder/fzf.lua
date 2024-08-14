local func = require("vim.func")
---@param opts lazyvim.util.pick.Opts?
---@return boolean
local in_worktree = function(opts)
  opts = opts or {}
  local cwd = vim.F.if_nil(opts.cwd, vim.uv.cwd())
  return require("util.command").get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" }, cwd)[1]
end

--- Setup options for fzf-lua commands
---@param opts lazyvim.util.pick.Opts?
---@param is_gitgrep boolean
---@param search_string string?
---@return table
local setup_opts = function(opts, is_gitgrep, search_string)
  -- title
  local title = (is_gitgrep and " Git Grep ") or " Grep "
  if search_string then
    title = title .. "(" .. search_string:gsub("\n", "\\n") .. ") "
  end

  if is_gitgrep then
    -- cwd
    local cwd = opts.cwd or vim.uv.cwd()
    if opts.root ~= false then
      local git_root, _, _ =
        require("util.command").get_os_command_output({ "git", "rev-parse", "--show-toplevel" }, cwd)
      cwd = git_root[1]
    end
    -- return options
    return {
      cmd = "git grep --line-number --column --color=always",
      winopts = { title = title },
      cwd = cwd,
    }
  else
    ---@type table
    local fzf_opts = (opts and vim.deepcopy(opts)) or {}
    fzf_opts.winopts = { title = title }
    return fzf_opts
  end
end

---@param opts lazyvim.util.pick.Opts?
---@return function
local live_grep = function(opts)
  opts = opts or {}
  return function()
    if in_worktree(opts) then
      require("fzf-lua").live_grep(setup_opts(opts, true))
    else
      require("lazyvim.util").pick("live_grep", setup_opts(opts, false))()
    end
  end
end

---@param opts lazyvim.util.pick.Opts?
---@return function
local grep_cword = function(opts)
  opts = opts or {}
  return function()
    local search_string = vim.fn.expand("<cword>")
    if in_worktree(opts) then
      require("fzf-lua").grep_cword(setup_opts(opts, true, search_string))
    else
      require("lazyvim.util").pick("grep_cword", setup_opts(opts, false, search_string))()
    end
  end
end

---@param opts lazyvim.util.pick.Opts?
---@return function
local grep_visual = function(opts)
  opts = opts or {}
  return function()
    local search_string, _ = require("fzf-lua.utils").get_visual_selection()
    if in_worktree(opts) then
      require("fzf-lua").grep_visual(setup_opts(opts, true, search_string))
    else
      require("lazyvim.util").pick("grep_visual", setup_opts(opts, false, search_string))()
    end
  end
end

return {
  { import = "lazyvim.plugins.extras.editor.fzf" },
  {
    "ibhagwan/fzf-lua",
    opts = function(_, fzf_opts)
      local opts = {}

      -- winopts
      local keymap = {
        -- motion
        { key = "j", action = "<Down>" },
        { key = "k", action = "<Up>" },
        { key = "<Down>", action = "<Down>" },
        { key = "<Up>", action = "<Up>" },
        { key = "gg", action = "<A-G>" }, -- first
        { key = "G", action = "<A-g>" }, -- end
        { key = "<C-u>", action = "<C-u>" }, -- page-up
        { key = "<C-d>", action = "<C-d>" }, --page-down
        { key = "s", action = "<C-x>", insert = true }, -- jump
        -- preview
        { key = "J", action = "<C-f>" },
        { key = "K", action = "<C-b>" },
        -- quit
        { key = "q", action = "<Esc>" },
        -- select
        { key = "<Enter>", action = "<Enter>" },
      }
      opts.winopts = {
        on_create = function()
          for _, keybind in ipairs(keymap) do
            vim.keymap.set("n", keybind.key, function()
              vim.cmd("startinsert")
              vim.api.nvim_input(keybind.action)
              if (keybind.insert == nil) or (keybind.insert ~= true) then
                vim.schedule(function()
                  vim.cmd("stopinsert")
                end)
              end
            end, { buffer = true })
          end
        end,
      }

      -- grep
      opts.grep = {
        live_ast_prefix = false, -- remove '*' from prompt
      }

      return vim.tbl_deep_extend("force", fzf_opts, opts)
    end,
    keys = function(_, fzf_keys)
      local additional_keys = {
        { "<leader>/", live_grep(), desc = "Grep (Root Dir)" },
        { "<leader>sg", live_grep(), desc = "Grep (Root Dir)" },
        { "<leader>sG", live_grep({ root = false }), desc = "Grep (cwd)" },
        { "<leader>sw", grep_cword(), desc = "Word (Root Dir)" },
        { "<leader>sW", grep_cword({ root = false }), desc = "Word (cwd)" },
        { "<leader>sw", grep_visual(), mode = "v", desc = "Selection (Root Dir)" },
        { "<leader>sW", grep_visual({ root = false }), mode = "v", desc = "Selection (cwd)" },
      }

      local keys = {}
      for _, v in ipairs(fzf_keys) do
        local overwrite = false
        for _, additional_key in ipairs(additional_keys) do
          if v[1] == additional_key[1] then
            overwrite = true
          end
        end

        if overwrite == false then
          table.insert(keys, v)
        end
      end

      keys = vim.tbl_extend("force", keys, additional_keys)
      return keys
    end,
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, _)
      local dashboard = require("alpha.themes.dashboard")
      for idx, button in ipairs(dashboard.section.buttons.val) do
        if string.find(button.val, "Find text") then
          local button = dashboard.button(button.opts.shortcut, button.val, live_grep())
          button.opts.hl = "AlphaButtons"
          button.opts.hl_shortcut = "AlphaShortcut"

          dashboard.section.buttons.val[idx] = button
        end
      end
    end,
  },
}
