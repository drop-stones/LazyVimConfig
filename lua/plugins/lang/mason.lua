return {
  -- Mason PATH config
  {
    "mason-org/mason.nvim",
    opts = {
      -- use local lsp if already installed
      PATH = "append",
    },
  },
}
