return {
  {
    "folke/which-key.nvim",
    opts = {
      icons = {
        rules = {
          -- nvim default keys
          { pattern = "uppercase", icon = "󰬶", color = "green" },
          { pattern = "lowercase", icon = "󰬵", color = "green" },
          { pattern = "keywordprg", icon = "", color = "cyan" },

          -- verb
          { pattern = "help", icon = "󰋖", color = "blue" },
          { pattern = "delete", icon = "󰆴", color = "red" },
          { pattern = "inspect", icon = " ", color = "red" },
          { pattern = "paste", icon = "󰆒", color = "cyan" },
          { pattern = "clear", icon = "󱘝", color = "red" },
          { pattern = "eval", icon = "󱖦", color = "cyan" },
          { pattern = "fold", icon = "", color = "cyan" },
          { pattern = "visual", icon = "󰒅", color = "cyan" },
          { pattern = "goto", icon = "", color = "cyan" },
          { pattern = "replace", icon = "󰬲", color = "cyan" },
          { pattern = "change", icon = "", color = "cyan" },

          -- noun
          { pattern = "list", icon = "", color = "cyan" },
          { pattern = "workspace", icon = "", color = "cyan" },
          { pattern = "widget", icon = "󱍕", color = "cyan" },
          { pattern = "line", icon = "", color = "cyan" },
          { pattern = "keymaps", icon = "", color = "cyan" },

          -- direction
          { pattern = "up", icon = " ", color = "blue" },
          { pattern = "down", icon = " ", color = "blue" },
          { pattern = "right", icon = " ", color = "blue" },
          { pattern = "left", icon = " ", color = "blue" },

          -- position
          { pattern = "next", icon = "󰒭", color = "azure" },
          { pattern = "prev", icon = "󰒮", color = "azure" },
          { pattern = "around", icon = "󰅪", color = "azure" },
          { pattern = "inside", icon = "󰅲", color = "azure" },
          { pattern = "matching", icon = "󰅪", color = "azure" },

          -- comment
          { pattern = "comment", icon = "", color = "cyan" },

          -- surround
          { pattern = "surround", icon = "󰉾", color = "cyan" },

          -- dap
          { pattern = "breakpoint", icon = "", color = "red" },
          { pattern = "run", icon = "", color = "cyan" },
          { pattern = "continue", icon = "", color = "cyan" },
          { pattern = "step in", icon = "", color = "cyan" },
          { pattern = "step out", icon = "", color = "cyan" },
          { pattern = "step over", icon = "", color = "cyan" },
          { pattern = "pause", icon = "", color = "cyan" },
          { pattern = "terminate", icon = "", color = "cyan" },

          -- flash.nvim
          { pattern = "flash", icon = "⚡", color = "yellow" },

          -- obsidian
          { pattern = "obsidian", icon = "", color = "purple" },
        },
      },
    },
  },
}
