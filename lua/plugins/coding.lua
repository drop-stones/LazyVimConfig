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

  -- Escape by "ｊｋ" (in double-byte character)
  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    opts = {
      mappings = {
        i = {
          j = {
            k = "<Esc>",
          },
          ["ｊ"] = {
            ["ｋ"] = "<Esc>",
          },
        },
        c = {
          j = {
            k = "<Esc>",
          },
          ["ｊ"] = {
            ["ｋ"] = "<Esc>",
          },
        },
        t = {
          j = {
            k = "<C-\\><C-N>",
          },
          ["ｊ"] = {
            ["ｋ"] = "<C-\\><C-N>",
          },
        },
        v = {
          j = {
            k = "<Esc>",
          },
          ["ｊ"] = {
            ["ｋ"] = "<Esc>",
          },
        },
        s = {
          j = {
            k = "<Esc>",
          },
          ["ｊ"] = {
            ["ｋ"] = "<Esc>",
          },
        },
      },
      timeout = 150,
    },
  },

  -- Improved Yank and Put
  { import = "lazyvim.plugins.extras.coding.yanky" },

  -- Dim inactivate portions of code
  {
    "folke/twilight.nvim",
    event = "VeryLazy",
  },

  -- Zen mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        width = 1,
      },
      plugins = {
        -- this will change the font size on wezterm when in zen mode
        -- See alse also the Plugins/Wezterm section in this projects README
        wezterm = {
          enabled = false,
          -- can be either an absolute font size or the number of incremental steps
          font = "+20", -- (10% increase per step)
        },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}
