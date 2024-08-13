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
      ---@param opts lazyvim.util.pick.Opts?
      ---@return boolean
      local in_worktree = function(opts)
        opts = opts or {}
        local cwd = vim.F.if_nil(opts.cwd, vim.uv.cwd())
        return require("util.command").get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" }, cwd)[1]
      end

      --- Setup git_grep options for fzf-lua commands
      ---@param opts lazyvim.util.pick.Opts?
      ---@return table
      local setup_gitgrep_opts = function(opts)
        -- get cwd
        opts = opts or {}
        local cwd = vim.F.if_nil(opts.cwd, vim.uv.cwd())
        if opts.root ~= false then
          local git_root, _, _ =
            require("util.command").get_os_command_output({ "git", "rev-parse", "--show-toplevel" }, cwd)
          cwd = git_root[1]
        end
        -- return options
        return {
          cmd = "git grep --line-number --column --color=always",
          winopts = { title = "Git Grep" },
          cwd = cwd,
        }
      end

      ---@param opts lazyvim.util.pick.Opts?
      ---@return function
      local live_grep = function(opts)
        opts = opts or {}
        if in_worktree(opts) then
          return function()
            require("fzf-lua").live_grep(setup_gitgrep_opts(opts))
          end
        else
          return require("lazyvim.util").pick("live_grep", opts)
        end
      end

      ---@param opts lazyvim.util.pick.Opts?
      ---@return function
      local grep_cword = function(opts)
        opts = opts or {}
        if in_worktree(opts) then
          return function()
            require("fzf-lua").grep_cword(setup_gitgrep_opts(opts))
          end
        else
          return require("lazyvim.util").pick("grep_cword", opts)
        end
      end

      ---@param opts lazyvim.util.pick.Opts?
      ---@return function
      local grep_visual = function(opts)
        opts = opts or {}
        if in_worktree(opts) then
          return function()
            require("fzf-lua").grep_visual(setup_gitgrep_opts(opts))
          end
        else
          return require("lazyvim.util").pick("grep_visual", opts)
        end
      end

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
}
