local colors = require("tokyonight.colors").setup()
local color = colors.blue

return {
  {
    "shellRaining/hlchunk.nvim",
    event = "LazyFile",
    opts = {
      chunk = {
        enable = true,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "┌",
          left_bottom = "└",
          right_arrow = "─",
        },
        style = color,
        duration = 20,
        delay = 20,
        exclude_filetypes = {
          fzf = true,
        },
      },
      indent = {
        enable = true,
        exclude_filetypes = {
          fzf = true,
        },
      },
    },
  },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
}
