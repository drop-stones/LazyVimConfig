return {
  {
    "folke/flash.nvim",
    opts = {
      label = {
        min_pattern_length = 2,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      -- Change flash highlights
      on_highlights = function(highlights, colors)
        highlights.FlashLabel = { bg = colors.bg_highlight, fg = colors.magenta2, bold = true }
      end,
    },
  },
}
