return {
  -- Obsidian 🤝 Neovim
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>o", group = "obsidian", mode = { "n", "v" } },
      },
    },
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- latest release
    ft = "markdown",
    keys = {
      -- Note
      { "<leader>on", "<Cmd>Obsidian new<Cr>", desc = "New note" },
      { "<leader>oN", "<Cmd>Obsidian new_from_template<Cr>", desc = "New from template" },
      -- Daily Notes
      { "<leader>od", "<Cmd>Obsidian dailies<Cr>", desc = "Dailies picker" },
      { "<leader>ot", "<Cmd>Obsidian today<Cr>", desc = "Today note" },
      { "<leader>oT", "<Cmd>Obsidian tomorrow<Cr>", desc = "Tomorrow note" },
      { "<leader>oy", "<Cmd>Obsidian yesterday<Cr>", desc = "Yesterday note" },
      -- Search
      { "<leader>of", "<Cmd>Obsidian quick_switch<Cr>", desc = "Find Note" },
      { "<leader>os", "<Cmd>Obsidian search<Cr>", desc = "Search for notes" },
      { "<leader>og", "<Cmd>Obsidian tags<Cr>", desc = "Find by Tag(s)" },
      { "<leader>ow", "<Cmd>Obsidian workspace<Cr>", desc = "Switch workspace" },
      -- Help
      { "<leader>o?", "<Cmd>Obsidian help<Cr>", desc = "Find in help wiki" },
      { "<leader>o/", "<Cmd>Obsidian helpgrep<Cr>", desc = "Grep in help wiki" },
      -- Commands in Note
      { "<leader>or", "<Cmd>Obsidian rename<Cr>", desc = "Rename note" },
      { "<leader>op", "<Cmd>Obsidian template<Cr>", desc = "Insert template" },
      { "<leader>ob", "<Cmd>Obsidian backlinks<Cr>", desc = "Backlinks picker" },
      { "<leader>ok", "<Cmd>Obsidian links<Cr>", desc = "Links picker" },
      { "<leader>oo", "<Cmd>Obsidian follow_link<Cr>", desc = "Follow link" },
      { "<leader>oC", "<Cmd>Obsidian toc<Cr>", desc = "Table of contents picker" },
      { "<leader>oi", "<Cmd>Obsidian paste_img<Cr>", desc = "Paste image" },
      { "<leader>oc", "<Cmd>Obsidian toggle_checkbox<Cr>", desc = "Toggle checkbox" },
      -- Visual Mode
      { "<leader>ox", "<Cmd>Obsidian extract_note<Cr>", desc = "Extract to new note", mode = { "v" } },
      { "<leader>ol", "<Cmd>Obsidian link<Cr>", desc = "Link to note", mode = { "v" } },
      { "<leader>oL", "<Cmd>Obsidian link_new<Cr>", desc = "Link to new note", mode = { "v" } },
    },

    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      -- legacy options
      legacy_commands = false,
      notes_subdir = "inbox",
      new_note_location = "new_notes_location",

      ---@type obsidian.config.TemplateOpts
      templates = {
        folder = "templates",
      },

      ---@type obsidian.config.DailyNotesOpts
      daily_notes = {
        folder = "daily",
      },

      workspaces = {
        {
          name = "vault",
          path = "~/vault",
          strict = true, -- use the `path` as the workspace/vault root
        },
      },
    },
  },
}
