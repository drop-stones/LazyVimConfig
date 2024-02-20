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
  { "nvimdev/dashboard-nvim", enabled = false },
  { "echasnovski/mini.starter", enabled = false },
  -- Dashboard. This runs when neovim starts, and is what displays
  -- the "LAZYVIM" banner.
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

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

      dashboard.section.header.val = logo
      -- stylua: ignore
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files <cr>"),
        dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
        dashboard.button("r", " " .. " Recent files",    "<cmd> Telescope oldfiles <cr>"),
        dashboard.button("g", " " .. " Find text",       "<cmd> Telescope live_grep <cr>"),
        dashboard.button("c", " " .. " Config",          "<cmd> lua require('lazyvim.util').telescope.config_files()() <cr>"),
        dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
        dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
        dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
        dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded "
            .. stats.loaded
            .. "/"
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
