return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>o"] = { name = "+obsidian" },
      },
    },
  },

  -- obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommend, use latest release instead of latest commit
    ft = "markdown",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- Optional
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = {
      "ObsidianNew",
      "ObsidianOpen",
      "ObsidianQuickSwitch",
      "ObsidianToday",
      "ObsidianYesterday",
      "ObsidianTomorrow",
      "ObsidianSearch",
      "ObsidianWorkspace",
    },
    keys = {
      { "<leader>on", "<Cmd>ObsidianNew<Cr>", desc = "Create a new note" },
      { "<leader>oo", "<Cmd>ObsidianOpen<Cr>", desc = "Open a note in the Obsidian app" },
      { "<leader>or", "<Cmd>ObsidianRename<Cr>", desc = "Rename the note of the current buffer" },
      { "<leader>oq", "<Cmd>ObsidianQuickSwitch<Cr>", desc = "Quickly switch to anther note" },
      { "<leader>of", "<Cmd>ObsidianFollowLink<Cr>", desc = "Follow a note reference" },
      { "<leader>ob", "<Cmd>ObsidianBacklinks<Cr>", desc = "Get a location list of references to the current buffer" },
      { "<leader>ot", "<Cmd>ObsidianToday<Cr>", desc = "Open a new daily note" },
      { "<leader>oy", "<Cmd>ObsidianYesterday<Cr>", desc = "Open the daily note for yesterday" },
      { "<leader>oT", "<Cmd>ObsidianTomorrow<Cr>", desc = "Open the daily note for tomorrow" },
      { "<leader>os", "<Cmd>ObsidianSearch<Cr>", desc = "Search for notes" },
      { "<leader>ol", "<Cmd>ObsidianLink<Cr>", desc = "Link an inline visual selection of text to note" },
      { "<leader>oL", "<Cmd>ObsidianLinkNew<Cr>", desc = "Create a new note and link it" },
      { "<leader>ow", "<Cmd>ObsidianWorkspace<Cr>", desc = "Switch to another workspace" },
      { "<leader>op", "<Cmd>ObsidianPasteImg<Cr>", desc = "Paste an image from clipboard" },
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/vaults/notes",
        },
      },
    },
  },
}
