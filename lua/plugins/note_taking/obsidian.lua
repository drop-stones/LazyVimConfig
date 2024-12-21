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
      "ibhagwan/fzf-lua",
      "hrsh7th/nvim-cmp",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = {
      "ObsidianOpen",
      "ObsidianNew",
      "ObsidianQuickSwitch",
      "ObsidianToday",
      "ObsidianYesterday",
      "ObsidianTomorrow",
      "ObsidianDailies",
      "ObsidianSearch",
      "ObsidianWorkspace",
      "ObsidianNewFromTemplate",
    },
    keys = {
      -- normal mode
      { "<leader>nn", "<Cmd>ObsidianNew<Cr>", desc = "Create a new note" },
      { "<leader>no", "<Cmd>ObsidianOpen<Cr>", desc = "Open a note in the Obsidian app" },
      { "<leader>nr", "<Cmd>ObsidianRename<Cr>", desc = "Rename the note of the current buffer" },
      { "<leader>nf", "<Cmd>ObsidianQuickSwitch<Cr>", desc = "Find note" },
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
      { "<leader>ng", "<Cmd>ObsidianSearch<Cr>", desc = "Search for notes" },
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
          name = "personal",
          path = "~/.config/obsidian/vaults/personal",
        },
        {
          name = "work",
          path = "~/.config/obsidian/vaults/work",
        },
      },

      -- Optional, if you keep notes in a specific subdirectory of your vault.
      notes_subdir = "notes",

      -- Where to put new notes. Valid options are
      --  * "current_dir" - put new notes in same directory as the current buffer.
      --  * "notes_subdir" - put new notes in the default notes subdirectory.
      new_notes_location = "notes_subdir",

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

      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
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

      -- Either 'wiki' or 'markdown'.
      preferred_link_style = "markdown",

      -- Optional, boolean or a function that takes a filename and returns a boolean.
      -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
      ---@param filename string
      ---@return boolean
      disable_frontmatter = function(filename)
        -- Disable yaml frontmatter for dailies
        if string.match(filename, "dailies/*") ~= nil then
          return true
        end
        return false
      end,

      picker = {
        -- Set your preferred picker
        name = "fzf-lua",
      },

      -- Optional, configure additional syntax highlighting / extmarks.
      -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
      ui = {
        -- Define how various check-boxes are displayed
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
        },
      },
    },
  },
}
