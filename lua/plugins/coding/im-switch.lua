return {
  -- Auto IME switch
  {
    "drop-stones/im-switch.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
      default_im_events = { "VimEnter", "InsertEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },
      save_im_state_events = {},
      restore_im_events = {},
      windows = {
        enabled = true,
      },
      macos = {
        enabled = true,
        default_im = "com.apple.keylayout.ABC",
      },
      linux = {
        enabled = true,
        default_im = "keyboard-us",
        get_im_command = { "fcitx5-remote", "-n" },
        set_im_command = { "fcitx5-remote", "-s" },
      },
    },
  },
}
