return {
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
}
