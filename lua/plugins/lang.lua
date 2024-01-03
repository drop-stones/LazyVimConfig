return {
  -- Mason PATH config
  {
    "williamboman/mason.nvim",
    opts = {
      -- use local lsp if already installed
      PATH = "append",
    },
  },

  -- clangd
  { import = "lazyvim.plugins.extras.lang.clangd" },
}
