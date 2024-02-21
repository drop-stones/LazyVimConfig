local colors = require("tokyonight.colors").setup()
local util = require("tokyonight.util")

local black = "#000000"
local white = util.darken("#ffffff", 0.7)
local red = util.darken(colors.red1, 0.7)
local green = util.darken(colors.green, 0.5)
vim.api.nvim_set_hl(0, "FgBlueBgRed", { fg = colors.blue, bg = red })
vim.api.nvim_set_hl(0, "FgBlueBgWhite", { fg = colors.blue, bg = white })
vim.api.nvim_set_hl(0, "FgWhite", { fg = white })
vim.api.nvim_set_hl(0, "FgBlackBgWhite", { fg = black, bg = white })
vim.api.nvim_set_hl(0, "FgRed", { fg = red })
vim.api.nvim_set_hl(0, "FgGreen", { fg = green })

local header = {
  switch = {
    logo = {
      "                                                                          ▄█▀▀▀█  █████▄",
      "                   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗     █    █  ██████",
      "                   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     █ ██ █  ██████",
      "                   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║     █    █  ██▀▀██",
      "                   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║     █    █  ██▄▄██",
      "                   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║     █▄   █  ██████",
      "                   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝      ▀▀▀▀▀  ▀▀▀▀▀ ",
    },
    hl = "AlphaHeader",
  },
  pokemon_ball = {
    logo = {
      "                                                                             ▄▄▀▀▀▀▄▄   ",
      "                   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗      ▄▀        ▀▄ ",
      "                   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     ▄▀          ▀▄",
      "                   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║     ███▄  ▄▀▀▀▄  █",
      "                   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║     ▀▄ ▀▀██   █▀█▀",
      "                   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║      ▀▄    ▀▀▀ ▄▀ ",
      "                   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝        ▀▀▄▄▄▄▀▀   ",
    },
    hl = "AlphaHeader",
  },
  bulbasaur = {
    logo = {
      "                                                                                     ▄▄▀▀▀▄▄  ",
      "                      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗        ▄ ▄▀▀ ▄█ █  ▀▄",
      "                      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║       █ ▀█▄▄▀▄▀  ▀█ █",
      "                      ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║     ▄█     ▀▀▀▄  ▄▄█ ",
      "                      ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║     █    ▄▀▀▄▀ ▀▀ ▄▄█",
      "                      ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║      ▀▄▄ ▀▀▀ ▄▀  ▄▀▀ ",
      "                      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝         ▀▀▀▀▀▀▄▄▄▀   ",
    },
    hl = {
      { { "AlphaHeader", 0, 110 } },
      { { "AlphaHeader", 0, 173 }, { "FgGreen", 174, 185 }, { "AlphaHeader", 186, 192 } },
      { { "AlphaHeader", 0, 181 }, { "FgGreen", 182, 202 }, { "AlphaHeader", 203, 206 } },
      { { "AlphaHeader", 0, 196 } },
      {
        { "AlphaHeader", 0, 176 },
        { "BgRed", 177, 179 },
        { "BgWhite", 180, 182 },
        { "FgWhite", 183, 185 },
        { "AlphaHeader", 186, 199 },
        { "FgWhite", 200, 202 },
        { "AlphaHeader", 203, 205 },
      },
      { { "AlphaHeader", 0, 182 }, { "FgRed", 183, 185 }, { "FgWhite", 186, 188 }, { "AlphaHeader", 189, 205 } },
      {
        { "AlphaHeader", 0, 174 },
        { "BgWhite", 175, 177 },
        { "AlphaHeader", 178, 180 },
        { "BgWhite", 181, 183 },
        { "AlphaHeader", 184, 190 },
      },
    },
  },
  charmander = {
    logo = {
      "                                                                              ▄▀▀▀▄     ▄▀▄ ",
      "                     ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗      █     █   ▄▀  █",
      "                     ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     █   ▄█  █  ▀▄  █",
      "                     ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║      ▀▄▄▄  ▄ ▀▄▄▀ █ ",
      "                     ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║        █  ▀▄  █ ▄▀  ",
      "                     ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║       ▀ ▀█▄▄ ▄█▀    ",
      "                     ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝           ▀▄▄▄▀     ",
    },
    hl = "AlphaHeader",
  },
  squirtle = {
    logo = {
      "                                                                                ▄▀▀▀▄▄     ▄▀▀▄ ",
      "                       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗      █      █▀▄ █  ▄ █",
      "                       ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     █    ▄█    ▀▄ █ ▄▀",
      "                       ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║      ▀▄▄   ▄▄▀  ▀▄█▀  ",
      "                       ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║       ▀▄▀█▀▄▄█   █    ",
      "                       ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║         ▀▄█▄▄▄ █▄▀    ",
      "                       ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝             ▀▄▄▄▀     ",
    },
    hl = "AlphaHeader",
  },
  pikachu = {
    logo = {
      "                                                                              ▄▀█  ▄▄▄▄▀▀▄",
      "                    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗       ▄▀ ▀▄▀ ▄▀  ▄▀",
      "                    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     ▄▀      █▀▄ ▀▄ ",
      "                    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║     █▀  ▄█   ██▀▄▀ ",
      "                    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║      ▀▄   ▄▀  █▀   ",
      "                    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║      ▀▄▀▄▄▄▀▄█     ",
      "                    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝       ▀▀▀▀▄▄▄▀     ",
    },
    hl = "AlphaHeader",
  },
}

return {
  { import = "lazyvim.plugins.extras.ui.alpha" },
  {
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      -- Get random element from sub_logo
      local keyset = {}
      for k in pairs(header) do
        table.insert(keyset, k)
      end
      local random_header = header[keyset[math.random(#keyset)]]

      dashboard.section.header.val = random_header.logo
      dashboard.section.header.opts.hl = random_header.hl

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
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
  },
}
