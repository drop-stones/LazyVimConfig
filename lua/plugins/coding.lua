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
    "TheBlob42/houdini.nvim",
    event = "VeryLazy",
    opts = {
      mapping = { "jk", "ｊｋ" },
      timeout = 150,
      escape_sequences = {
        ["t"] = function(_, _)
          if vim.opt.filetype:get() == "lazyterm" then
            return "<BS><BS><ESC>" -- <BS> is needed when entering commit messages
          end

          return "<BS><BS><C-\\><C-n>"
        end,
      },
    },
  },
}
