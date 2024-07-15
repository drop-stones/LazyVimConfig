return {
  "folke/flash.nvim",
  opts = {
    ---@type Flash.Config
    label = {
      min_pattern_length = 2,
    },
  },
  -- stylua: ignore
  keys = {
    -- new keymaps
    { "m", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "M", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },

    -- disable keymaps
    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },
  },
}
