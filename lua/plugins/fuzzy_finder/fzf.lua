--- Check whether the current working directory is in a git repository
---@param opts lazyvim.util.pick.Opts?
---@return boolean
local in_worktree = function(opts)
  opts = opts or {}
  local cwd = vim.F.if_nil(opts.cwd, vim.uv.cwd())
  return require("util.command").get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" }, cwd)[1]
end

--- Get title
---@param title string
---@param search_string string?
local get_title = function(title, search_string)
  title = " " .. title .. " "
  if search_string then
    title = title .. "(" .. search_string:gsub("\n", "\\n") .. ") "
  end
  return title
end

--- Get cwd according to git repository
---@param opts lazyvim.util.pick.Opts?
local get_cwd = function(opts)
  local cwd = opts.cwd or vim.uv.cwd()
  if opts.root ~= false then
    local git_root, _, _ = require("util.command").get_os_command_output({ "git", "rev-parse", "--show-toplevel" }, cwd)
    cwd = git_root[1]
  end
  return cwd
end

--- Setup options for gitgrep
---@param opts lazyvim.util.pick.Opts?
---@param search_string string?
local setup_gitgrep_opts = function(opts, search_string)
  local cwd = get_cwd(opts)
  local cmd = "git -C " .. cwd .. " grep --line-number --column --color=always"
  return {
    cmd = cmd,
    winopts = { title = get_title("Git Grep", search_string) },
    cwd = cwd,
  }
end

--- Setup options for rg
---@param opts lazyvim.util.pick.Opts?
---@param search_string string?
local setup_rg_opts = function(opts, search_string)
  opts.winopts = { title = get_title("Grep", search_string) }
  return opts
end

---@param opts lazyvim.util.pick.Opts?
---@return function
local find_files = function(opts)
  opts = opts or {}
  return function()
    if in_worktree(opts) then
      require("fzf-lua").git_files({ cwd = get_cwd(opts) })
    else
      require("lazyvim.util").pick("files", opts)()
    end
  end
end

---@param opts lazyvim.util.pick.Opts?
---@return function
local live_grep = function(opts)
  opts = opts or {}
  return function()
    if in_worktree(opts) then
      require("fzf-lua").live_grep(setup_gitgrep_opts(opts))
    else
      require("lazyvim.util").pick("live_grep", opts)()
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
      require("fzf-lua").grep_cword(setup_gitgrep_opts(opts, search_string))
    else
      require("lazyvim.util").pick("grep_cword", setup_rg_opts(opts, search_string))()
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
      require("fzf-lua").grep_visual(setup_gitgrep_opts(opts, search_string))
    else
      require("lazyvim.util").pick("grep_visual", setup_rg_opts(opts, search_string))()
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
              if keybind.insert then
                return "i" .. keybind.action
              else
                return "i" .. keybind.action .. "<C-\\><C-N>" .. "l" -- "l" is to not move the cursor position
              end
            end, { buffer = true, expr = true, remap = true })
          end
          vim.api.nvim_set_option_value("cursorline", false, { scope = "local" }) -- disable search window highlighting
        end,
      }

      -- files
      opts.files = {
        headers = false, -- hide cwd/action headers
      }

      -- git
      opts.git = {
        files = {
          headers = false, -- hide cwd/action headers
        },
        status = {
          headers = false, -- hide action headers
        },
        commit = {
          headers = false, -- hide action headers
        },
        bcommits = {
          headers = false, -- hide action headers
        },
        branches = {
          headers = false, -- hide action headers
        },
        tags = {
          headers = false, -- hide action headers
        },
        stash = {
          headers = false, -- hide action headers
        },
      }

      -- grep
      opts.grep = {
        headers = false, -- hide headers
        live_ast_prefix = false, -- remove '*' from prompt
      }

      -- args
      opts.args = {
        headers = false, -- hide headers
      }

      -- oldfiles
      opts.oldfiles = {
        headers = false, -- hide headers
      }

      -- buffers
      opts.buffers = {
        headers = false, -- hide headers
      }

      -- tabs
      opts.tabs = {
        headers = false, -- hide headers
      }

      -- lines
      opts.lines = {
        headers = false, -- hide headers
      }

      -- previewer
      opts.previewers = {
        builtin = {
          extensions = {
            ["png"] = { "viu", "-b" },
            ["jpg"] = { "viu", "-b" },
            ["svg"] = { "chafa", "-f", "symbols" },
          },
        },
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
        { "<leader>ff", find_files(), desc = "Find Files (Root Dir)" },
        { "<leader>fF", find_files({ root = false }), desc = "Find Files (cwd)" },
      }

      local remove_keys = {
        { "<leader>fg" },
      }

      local keys = {}
      for _, v in ipairs(fzf_keys) do
        local overwrite = false
        for _, additional_key in ipairs(additional_keys) do
          if v[1] == additional_key[1] then
            overwrite = true
          end
        end

        local remove = false
        for _, remove_key in ipairs(remove_keys) do
          if v[1] == remove_key[1] then
            remove = true
          end
        end

        if (overwrite == false) and (remove == false) then
          table.insert(keys, v)
        end
      end

      for _, v in ipairs(additional_keys) do
        table.insert(keys, v)
      end
      return keys
    end,
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, _)
      local dashboard = require("alpha.themes.dashboard")

      ---@param shortcut string
      ---@param txt string
      ---@param callback function
      local generate_button = function(shortcut, txt, callback)
        local button = dashboard.button(shortcut, txt, callback)
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
        return button
      end

      for idx, button in ipairs(dashboard.section.buttons.val) do
        if string.find(button.val, "Find file") then
          dashboard.section.buttons.val[idx] = generate_button(button.opts.shortcut, button.val, find_files())
        elseif string.find(button.val, "Find text") then
          dashboard.section.buttons.val[idx] = generate_button(button.opts.shortcut, button.val, live_grep())
        end
      end
    end,
  },
}
