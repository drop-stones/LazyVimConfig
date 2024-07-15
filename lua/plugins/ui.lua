local colors = require("tokyonight.colors").setup()
local util = require("tokyonight.util")

local default_color = util.darken(colors.blue, 0.5)
local black = "#000000"
local grey = util.lighten(black, 0.7)
local white = util.darken("#ffffff", 0.7)
local red = util.darken(colors.red1, 0.7)
local green = util.darken(colors.green, 0.5)
local light_green = util.darken(colors.green, 0.7)
local orange = util.darken(colors.orange, 0.7)
local yellow = util.darken(colors.yellow, 0.7)
local brown = util.darken("#714423", 0.7)
local pink = util.darken("#ffbad2", 0.7)
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
vim.api.nvim_set_hl(0, "FgYellowBgRed", { fg = yellow, bg = red })
vim.api.nvim_set_hl(0, "FgGrey", { fg = grey })
vim.api.nvim_set_hl(0, "BgGrey", { fg = default_color, bg = grey })
vim.api.nvim_set_hl(0, "FgYellowBgGrey", { fg = yellow, bg = grey })
vim.api.nvim_set_hl(0, "BgLightGreen", { fg = default_color, bg = light_green })
vim.api.nvim_set_hl(0, "BgGreen", { fg = default_color, bg = green })
vim.api.nvim_set_hl(0, "FgLightGreenBgGreen", { fg = light_green, bg = green })
vim.api.nvim_set_hl(0, "BgPink", { fg = default_color, bg = pink })
vim.api.nvim_set_hl(0, "FgPink", { fg = pink })
vim.api.nvim_set_hl(0, "FgPinkBgWhite", { fg = pink, bg = white })
vim.api.nvim_set_hl(0, "FgRedBgPink", { fg = red, bg = pink })
vim.api.nvim_set_hl(0, "FgWhiteBgRed", { fg = white, bg = red })
vim.api.nvim_set_hl(0, "FgBrownBgYellow", { fg = brown, bg = yellow })

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
      { { "AlphaHeader", 0, 151 }, { "AlphaLogo", 151, 172 }, { "FgGreen", 172, 184 }, { "AlphaLogo", 184, 192 } },
      { { "AlphaHeader", 0, 161 }, { "AlphaLogo", 161, 181 }, { "FgGreen", 181, 201 }, { "AlphaLogo", 201, 206 } },
      { { "AlphaHeader", 0, 155 }, { "AlphaLogo", 155, 196 } },
      {
        { "AlphaHeader", 0, 161 },
        { "AlphaLogo", 161, 173 },
        { "BgRed", 173, 176 },
        { "BgWhite", 176, 179 },
        { "FgWhite", 179, 182 },
        { "AlphaLogo", 182, 196 },
        { "FgWhite", 196, 199 },
        { "AlphaLogo", 199, 202 },
      },
      {
        { "AlphaHeader", 0, 163 },
        { "AlphaLogo", 163, 179 },
        { "FgRed", 179, 182 },
        { "FgWhite", 182, 185 },
        { "AlphaLogo", 185, 203 },
      },
      {
        { "AlphaHeader", 0, 147 },
        { "AlphaLogo", 147, 171 },
        { "BgWhite", 171, 174 },
        { "AlphaLogo", 174, 177 },
        { "BgWhite", 177, 180 },
        { "AlphaLogo", 180, 187 },
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
      { { "AlphaLogo", 0, 99 }, { "BgRed", 100, 102 }, { "AlphaLogo", 103, 200 } },
      {
        { "AlphaHeader", 0, 151 },
        { "AlphaLogo", 151, 170 },
        { "BgRed", 170, 173 },
        { "FgOrangeBgRed", 173, 176 },
        { "BgRed", 176, 179 },
        { "AlphaLogo", 179, 200 },
      },
      {
        { "AlphaHeader", 0, 161 },
        { "AlphaLogo", 161, 170 },
        { "BgWhite", 170, 173 },
        { "AlphaLogo", 173, 185 },
        { "BgRed", 185, 188 },
        { "BgYellow", 188, 190 },
        { "BgRed", 190, 192 },
        { "AlphaLogo", 192, 199 },
      },
      { { "AlphaHeader", 0, 155 }, { "AlphaLogo", 156, 200 } },
      { { "AlphaHeader", 0, 161 }, { "AlphaLogo", 162, 200 } },
      { { "AlphaHeader", 0, 163 }, { "AlphaLogo", 164, 171 }, { "FgWhite", 171, 174 }, { "AlphaLogo", 174, 200 } },
      {
        { "AlphaHeader", 0, 147 },
        { "AlphaLogo", 148, 159 },
        { "BgWhite", 159, 162 },
        { "AlphaLogo", 162, 165 },
        { "BgWhite", 165, 168 },
        { "AlphaLogo", 168, 200 },
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
      { { "AlphaLogo", 0, 200 } },
      { { "AlphaHeader", 0, 170 }, { "AlphaLogo", 151, 169 }, { "BgBrown", 169, 172 }, { "AlphaLogo", 172, 200 } },
      {
        { "AlphaHeader", 0, 161 },
        { "AlphaLogo", 161, 169 },
        { "FgBrown", 169, 172 },
        { "BgWhite", 175, 177 },
        { "BgBrown", 177, 180 },
        { "AlphaLogo", 180, 183 },
        { "FgWhiteBgBrown", 183, 186 },
        { "BgBrown", 186, 189 },
        { "AlphaLogo", 189, 210 },
      },
      {
        { "AlphaHeader", 0, 155 },
        { "AlphaLogo", 155, 182 },
        { "BgWhite", 182, 183 },
        { "BgBrown", 183, 187 },
        { "AlphaLogo", 187, 200 },
      },
      {
        { "AlphaHeader", 0, 161 },
        { "AlphaLogo", 161, 180 },
        { "BgYellow", 180, 183 },
        { "AlphaLogo", 183, 191 },
        { "BgWhite", 191, 193 },
        { "BgBrown", 193, 195 },
        { "AlphaLogo", 195, 210 },
      },
      {
        { "AlphaHeader", 0, 163 },
        { "AlphaLogo", 163, 181 },
        { "BgYellow", 181, 190 },
        { "FgYellow", 190, 193 },
        { "AlphaLogo", 193, 196 },
        { "BgBrown", 196, 199 },
        { "AlphaLogo", 199, 210 },
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
      { { "AlphaLogo", 0, 101 }, { "BgYellow", 101, 107 }, { "AlphaLogo", 107, 200 } },
      { { "AlphaHeader", 0, 151 }, { "AlphaLogo", 151, 175 }, { "BgYellow", 175, 183 }, { "AlphaLogo", 183, 200 } },
      {
        { "AlphaHeader", 0, 161 },
        { "AlphaLogo", 161, 166 },
        { "BgWhite", 166, 169 },
        { "AlphaLogo", 169, 181 },
        { "BgYellow", 181, 188 },
        { "AlphaLogo", 188, 200 },
      },
      {
        { "AlphaHeader", 0, 155 },
        { "AlphaLogo", 155, 165 },
        { "BgWhite", 165, 168 },
        { "AlphaLogo", 168, 171 },
        { "FgRed", 171, 177 },
        { "AlphaLogo", 177, 184 },
        { "BgYellow", 184, 190 },
        { "AlphaLogo", 190, 200 },
      },
      { { "AlphaHeader", 0, 161 }, { "AlphaLogo", 161, 173 }, { "BgRed", 173, 176 }, { "AlphaLogo", 176, 200 } },
      { { "AlphaHeader", 0, 163 }, { "AlphaLogo", 163, 200 } },
      { { "AlphaHeader", 0, 147 }, { "AlphaLogo", 147, 200 } },
    },
  },
  chikorita = {
    logo = {
      "                                                                               ▄▄▀▀▀▄▄  ",
      "                   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗       ▄▀██▀▀▀ ▄▄▀ ",
      "                   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     ▄▀   ▀▀▀█▀    ",
      "                   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║     █▄   ▄▄  █    ",
      "                   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║     ▀▄ ▄ ▀▀▀▀ ▀▄▀█",
      "                   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║      █ ▄ ▄ ▀ ▄  ▀█",
      "                   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝       ▀▀▀▄▄▀▄▀▄█▄▀",
    },
    hl = {
      { { "AlphaLogo", 0, 85 }, { "BgLightGreen", 85, 88 }, { "BgGreen", 88, 94 }, { "AlphaLogo", 94, 110 } },
      {
        { "AlphaHeader", 0, 151 },
        { "AlphaLogo", 151, 163 },
        { "FgLightGreenBgGreen", 163, 176 },
        { "BgGreen", 176, 182 },
        { "AlphaLogo", 182, 200 },
      },
      {
        { "AlphaHeader", 0, 161 },
        { "AlphaLogo", 161, 165 },
        { "BgWhite", 165, 167 },
        { "FgGreen", 171, 173 },
        { "AlphaLogo", 173, 200 },
      },
      {
        { "AlphaHeader", 0, 155 },
        { "AlphaLogo", 155, 159 },
        { "FgRedBgPink", 159, 161 },
        { "AlphaLogo", 161, 164 },
        { "FgRed", 164, 167 },
        { "FgPinkBgWhite", 167, 170 },
        { "BgWhite", 170, 172 },
        { "AlphaLogo", 172, 200 },
      },
      {
        { "AlphaHeader", 0, 161 },
        { "AlphaLogo", 161, 173 },
        { "FgRed", 173, 176 },
        { "FgPink", 176, 179 },
        { "FgWhite", 179, 182 },
        { "AlphaLogo", 182, 200 },
      },
      { { "AlphaHeader", 0, 163 }, { "AlphaLogo", 163, 200 } },
      { { "AlphaHeader", 0, 147 }, { "AlphaLogo", 147, 200 } },
    },
  },
  cyndaquil = {
    logo = {
      "                                                                                   ▄▀▀▀▀▄▄▄  ▄▀█ ▄▀█",
      "                         ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗       █   ▀▀▀▀ ▀▀  ▀▀ ▄▀",
      "                         ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║      █   ▀ ▄▄ █▄ █ ▄ ▄█▄",
      "                         ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║     █  ▀  ▀  ▄▀▀███▄▀ ▄▀",
      "                         ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║     ▀▄▄▀▀█▄ █▀ ▄▀ ▄▄▄ ▀▄",
      "                         ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║          ▄▀▀█▀█▄▄██▀▀▀▀▀",
      "                         ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝          ▀▀▀▀▀▀▄▄▀      ",
    },
    hl = {
      {
        { "AlphaLogo", 0, 86 },
        { "BgGrey", 86, 98 },
        { "AlphaLogo", 98, 112 },
        { "BgRed", 112, 115 },
        { "AlphaLogo", 115, 122 },
        { "BgRed", 122, 195 },
        { "AlphaLogo", 195, 204 },
      },
      {
        { "AlphaHeader", 0, 156 },
        { "AlphaLogo", 156, 163 },
        { "BgGrey", 163, 166 },
        { "FgGrey", 166, 175 },
        { "BgGrey", 175, 178 },
        { "BgRed", 178, 197 },
        { "AlphaLogo", 197, 204 },
      },
      {
        { "AlphaHeader", 0, 166 },
        { "AlphaLogo", 166, 172 },
        { "BgGrey", 172, 175 },
        { "FgGrey", 175, 178 },
        { "AlphaLogo", 178, 188 },
        { "FgYellowBgRed", 188, 202 },
        { "BgRed", 202, 205 },
        { "AlphaLogo", 205, 208 },
      },
      {
        { "AlphaHeader", 0, 160 },
        { "AlphaLogo", 160, 165 },
        { "BgGrey", 165, 167 },
        { "FgGrey", 167, 170 },
        { "AlphaLogo", 170, 180 },
        { "BgGrey", 180, 183 },
        { "FgYellowBgGrey", 183, 186 },
        { "FgYellowBgRed", 186, 202 },
        { "BgRed", 202, 205 },
        { "AlphaLogo", 205, 208 },
      },
      {
        { "AlphaHeader", 0, 166 },
        { "AlphaLogo", 166, 171 },
        { "BgGrey", 171, 174 },
        { "AlphaLogo", 174, 197 },
        { "BgGrey", 197, 200 },
        { "FgGrey", 200, 202 },
        { "BgGrey", 202, 204 },
        { "BgYellow", 204, 207 },
        { "FgYellowBgRed", 207, 213 },
        { "BgRed", 213, 217 },
        { "AlphaLogo", 217, 220 },
      },
      { { "AlphaHeader", 0, 168 }, { "AlphaLogo", 168, 221 } },
      { { "AlphaHeader", 0, 152 }, { "AlphaLogo", 152, 205 } },
    },
  },
  totodile = {
    logo = {
      "                                                                                ▄▀█▄▀▀▀▄      ",
      "                      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗        █  ▀▄█▄█▀█    ",
      "                      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     ▄▀▀   ███▀█▄█▄   ",
      "                      ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║     █ ▀ ▄▄▄▄   █ █▀██",
      "                      ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║      ▀▀█▀ ▄▄▀   ██▀▄▀",
      "                      ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║        ▄██▀▄▄▄█▄▄█▄▀ ",
      "                      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝       ▀▄▄██▄█▀▄▄█▀   ",
    },
    hl = {
      { { "AlphaLogo", 0, 200 } },
      {
        { "AlphaHeader", 0, 152 },
        { "AlphaLogo", 152, 169 },
        { "FgWhite", 169, 173 },
        { "AlphaLogo", 173, 176 },
        { "BgRed", 176, 182 },
        { "AlphaLogo", 182, 200 },
      },
      {
        { "AlphaHeader", 0, 162 },
        { "AlphaLogo", 162, 183 },
        { "FgRed", 183, 186 },
        { "FgWhite", 186, 189 },
        { "BgRed", 189, 195 },
        { "AlphaLogo", 195, 200 },
      },
      {
        { "AlphaHeader", 0, 156 },
        { "AlphaLogo", 156, 173 },
        { "FgWhite", 173, 176 },
        { "AlphaLogo", 176, 182 },
        { "BgRed", 182, 200 },
      },
      {
        { "AlphaHeader", 0, 162 },
        { "AlphaLogo", 162, 175 },
        { "BgRed", 175, 179 },
        { "FgWhiteBgRed", 179, 182 },
        { "BgRed", 182, 185 },
        { "AlphaLogo", 185, 210 },
      },
      {
        { "AlphaHeader", 0, 164 },
        { "AlphaLogo", 164, 179 },
        { "BgYellow", 179, 182 },
        { "FgBrownBgYellow", 182, 185 },
        { "BgBrown", 185, 188 },
        { "AlphaLogo", 188, 210 },
      },
      { { "AlphaHeader", 0, 148 }, { "AlphaLogo", 148, 200 } },
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
