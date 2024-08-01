return {
  -- pomodoro
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>P", group = "pomodoro" },
      },
    },
  },
  {
    "epwalsh/pomo.nvim",
    version = "*", -- Recommended, use latest release instead of latest commit
    cmd = { "TimerStart", "TimerRepeat" },
    keys = {
      { "<leader>Ps", "<Cmd>TimerStart 25m<Cr>", desc = "Start a new timer (default 25m)" },
      { "<leader>Px", "<Cmd>TimerStop<Cr>", desc = "Stop a running timer" },
      { "<leader>Pr", "<Cmd>TimerRepeat<Cr>", desc = "Repeat a timer" },
      { "<leader>Ph", "<Cmd>TimerHide<Cr>", desc = "Hide the notifiers of a running timer" },
      { "<leader>PS", "<Cmd>TimerShow<Cr>", desc = "Show the notifiers of a running timer" },
      { "<leader>Pp", "<Cmd>TimerPause<Cr>", desc = "Pause a timer" },
      { "<leader>PR", "<Cmd>TimerResume<Cr>", desc = "Resume a timer" },
    },
    dependencies = {
      -- Optional, but highly recommended if you want to use the "Default" timer
      "rcarriga/nvim-notify",
    },
    opts = {
      -- See below for full list of options 👇
      notifiers = {
        {
          name = "Default",
          opts = {
            sticky = false,
          },
        },
      },
    },
  },
}
