-- Window/Terminal focus
local function win_nav(direction)
  return function()
    local current_winnr = vim.fn.winnr()
    local next_winnr = vim.fn.winnr(direction)
    if current_winnr == next_winnr then
      local wezterm_direction = (direction == "h" and "Left")
        or (direction == "j" and "Down")
        or (direction == "k" and "Up")
        or (direction == "l" and "Right")
        or "Next"
      vim.schedule(function()
        require("wezterm").switch_pane.direction(wezterm_direction)
      end)
    else
      vim.schedule(function()
        vim.cmd.wincmd(direction)
      end)
    end
  end
end

local function term_nav(direction)
  ---@param self snacks.terminal
  return function(self)
    return self:is_floating() and "<c-" .. direction .. ">" or win_nav(direction)()
  end
end

return {
  {
    "snacks.nvim",
    opts = {
      terminal = {
        win = {
          keys = {
            nav_h = { "<C-h>", term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t" },
            nav_j = { "<C-j>", term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
            nav_k = { "<C-k>", term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
            nav_l = { "<C-l>", term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t" },
          },
        },
      },
    },
  },
  {
    "willothy/wezterm.nvim",
    config = true,
    cond = function()
      if os.getenv("TERM_PROGRAM") == "WezTerm" then
        return true
      end
      return false
    end,
    keys = {
      { "<C-h>", win_nav("h"), mode = { "n", "t" }, { desc = "Go to Left Window" } },
      { "<C-j>", win_nav("j"), mode = { "n", "t" }, { desc = "Go to Lower Window" } },
      { "<C-k>", win_nav("k"), mode = { "n", "t" }, { desc = "Go to Upper Window" } },
      { "<C-l>", win_nav("l"), mode = { "n", "t" }, { desc = "Go to Right Window" } },
    },
  },
}
