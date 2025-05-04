return {
  {
    "drop-stones/fzf-lua-normal-mode",
    opts = {
      keys = {
        { key = "j", action = "<Down>" },
        { key = "k", action = "<Up>" },
        { key = "gg", action = "<A-g>" },
        { key = "G", action = "<A-G>" },
        { key = "<C-u>", action = "<C-u>" },
        { key = "<C-d>", action = "<C-d>" },
        { key = "J", action = "<C-f>" },
        { key = "K", action = "<C-b>" },
        { key = "<Tab>", action = "<Tab>" },
        { key = "s", action = "<C-x>", wait_user_input = true },
        { key = "<C-r>", action = "<C-r>", repeatable = true },
        { key = "q", action = "<Esc>", repeatable = false },
        { key = "<Enter>", action = "<CR>", repeatable = false },
        { key = "<C-t>", action = "<C-t>", repeatable = false },
      },
    },
  },
}
