return {
  -- Auto IME switch
  {
    "drop-stones/im-switch.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
      mac = {
        default_im = "com.apple.inputmethod.Kotoeri.RomajiTyping.Roman",
      },
      linux = {
        switch_to_default_im_command = "fcitx5-remote -c",
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
