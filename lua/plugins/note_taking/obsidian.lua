return {
  -- obsidian
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>n", group = "note taking", mode = { "n", "v" } },
      },
    },
  },
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
      "epwalsh/pomo.nvim",
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
      -- normal mode
      { "<leader>nn", "<Cmd>ObsidianNew<Cr>", desc = "Create a new note" },
      { "<leader>no", "<Cmd>ObsidianOpen<Cr>", desc = "Open a note in the Obsidian app" },
      { "<leader>nr", "<Cmd>ObsidianRename<Cr>", desc = "Rename the note of the current buffer" },
      { "<leader>nq", "<Cmd>ObsidianQuickSwitch<Cr>", desc = "Quickly switch to anther note" },
      { "<leader>nf", "<Cmd>ObsidianFollowLink<Cr>", desc = "Follow a note reference" },
      {
        "<leader>nv",
        "<Cmd>ObsidianFollowLink vsplit<Cr>",
        desc = "Follow a note reference and open in vertical split",
      },
      {
        "<leader>nh",
        "<Cmd>ObsidianFollowLink hsplit<Cr>",
        desc = "Follow a note reference and open in horizontal split",
      },
      {
        "<leader>nb",
        "<Cmd>ObsidianBacklinks<Cr>",
        desc = "Get a location list of references to the current buffer",
      },
      { "<leader>nd", "<Cmd>ObsidianToday<Cr>", desc = "Open a new daily note" },
      { "<leader>ny", "<Cmd>ObsidianYesterday<Cr>", desc = "Open the daily note for yesterday" },
      { "<leader>nt", "<Cmd>ObsidianTomorrow<Cr>", desc = "Open the daily note for tomorrow" },
      { "<leader>ns", "<Cmd>ObsidianSearch<Cr>", desc = "Search for notes" },
      { "<leader>nw", "<Cmd>ObsidianWorkspace<Cr>", desc = "Switch to another workspace" },
      { "<leader>np", "<Cmd>ObsidianPasteImg<Cr>", desc = "Paste an image from clipboard" },

      -- visual mode
      {
        "<leader>nl",
        function()
          if vim.fn.mode() ~= "v" then
            vim.api.nvim_feedkeys("viw", "n", true)
          end
          local key = vim.api.nvim_replace_termcodes(":ObsidianLink<CR>", true, false, true)
          vim.api.nvim_feedkeys(key, "n", true)
        end,
        mode = { "n", "v" },
        desc = "Link an inline visual selection of text to note",
      },
      {
        "<leader>nc",
        function()
          if vim.fn.mode() ~= "v" then
            vim.api.nvim_feedkeys("viw", "n", true)
          end
          local key = vim.api.nvim_replace_termcodes(":ObsidianLinkNew<CR>", true, false, true)
          vim.api.nvim_feedkeys(key, "n", true)
        end,
        mode = { "n", "v" },
        desc = "Create a new note and link it",
      },
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/vaults/notes",
        },
        {
          name = "books",
          path = "~/vaults/books",
        },
      },

      notes_subdir = "ideas",

      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "dailies",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = "%Y-%m-%d",
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil,
      },

      note_id_func = function(title)
        if title ~= nil then
          -- If title is set, use title as file name
          return title
        else
          local suffix = ""
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
          return tostring(os.time()) .. "-" .. suffix
        end
      end,

      disable_frontmatter = function(filename)
        -- Disable yaml frontmatter for dailies
        if string.match(filename, "dailies/*") ~= nil then
          return true
        end
        return false
      end,

      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },
    },
  },
}
