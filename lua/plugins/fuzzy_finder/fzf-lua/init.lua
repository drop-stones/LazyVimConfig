return {
  { import = "lazyvim.plugins.extras.editor.fzf" },
  {
    "ibhagwan/fzf-lua",
    opts = function(_, fzf_opts)
      local opts = {}

      -- winopts
      local mappings = require("plugins.fuzzy_finder.fzf-lua.mappings")
      opts.winopts = {
        on_create = function()
          mappings.setup_normal_keymap()
        end,
      }

      -- files
      opts.files = {
        headers = false, -- hide cwd/action headers
      }

      -- git
      opts.git = {
        files = {
          cmd = "git ls-files --exclude-standard --cached --others",
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
        actions = {
          ["alt-m"] = function(_, opts)
            vim.schedule(function()
              require("plugins.fuzzy_finder.fzf-lua.menu").fzf_menu(opts)
            end)
          end,
        },
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

      local actions = require("fzf-lua.actions")
      opts.actions = {
        files = {
          -- instead of the default action 'actions.file_edit_or_qf'
          -- it's important to define all other actions here as this
          -- table does not get merged with the global defaults
          ["default"] = actions.file_edit,
          ["ctrl-s"] = actions.file_split,
          -- NOTE: Disable to paste from clipboard by fzf settings
          -- ["ctrl-v"] = actions.file_vsplit,
          ["ctrl-t"] = actions.file_tabedit,
          ["alt-q"] = actions.file_sel_to_qf,
        },
      }

      return vim.tbl_deep_extend("force", fzf_opts, opts)
    end,
    keys = function(_, fzf_keys)
      return require("plugins.fuzzy_finder.fzf-lua.mappings").setup_fzf_keymap(fzf_keys)
    end,
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, _)
      local dashboard = require("alpha.themes.dashboard")
      local cmds = require("plugins.fuzzy_finder.fzf-lua.cmds")

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
          dashboard.section.buttons.val[idx] = generate_button(button.opts.shortcut, button.val, cmds.find_files())
        elseif string.find(button.val, "Find text") then
          dashboard.section.buttons.val[idx] = generate_button(button.opts.shortcut, button.val, cmds.live_grep())
        end
      end
    end,
  },
}
