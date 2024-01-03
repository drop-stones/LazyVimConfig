return {
  -- keymaps
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        mode = { "n", "v" },
        ["<leader>T"] = { name = "+terminal" },
      },
    },
  },
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "jvgrootveld/telescope-zoxide" },
    keys = {
      -- zoxide
      {
        "<leader>fz",
        "<Cmd>Telescope zoxide list<CR>",
        desc = "Find directories",
      },

      -- diffview
      {
        "<leader>gd",
        "<Cmd>DiffviewOpen<CR>",
        desc = "Open diffview",
      },
      {
        "<leader>gH",
        "<Cmd>DiffviewFileHistory<CR>",
        desc = "Open file history",
      },
    },
    opts = function()
      require("telescope").load_extension("zoxide")
      return {
        defaults = {
          mappings = {
            n = {
              ["jk"] = require("telescope.actions").close,
            },
          },
        },
      }
    end,
  },
  -- terminal
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = { "ToggleTerm" },
    config = true,
    opt = {
      auto_scroll = false,
    },
    keys = {
      {
        "<leader>Tt",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 100, require("lazyvim.util").root.get(), "tab")
        end,
        desc = "ToggleTerm (tab root_dir)",
      },
      {
        "<leader>Tf",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 0, require("lazyvim.util").root.get(), "float")
        end,
        desc = "ToggleTerm (float root_dir)",
      },
      {
        "<leader>Th",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 15, require("lazyvim.util").root.get(), "horizontal")
        end,
        desc = "ToggleTerm (horizontal root_dir)",
      },
      {
        "<leader>Tv",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, vim.o.columns * 0.4, require("lazyvim.util").root.get(), "vertical")
        end,
        desc = "ToggleTerm (vertical root_dir)",
      },
      {
        "<leader>TT",
        function()
          require("toggleterm").toggle(1, 100, vim.loop.cwd(), "tab")
        end,
        desc = "ToggleTerm (tab cwd_dir)",
      },
      {
        "<leader>TF",
        function()
          require("toggleterm").toggle(1, 0, require("lazyvim.util").root.get(), "float")
        end,
        desc = "ToggleTerm (float cwd_dir)",
      },
      {
        "<leader>TH",
        function()
          require("toggleterm").toggle(1, 15, require("lazyvim.util").root.get(), "horizontal")
        end,
        desc = "ToggleTerm (horizontal cwd_dir)",
      },
      {
        "<leader>TV",
        function()
          require("toggleterm").toggle(1, vim.o.columns * 0.4, require("lazyvim.util").root.get(), "vertical")
        end,
        desc = "ToggleTerm (vertical cwd_dir)",
      },
      {
        "<leader>Tn",
        "<cmd>ToggleTermSetName<cr>",
        desc = "Set term name",
      },
      {
        "<leader>Ts",
        "<cmd>TermSelect<cr>",
        desc = "Select term",
      },
    },
  },
  -- project management
  { import = "lazyvim.plugins.extras.util.project" },
}
