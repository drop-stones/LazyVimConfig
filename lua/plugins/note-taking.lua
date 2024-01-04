return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>z"] = { name = "+zettelkasten" },
      },
    },
  },
  -- markdown zettelkasten
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "renerocksai/calendar-vim" },
    cmd = { "Telekasten" },
    opts = {
      home = vim.fn.expand("~/zettelkasten"),
    },
    keys = {
      { "<leader>zz", "<Cmd>Telekasten panel<CR>", desc = "Open the command palette" },
      { "<leader>zf", "<Cmd>Telekasten find_notes<CR>", desc = "Find notes by title" },
      { "<leader>zg", "<Cmd>Telekasten search_notes<CR>", desc = "Search (grep) in all notes" },
      { "<leader>zd", "<Cmd>Telekasten goto_today<CR>", desc = "Open today's daily note" },
      { "<leader>zl", "<Cmd>Telekasten follow_link<CR>", desc = "Follow the link under the cursor" },
      { "<leader>zn", "<Cmd>Telekasten new_note<CR>", desc = "Create a new note" },
      { "<leader>zc", "<Cmd>Telekasten show_calendar<CR>", desc = "Show the calendar" },
      { "<leader>zb", "<Cmd>Telekasten show_backlinks<CR>", desc = "Show all notes linking to the current one" },
      { "<leader>zI", "<Cmd>Telekasten insert_img_link<CR>", desc = "Insert a link to the image" },
      { "<leader>zt", "<Cmd>Telekasten show_tags<CR>", desc = "Show the tag list" },
    },
  },
  -- calendar for journal in zettelkasten
  {
    "renerocksai/calendar-vim",
    cmd = { "Calendar", "CalendarH", "CalendarT", "CalendarVR", "CalendarSearch" },
  },
}
