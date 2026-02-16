return {
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        "searchcount",
        maxcount = 999,
        timeout = 500,
      })
    end,
  },
}
