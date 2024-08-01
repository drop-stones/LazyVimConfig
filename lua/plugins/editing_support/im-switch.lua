return {
  -- Auto IME switch
  {
    "drop-stones/im-switch.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
      set_previous_im_events = {},
      save_im_events = {},
      windows = {
        enabled = true,
      },
      mac = {
        enabled = true,
        default_im = "com.apple.inputmethod.Kotoeri.RomajiTyping.Roman",
      },
      linux = {
        enabled = true,
        default_im = "keyboard-us",
        obtain_im_command = { "fcitx5-remote", "-n" },
        set_im_command = { "fcitx5-remote", "-s" },
      },
    },
  },
}
