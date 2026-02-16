return {
  -- Special key mappings
  {
    "nvim-mini/mini.keymap",
    event = "VeryLazy",
    config = function()
      local map_combo = require("mini.keymap").map_combo

      -- Insert mode: jk to escape
      map_combo("i", "jk", "<BS><BS><Esc>")

      -- Command-line mode: jk and to cancel
      map_combo("c", "jk", "<BS><BS><C-c>")

      -- Terminal mode: jk to escape
      map_combo("t", "jk", function()
        local buf_name = vim.api.nvim_buf_get_name(0)
        if string.find(buf_name, "term://.*lazygit.*") then
          return "" -- Skip mapping in lazygit terminal
        end
        return "<BS><BS><C-\\><C-N>"
      end)

      -- Visual mode: jk to escape
      map_combo("x", "jk", "<Esc>")

      -- Select mode: jk to escape
      map_combo("s", "jk", "<BS><BS><Esc>")
    end,
  },
}
