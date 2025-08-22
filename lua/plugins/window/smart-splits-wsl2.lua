return {
  {
    "drop-stones/smart-splits-wsl2.nvim",
    event = "VeryLazy",
    keys = {
      -- stylua: ignore start
      { "<c-h>", function() require("smart-splits-wsl2").move_cursor_left()  end, mode = { "n", "t" }, desc = "Go to Left Window" },
      { "<c-j>", function() require("smart-splits-wsl2").move_cursor_down()  end, mode = { "n", "t" }, desc = "Go to Lower Window" },
      { "<c-k>", function() require("smart-splits-wsl2").move_cursor_up()    end, mode = { "n", "t" }, desc = "Go to Upper Window" },
      { "<c-l>", function() require("smart-splits-wsl2").move_cursor_right() end, mode = { "n", "t" }, desc = "Go to Right Window" },
      { "<c-left>",  function() require("smart-splits-wsl2").resize_left()  end, mode = { "n", "t" }, desc = "Resize Window Left" },
      { "<c-right>", function() require("smart-splits-wsl2").resize_right() end, mode = { "n", "t" }, desc = "Resize Window Right" },
      { "<c-up>",    function() require("smart-splits-wsl2").resize_up()    end, mode = { "n", "t" }, desc = "Resize Window Up" },
      { "<c-down>",  function() require("smart-splits-wsl2").resize_down()  end, mode = { "n", "t" }, desc = "Resize Window Down" },
      -- stylua: ignore end
    },
    opts = {},
  },
}
