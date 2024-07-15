return {
  -- DAP
  { import = "lazyvim.plugins.extras.dap.core" },

  -- Per-project nvim-dap debugger configurations
  {
    "ldelossa/nvim-dap-projects",
    event = "VeryLazy",
    config = function()
      require("nvim-dap-projects").search_project_config()
    end,
  },
}
