return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(highlights, colors)
        local util = require("tokyonight.util")

        -- Line number
        highlights.LineNr = { fg = util.lighten(highlights.LineNr.fg, 0.8) }
        highlights.LineNrAbove = { fg = util.lighten(highlights.LineNrAbove.fg, 0.8) }
        highlights.LineNrBelow = { fg = util.lighten(highlights.LineNrBelow.fg, 0.8) }

        -- flash.nvim
        highlights.FlashLabel = { bg = colors.bg_highlight, fg = colors.magenta2, bold = true }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
