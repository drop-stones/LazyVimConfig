return {
  {
    "pteroctopus/faster.nvim",
    event = "BufReadPre",
    opts = {
      behaviours = {
        bigfile = {
          features_disabled = {
            "matchparen",
            "lsp",
            "treesitter",
            "vimopts",
            "syntax",
            "filetype",
            "nvim-cmp",
          },
          filesize = 1,
        },
      },
      features = {
        ["nvim-cmp"] = {
          on = true,
          defer = false,
          enable = function()
            require("cmp").setup.buffer({ enabled = true })
          end,
          disable = function()
            require("cmp").setup.buffer({ enabled = false })
          end,
        },
      },
    },
  },
}
