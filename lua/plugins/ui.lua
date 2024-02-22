local colors = require("tokyonight.colors").setup()
local util = require("tokyonight.util")

local default_color = util.darken(colors.blue, 0.5)
local black = "#000000"
local white = util.darken("#ffffff", 0.7)
local red = util.darken(colors.red1, 0.7)
local green = util.darken(colors.green, 0.5)
local orange = util.darken(colors.orange, 0.7)
local yellow = util.darken(colors.yellow, 0.7)
local brown = util.darken("#714423", 0.7)
vim.api.nvim_set_hl(0, "AlphaLogo", { fg = default_color })
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
    hl = {
      { { "AlphaLogo", 0, 200 } },
      { { "AlphaHeader", 0, 151 }, { "AlphaLogo", 152, 200 } },
      { { "AlphaHeader", 0, 161 }, { "AlphaLogo", 162, 200 } },
      { { "AlphaHeader", 0, 155 }, { "AlphaLogo", 156, 200 } },
      { { "AlphaHeader", 0, 161 }, { "AlphaLogo", 162, 200 } },
      { { "AlphaHeader", 0, 163 }, { "AlphaLogo", 164, 200 } },
      { { "AlphaHeader", 0, 147 }, { "AlphaLogo", 148, 200 } },
    },
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
    hl = {
      { { "AlphaLogo", 0, 200 } },
      { { "AlphaHeader", 0, 151 }, { "AlphaLogo", 152, 200 } },
      { { "AlphaHeader", 0, 161 }, { "AlphaLogo", 162, 200 } },
      { { "AlphaHeader", 0, 155 }, { "AlphaLogo", 156, 200 } },
      { { "AlphaHeader", 0, 161 }, { "AlphaLogo", 162, 200 } },
      { { "AlphaHeader", 0, 163 }, { "AlphaLogo", 164, 200 } },
      { { "AlphaHeader", 0, 147 }, { "AlphaLogo", 148, 200 } },
    },
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
      { { "AlphaLogo", 0, 110 } },
      { { "AlphaHeader", 0, 151 }, { "AlphaLogo", 152, 173 }, { "FgGreen", 174, 185 }, { "AlphaLogo", 186, 192 } },
      { { "AlphaHeader", 0, 161 }, { "AlphaLogo", 162, 181 }, { "FgGreen", 182, 202 }, { "AlphaLogo", 203, 206 } },
      { { "AlphaHeader", 0, 155 }, { "AlphaLogo", 156, 196 } },
      {
        { "AlphaHeader", 0, 161 },
        { "AlphaLogo", 162, 176 },
        { "BgRed", 177, 179 },
        { "BgWhite", 180, 182 },
        { "FgWhite", 183, 185 },
        { "AlphaLogo", 186, 199 },
        { "FgWhite", 200, 202 },
        { "AlphaLogo", 203, 205 },
      },
      {
        { "AlphaHeader", 0, 163 },
        { "AlphaLogo", 164, 182 },
        { "FgRed", 183, 185 },
        { "FgWhite", 186, 188 },
        { "AlphaLogo", 189, 205 },
      },
      {
        { "AlphaHeader", 0, 147 },
        { "AlphaLogo", 148, 174 },
        { "BgWhite", 175, 177 },
        { "AlphaLogo", 178, 180 },
        { "BgWhite", 181, 183 },
        { "AlphaLogo", 184, 190 },
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
      { { "AlphaLogo", 0, 102 }, { "BgRed", 103, 105 }, { "AlphaLogo", 106, 200 } },
      {
        { "AlphaHeader", 0, 151 },
        { "AlphaLogo", 152, 173 },
        { "BgRed", 174, 176 },
        { "FgOrangeBgRed", 177, 179 },
        { "BgRed", 180, 182 },
        { "AlphaLogo", 183, 200 },
      },
      {
        { "AlphaHeader", 0, 161 },
        { "AlphaLogo", 162, 171 },
        { "BgWhite", 172, 174 },
        { "AlphaLogo", 175, 186 },
        { "BgRed", 187, 189 },
        { "BgYellow", 189, 190 },
        { "BgRed", 190, 192 },
        { "AlphaLogo", 193, 199 },
      },
      { { "AlphaHeader", 0, 155 }, { "AlphaLogo", 156, 200 } },
      { { "AlphaHeader", 0, 161 }, { "AlphaLogo", 162, 200 } },
      { { "AlphaHeader", 0, 163 }, { "AlphaLogo", 164, 172 }, { "FgWhite", 173, 175 }, { "AlphaLogo", 176, 200 } },
      {
        { "AlphaHeader", 0, 147 },
        { "AlphaLogo", 148, 160 },
        { "BgWhite", 161, 163 },
        { "AlphaLogo", 164, 166 },
        { "BgWhite", 167, 169 },
        { "AlphaLogo", 170, 200 },
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
      { { "AlphaLogo", 0, 102 }, { "AlphaLogo", 103, 200 } },
      { { "AlphaHeader", 0, 151 }, { "AlphaLogo", 152, 170 }, { "BgBrown", 171, 173 }, { "AlphaLogo", 174, 200 } },
      {
        { "AlphaHeader", 0, 161 },
        { "AlphaLogo", 162, 170 },
        { "FgBrown", 171, 173 },
        { "BgWhite", 176, 178 },
        { "BgBrown", 179, 181 },
        { "AlphaLogo", 182, 184 },
        { "FgWhiteBgBrown", 185, 187 },
        { "BgBrown", 188, 190 },
        { "AlphaLogo", 192, 210 },
      },
      {
        { "AlphaHeader", 0, 155 },
        { "AlphaLogo", 156, 182 },
        { "BgWhite", 182, 183 },
        { "BgBrown", 183, 187 },
        { "AlphaLogo", 188, 200 },
      },
      {
        { "AlphaHeader", 0, 161 },
        { "AlphaLogo", 162, 181 },
        { "BgYellow", 182, 184 },
        { "AlphaLogo", 185, 192 },
        { "BgWhite", 192, 193 },
        { "BgBrown", 193, 195 },
        { "AlphaLogo", 197, 210 },
      },
      {
        { "AlphaHeader", 0, 163 },
        { "AlphaLogo", 164, 182 },
        { "BgYellow", 183, 190 },
        { "FgYellow", 191, 193 },
        { "AlphaLogo", 194, 196 },
        { "BgBrown", 197, 199 },
        { "AlphaLogo", 200, 210 },
      },
      { { "AlphaHeader", 0, 147 }, { "AlphaLogo", 148, 200 } },
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
      { { "AlphaLogo", 0, 102 }, { "BgYellow", 103, 108 }, { "AlphaLogo", 109, 200 } },
      { { "AlphaHeader", 0, 151 }, { "AlphaLogo", 152, 176 }, { "BgYellow", 177, 184 }, { "AlphaLogo", 185, 200 } },
      {
        { "AlphaHeader", 0, 161 },
        { "AlphaLogo", 162, 166 },
        { "BgWhite", 167, 169 },
        { "AlphaLogo", 171, 182 },
        { "BgYellow", 183, 189 },
        { "AlphaLogo", 190, 200 },
      },
      {
        { "AlphaHeader", 0, 155 },
        { "AlphaLogo", 156, 166 },
        { "BgWhite", 167, 169 },
        { "AlphaLogo", 170, 172 },
        { "FgRed", 173, 178 },
        { "AlphaLogo", 179, 185 },
        { "BgYellow", 186, 191 },
        { "AlphaLogo", 192, 200 },
      },
      { { "AlphaHeader", 0, 161 }, { "AlphaLogo", 162, 174 }, { "BgRed", 175, 177 }, { "AlphaLogo", 178, 200 } },
      { { "AlphaHeader", 0, 163 }, { "AlphaLogo", 164, 200 } },
      { { "AlphaHeader", 0, 147 }, { "AlphaLogo", 148, 200 } },
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
