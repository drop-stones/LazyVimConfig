local colors = require("tokyonight.colors").setup()
local util = require("tokyonight.util")

local default_color = colors.blue
local black = "#000000"
local white = util.darken("#ffffff", 0.7)
local red = util.darken(colors.red1, 0.7)
local green = util.darken(colors.green, 0.5)
local orange = util.darken(colors.orange, 0.7)
local yellow = util.darken(colors.yellow, 0.7)
local brown = util.darken("#714423", 0.7)
vim.api.nvim_set_hl(0, "BgRed", { fg = default_color, bg = red })
vim.api.nvim_set_hl(0, "BgWhite", { fg = default_color, bg = white })
vim.api.nvim_set_hl(0, "BgYellow", { fg = default_color, bg = yellow })
vim.api.nvim_set_hl(0, "FgWhite", { fg = white })
vim.api.nvim_set_hl(0, "FgBlackBgWhite", { fg = black, bg = white })
vim.api.nvim_set_hl(0, "FgRed", { fg = red })
vim.api.nvim_set_hl(0, "FgGreen", { fg = green })
vim.api.nvim_set_hl(0, "FgOrangeBgRed", { fg = orange, bg = red })
vim.api.nvim_set_hl(0, "FgBrown", { fg = brown })
vim.api.nvim_set_hl(0, "BgBrown", { fg = default_color, bg = brown })
vim.api.nvim_set_hl(0, "FgWhiteBgBrown", { fg = white, bg = brown })
vim.api.nvim_set_hl(0, "FgYellow", { fg = yellow })

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
      "                     ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗      █     █   ▄▀▄ █",
      "                     ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     █   ▄█  █  ▀▄  █",
      "                     ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║      ▀▄▄▄  ▄ ▀▄▄▀ █ ",
      "                     ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║        █  ▀▄  █ ▄▀  ",
      "                     ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║       ▀▀▀█▄▄ ▄█▀    ",
      "                     ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝           ▀▄▄▄▀     ",
    },
    hl = {
      { { "AlphaHeader", 0, 102 }, { "BgRed", 103, 105 }, { "AlphaHeader", 106, 200 } },
      {
        { "AlphaHeader", 0, 173 },
        { "BgRed", 174, 176 },
        { "FgOrangeBgRed", 177, 179 },
        { "BgRed", 180, 182 },
        { "AlphaHeader", 183, 200 },
      },
      {
        { "AlphaHeader", 0, 171 },
        { "BgWhite", 172, 174 },
        { "AlphaHeader", 175, 186 },
        { "BgRed", 187, 189 },
        { "BgYellow", 189, 190 },
        { "BgRed", 190, 192 },
        { "AlphaHeader", 193, 199 },
      },
      { { "AlphaHeader", 0, 200 } },
      { { "AlphaHeader", 0, 200 } },
      { { "AlphaHeader", 0, 172 }, { "FgWhite", 173, 175 }, { "AlphaHeader", 176, 200 } },
      {
        { "AlphaHeader", 0, 160 },
        { "BgWhite", 161, 163 },
        { "AlphaHeader", 164, 166 },
        { "BgWhite", 167, 169 },
        { "AlphaHeader", 170, 200 },
      },
    },
  },
  squirtle = {
    logo = {
      "                                                                                ▄▀▀▀▄▄     ▄▀▀▄ ",
      "                       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗      █      █▀▄ █  ▄ █",
      "                       ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     █▀   ▄▀  ▄ ▀▄ █ ▄▀",
      "                       ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║      ▀▄▄   ▄▄▀  ▀▄█▀  ",
      "                       ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║       ▀▄▀█▀▄▄█   █    ",
      "                       ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║         ▀▄█▄▄▄▀█▄▀    ",
      "                       ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝             ▀▄▄▄▀     ",
    },
    hl = {
      { { "AlphaHeader", 0, 200 } },
      { { "AlphaHeader", 0, 170 }, { "BgBrown", 171, 173 }, { "AlphaHeader", 174, 200 } },
      {
        { "AlphaHeader", 0, 170 },
        { "FgBrown", 171, 173 },
        { "BgWhite", 176, 178 },
        { "BgBrown", 179, 181 },
        { "AlphaHeader", 182, 184 },
        { "FgWhiteBgBrown", 185, 187 },
        { "BgBrown", 188, 190 },
        { "AlphaHeader", 192, 210 },
      },
      { { "AlphaHeader", 0, 182 }, { "BgWhite", 182, 183 }, { "BgBrown", 183, 187 }, { "AlphaHeader", 188, 200 } },
      {
        { "AlphaHeader", 0, 181 },
        { "BgYellow", 182, 184 },
        { "AlphaHeader", 185, 192 },
        { "BgWhite", 192, 193 },
        { "BgBrown", 193, 195 },
        { "AlphaHeader", 197, 210 },
      },
      {
        { "AlphaHeader", 0, 182 },
        { "BgYellow", 183, 190 },
        { "FgYellow", 191, 193 },
        { "AlphaHeader", 194, 196 },
        { "BgBrown", 197, 199 },
        { "AlphaHeader", 200, 210 },
      },
      { { "AlphaHeader", 0, 200 } },
    },
  },
  pikachu = {
    logo = {
      "                                                                              ▄▀█  ▄▄▄▄▀▀▄",
      "                    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗       ▄▀ ▀▄▀ ▄▀  ▄▀",
      "                    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     ▄▀      █▀▄ ▀▄ ",
      "                    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║     █▀  ▄█▄▄ ██▀▄▀ ",
      "                    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║      ▀▄   ▄▀  █▀   ",
      "                    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║      ▀▄▀▄▄▄▀▄█     ",
      "                    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝       ▀▀▀▀▄▄▄▀     ",
    },
    hl = {
      { { "AlphaHeader", 0, 200 } },
      { { "AlphaHeader", 0, 200 } },
      { { "AlphaHeader", 0, 166 }, { "BgWhite", 167, 169 }, { "AlphaHeader", 171, 200 } },
      {
        { "AlphaHeader", 0, 166 },
        { "BgWhite", 167, 169 },
        { "AlphaHeader", 170, 172 },
        { "FgRed", 173, 178 },
        { "AlphaHeader", 179, 200 },
      },
      { { "AlphaHeader", 0, 174 }, { "BgRed", 175, 177 }, { "AlphaHeader", 178, 200 } },
      { { "AlphaHeader", 0, 200 } },
      { { "AlphaHeader", 0, 200 } },
    },
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
