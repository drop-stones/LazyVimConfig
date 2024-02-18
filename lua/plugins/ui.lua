local main_logo = {
  "                                                  ",
  "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
  "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
  "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
  "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
  "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
  "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

local sub_logo = {
  switch = {
    "▄█▀▀▀█  █████▄",
    "█    █  ██████",
    "█ ██ █  ██████",
    "█    █  ██▀▀██",
    "█    █  ██▄▄██",
    "█▄   █  ██████",
    " ▀▀▀▀▀  ▀▀▀▀▀ ",
  },
  pokemon_ball = {
    "   ▄▄▀▀▀▀▄▄   ",
    " ▄▀        ▀▄ ",
    "▄▀          ▀▄",
    "███▄  ▄▀▀▀▄  █",
    "▀▄ ▀▀██   █▀█▀",
    " ▀▄    ▀▀▀ ▄▀ ",
    "   ▀▀▄▄▄▄▀▀   ",
  },
  bulbasaur = {
    "        ▄▄▀▀▀▄▄  ",
    "   ▄ ▄▀▀       ▀▄",
    "  █ ▀█▄         █",
    "▄█     ▀▀▀▄  ▄▄█ ",
    "█    ▄▀▀ ▀ ▀▀ ▄ █",
    " ▀▄▄ ▀   ▄▀  ▄▀▀ ",
    "    ▀▀▀▀▀▀▄▄▄▀   ",
  },
  charmander = {
    "  ▄▀▀▀▄     ▄▀▄ ",
    " █     █   ▄▀  █",
    "█   ▄█  █  ▀▄  █",
    " ▀▄▄▄  ▄ ▀▄▄▀ █ ",
    "   █  ▀▄  █ ▄▀  ",
    "  ▀ ▀█▄▄ ▄█▀    ",
    "      ▀▄▄▄▀     ",
  },
  squirtle = {
    "  ▄▀▀▀▄▄     ▄▀▀▄ ",
    " █      █▀▄ █  ▄ █",
    "█    ▄█    ▀▄ █ ▄▀",
    " ▀▄▄   ▄▄▀  ▀▄█▀  ",
    "  ▀▄▀█▀▄▄█   █    ",
    "    ▀▄█▄▄▄ █▄▀    ",
    "        ▀▄▄▄▀     ",
  },
  pikachu = {
    "   ▄▀█  ▄▄▄▄▀▀▄",
    "  ▄▀ ▀▄▀ ▄▀  ▄▀",
    "▄▀      █▀▄ ▀▄ ",
    "█▀  ▄█   ██▀▄▀ ",
    " ▀▄   ▄▀  █▀   ",
    " ▀▄▀▄▄▄▀▄█     ",
    "  ▀▀▀▀▄▄▄▀     ",
  },
}

return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      -- Get random element from sub_logo
      local keyset = {}
      for k in pairs(sub_logo) do
        table.insert(keyset, k)
      end
      local random_sub_logo = sub_logo[keyset[math.random(#keyset)]]

      local logo = {}

      -- Calculate logo
      for i = 1, #main_logo do
        local str = string.rep(" ", vim.fn.strdisplaywidth(random_sub_logo[i]) + 4)
          .. main_logo[i]
          .. string.rep(" ", 4)
          .. random_sub_logo[i]
        table.insert(logo, str)
      end

      -- Add empty strings
      for _ = 1, 7 do
        table.insert(logo, 1, "")
      end
      for _ = 1, 2 do
        table.insert(logo, "")
      end

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = logo,
          -- stylua: ignore
          center = {
            { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
            { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
            { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
            { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
            { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
            { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
            { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
            { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}
