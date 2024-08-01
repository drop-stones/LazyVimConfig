return {
  -- bigfile.nvim: disable features when editing big files
  {
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
    opts = {},
  },
}
