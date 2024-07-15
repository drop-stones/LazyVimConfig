return {
  {
    "folke/which-key.nvim",
    opts = {
      icons = {
        rules = {
          -- verb
          { pattern = "inspect", icon = " ", color = "red" },
          { pattern = "paste", icon = "󰆒", color = "cyan" },
          { pattern = "clear", icon = "󱘝", color = "red" },
          { pattern = "eval", icon = "󱖦", color = "cyan" },

          -- noun
          { pattern = "list", icon = "", color = "cyan" },
          { pattern = "workspace", icon = "", color = "cyan" },
          { pattern = "widget", icon = "󱍕", color = "cyan" },
          { pattern = "line", icon = "", color = "cyan" },

          -- arrow
          { pattern = "up", icon = "", color = "cyan" },
          { pattern = "down", icon = "", color = "cyan" },

          -- keywordprg
          { pattern = "keywordprg", icon = "", color = "cyan" },

          -- dap
          { pattern = "breakpoint", icon = "", color = "red" },
          { pattern = "run", icon = "", color = "cyan" },
          { pattern = "continue", icon = "", color = "cyan" },
          { pattern = "step in", icon = "", color = "cyan" },
          { pattern = "step out", icon = "", color = "cyan" },
          { pattern = "step over", icon = "", color = "cyan" },
          { pattern = "pause", icon = "", color = "cyan" },
          { pattern = "terminate", icon = "", color = "cyan" },

          -- note taking
          { pattern = "note", icon = "", color = "purple" },

          -- timer
          { pattern = "pomodoro", icon = "", color = "green" },
          { pattern = "timer", icon = "", color = "green" },

          -- toggleterm
          { pattern = "toggleterm", icon = " ", color = "red" },

          -- overseer
          { pattern = "overseer", icon = "", color = "cyan" },
          { pattern = "task", icon = "", color = "cyan" },
        },
      },
    },
  },
}
