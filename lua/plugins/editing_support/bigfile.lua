return {
  -- bigfile.nvim: disable features when editing big files
  {
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
    opts = {
      filesize = 1, -- 1 MB
      features = {
        "lsp",
        "treesitter",
        "syntax",
        "filetype",
        "vimopts",
        "matchparen",
        {
          name = "nvim-cmp",
          disable = function()
            require("cmp").setup.buffer({ enabled = false })
          end,
        },
        {
          name = "yanky.nvim",
          disable = function()
            require("lazyvim.util").get_plugin("yanky.nvim").keys = {}
          end,
        },
      },
    },
  },
}
