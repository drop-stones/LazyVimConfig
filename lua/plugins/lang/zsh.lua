return {
  -- Bash/Zsh
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "bash" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs bash language server
        bashls = {
          filetypes = { "sh", "bash", "zsh" },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      -- Ensure mason installs bash-debug-adapter
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "bash-debug-adapter" } },
      },
    },
  },
}
