return {
  -- Mason PATH config
  {
    "williamboman/mason.nvim",
    opts = {
      -- use local lsp if already installed
      PATH = "append",
    },
  },

  -- DAP
  { import = "lazyvim.plugins.extras.dap.core" },

  -- rust
  { import = "lazyvim.plugins.extras.lang.rust" },

  -- clangd
  { import = "lazyvim.plugins.extras.lang.clangd" },

  -- python
  { import = "lazyvim.plugins.extras.lang.python" },

  -- omnisharp
  { import = "lazyvim.plugins.extras.lang.omnisharp" },

  -- markdown
  { import = "lazyvim.plugins.extras.lang.markdown" },

  -- JSON
  { import = "lazyvim.plugins.extras.lang.json" },

  -- YAML
  { import = "lazyvim.plugins.extras.lang.yaml" },
}
