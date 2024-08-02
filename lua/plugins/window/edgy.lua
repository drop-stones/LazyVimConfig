return {
  -- predefined window layouts management
  { import = "lazyvim.plugins.extras.ui.edgy" },
  {
    "folke/edgy.nvim",
    opts = function(_, opts)
      local left = {}
      local right = {}

      for _, v in ipairs(opts.left) do
        if v.ft == "neo-tree" then
          table.insert(right, v)
        else
          table.insert(left, v)
        end
      end

      opts.left = left
      opts.right = right

      return opts
    end,
  },
}
