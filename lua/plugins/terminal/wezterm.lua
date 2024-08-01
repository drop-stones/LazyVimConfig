return {
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
      -- Focus window
      {
        "<C-h>",
        function()
          local current_winnr = vim.fn.winnr()
          local left_winnr = vim.fn.winnr("h")
          if current_winnr == left_winnr then
            require("wezterm").switch_pane.direction("Left")
          else
            vim.cmd("wincmd h")
          end
        end,
        mode = { "n", "t" },
        { desc = "Go to Left Window" },
      },
      {
        "<C-j>",
        function()
          local current_winnr = vim.fn.winnr()
          local lower_winnr = vim.fn.winnr("j")
          if current_winnr == lower_winnr then
            require("wezterm").switch_pane.direction("Down")
          else
            vim.cmd("wincmd j")
          end
        end,
        mode = { "n", "t" },
        { desc = "Go to Lower Window" },
      },
      {
        "<C-k>",
        function()
          local current_winnr = vim.fn.winnr()
          local upper_winnr = vim.fn.winnr("k")
          if current_winnr == upper_winnr then
            require("wezterm").switch_pane.direction("Up")
          else
            vim.cmd("wincmd k")
          end
        end,
        mode = { "n", "t" },
        { desc = "Go to Upper Window" },
      },
      {
        "<C-l>",
        function()
          local current_winnr = vim.fn.winnr()
          local right_winnr = vim.fn.winnr("l")
          if current_winnr == right_winnr then
            require("wezterm").switch_pane.direction("Right")
          else
            vim.cmd("wincmd l")
          end
        end,
        mode = { "n", "t" },
        { desc = "Go to Right Window" },
      },
    },
  },
}
