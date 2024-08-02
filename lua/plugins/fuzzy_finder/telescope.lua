return {
  { import = "lazyvim.plugins.extras.editor.telescope" },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Search
      { "<leader>sb", "<Cmd>Telescope live_grep grep_open_files=true<CR>", desc = "Buffer" },
    },
  },
}
