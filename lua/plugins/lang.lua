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

  -- PowerShell (no parsers are maintained)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs powershell editor services
        powershell_es = {},
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      -- Ensure mason installs netcoredbg
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "netcoredbg" })
        end,
      },
    },
  },

  -- Bash/Zsh
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "bash" })
    end,
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
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "bash-debug-adapter" })
        end,
      },
    },
  },

  -- just
  {
    "IndianBoy42/tree-sitter-just",
    ft = { "just" },
    opts = {},
  },
}
