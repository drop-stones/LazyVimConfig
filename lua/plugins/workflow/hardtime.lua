return {
  -- hardtime.nvim
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>mh", group = "hardtime", mode = { "n", "v" } },
      },
    },
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    event = "LazyFile",
    opts = {},
    keys = {
      {
        "<leader>mhe",
        "<Cmd>Hardtime enable<CR>",
        desc = "Enable hardtime.nvim",
      },
      {
        "<leader>mhd",
        "<Cmd>Hardtime disable<CR>",
        desc = "Disable hardtime.nvim",
      },
      {
        "<leader>mht",
        "<Cmd>Hardtime toggle<CR>",
        desc = "Toggle hardtime.nvim",
      },
      {
        "<leader>mhr",
        "<Cmd>Hardtime report<CR>",
        desc = "Reposrt the most frequently hints",
      },
    },
  },
}
