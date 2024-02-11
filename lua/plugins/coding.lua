return {
  -- Auto IME switch
  {
    "drop-stones/ime-switch-win.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
      mac = {
        default_locale = "com.apple.inputmethod.Kotoeri.RomajiTyping.Roman",
      },
    },
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

  -- Escape by "ｊｋ" (in double-byte character)
  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    opts = {
      mapping = { "ｊｋ" },
      timeout = 150,
    },
  },

  -- Improved Yank and Put
  { import = "lazyvim.plugins.extras.coding.yanky" },
}
