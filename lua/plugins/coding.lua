return {
  -- Auto IME switch
  {
    "drop-stones/ime-switch-win.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "LazyFile",
    enabled = function()
      if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 or vim.fn.has("wsl") == 1 then
        return true
      end
      return false
    end,
  },
  -- Escape by "jk"
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
