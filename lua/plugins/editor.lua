return {
  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
        mappings = {
          ["e"] = function()
            vim.api.nvim_command("Neotree focus filesystem")
          end,
          ["b"] = function()
            vim.api.nvim_command("Neotree focus buffers")
          end,
          ["s"] = function()
            vim.api.nvim_command("Neotree focus git_status")
          end,
        },
      },
    },
  },

  -- git diff view
  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    opts = function()
      local actions = require("diffview.actions")
      local toggle_files = {
        { "n", "v" },
        "<leader>e",
        actions.toggle_files,
        { desc = "Toggle the file panel." },
      }
      local close_diffview = {
        { "n", "v" },
        "<leader>gx",
        "<Cmd>DiffviewClose<CR>",
        { desc = "Close diffview" },
      }

      return {
        file_panel = {
          win_config = {
            position = "right",
          },
        },
        keymaps = {
          view = { toggle_files, close_diffview },
          file_panel = { toggle_files, close_diffview },
          file_history_panel = { toggle_files, close_diffview },
        },
      }
    end,
  },

  -- bigfile.nvim: disable features when editing big files
  {
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
    opts = {},
  },

  -- code outline window
  { import = "lazyvim.plugins.extras.editor.aerial" },

  -- Harpoon2: go to the files you want
  { import = "lazyvim.plugins.extras.editor.harpoon2" },
}
