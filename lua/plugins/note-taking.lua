return {
  -- obsidian
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>o", group = "obsidian", mode = { "n", "v" } },
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
      { "<leader>on", "<Cmd>ObsidianNew<Cr>", desc = "Create a new note" },
      { "<leader>oo", "<Cmd>ObsidianOpen<Cr>", desc = "Open a note in the Obsidian app" },
      { "<leader>or", "<Cmd>ObsidianRename<Cr>", desc = "Rename the note of the current buffer" },
      { "<leader>oq", "<Cmd>ObsidianQuickSwitch<Cr>", desc = "Quickly switch to anther note" },
      { "<leader>of", "<Cmd>ObsidianFollowLink<Cr>", desc = "Follow a note reference" },
      {
        "<leader>ov",
        "<Cmd>ObsidianFollowLink vsplit<Cr>",
        desc = "Follow a note reference and open in vertical split",
      },
      {
        "<leader>oh",
        "<Cmd>ObsidianFollowLink hsplit<Cr>",
        desc = "Follow a note reference and open in horizontal split",
      },
      { "<leader>ob", "<Cmd>ObsidianBacklinks<Cr>", desc = "Get a location list of references to the current buffer" },
      { "<leader>od", "<Cmd>ObsidianToday<Cr>", desc = "Open a new daily note" },
      { "<leader>oy", "<Cmd>ObsidianYesterday<Cr>", desc = "Open the daily note for yesterday" },
      { "<leader>ot", "<Cmd>ObsidianTomorrow<Cr>", desc = "Open the daily note for tomorrow" },
      { "<leader>os", "<Cmd>ObsidianSearch<Cr>", desc = "Search for notes" },
      { "<leader>ow", "<Cmd>ObsidianWorkspace<Cr>", desc = "Switch to another workspace" },
      { "<leader>op", "<Cmd>ObsidianPasteImg<Cr>", desc = "Paste an image from clipboard" },

      -- visual mode
      {
        "<leader>ol",
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
        "<leader>oc",
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

  -- pomodoro
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>P", group = "pomodoro" },
      },
    },
  },
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
