return {
  {
    "drop-stones/ime-switch-win.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "InsertEnter",
  },
  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    opts = {
      mapping = { "jk", "ｊｋ" },
      timeout = 300,
      keys = function()
        return vim.api.nvim_win_get_cursor(0)[2] > 1 and "<Esc>l" or "<Esc>"
      end,
    },
  },
}
