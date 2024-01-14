return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>o"] = { name = "+obsidian" },
        ["<leader>P"] = { name = "+pomodoro" },
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
      { "<leader>on", "<Cmd>ObsidianNew<Cr>", desc = "Create a new note" },
      { "<leader>oo", "<Cmd>ObsidianOpen<Cr>", desc = "Open a note in the Obsidian app" },
      { "<leader>or", "<Cmd>ObsidianRename<Cr>", desc = "Rename the note of the current buffer" },
      { "<leader>oq", "<Cmd>ObsidianQuickSwitch<Cr>", desc = "Quickly switch to anther note" },
      { "<leader>of", "<Cmd>ObsidianFollowLink<Cr>", desc = "Follow a note reference" },
      { "<leader>ob", "<Cmd>ObsidianBacklinks<Cr>", desc = "Get a location list of references to the current buffer" },
      { "<leader>od", "<Cmd>ObsidianToday<Cr>", desc = "Open a new daily note" },
      { "<leader>oy", "<Cmd>ObsidianYesterday<Cr>", desc = "Open the daily note for yesterday" },
      { "<leader>ot", "<Cmd>ObsidianTomorrow<Cr>", desc = "Open the daily note for tomorrow" },
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

      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },
    },
  },

  -- pomodoro
  {
    "epwalsh/pomo.nvim",
    version = "*", -- Recommended, use latest release instead of latest commit
    cmd = { "TimerStart", "TimerRepeat" },
    keys = {
      { "<leader>Ps", "<Cmd>TimerStart 25m<Cr>", desc = "Start a new timer (default 25m)" },
      { "<leader>Px", "<Cmd>TimerStop<Cr>", desc = "Stop a running timer" },
      { "<leader>Pr", "<Cmd>TimerRepeat<Cr>", desc = "Repeat a timer" },
      { "<leader>Ph", "<Cmd>TimerHide<Cr>", desc = "Hide the notifiers of a running timer" },
      { "<leader>PS", "<Cmd>TimerShow<Cr>", desc = "Show the notifiers of a running timer" },
      { "<leader>Pp", "<Cmd>TimerPause<Cr>", desc = "Pause a timer" },
      { "<leader>PR", "<Cmd>TimerResume<Cr>", desc = "Resume a timer" },
    },
    dependencies = {
      -- Optional, but highly recommended if you want to use the "Default" timer
      "rcarriga/nvim-notify",
    },
    opts = {
      -- See below for full list of options 👇
      notifiers = {
        {
          name = "Default",
          opts = {
            sticky = false,
          },
        },
      },
    },
  },
}
