return {
  -- Mason PATH config
  {
    "williamboman/mason.nvim",
    opts = {
      -- use local lsp if already installed
      PATH = "append",
    },
  },

  -- TreeSitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = {
        -- disable indentation because it is experimental feature
        -- See https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#indentation
        enable = false,
      },
    },
  },

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

  -- TOML
  { import = "lazyvim.plugins.extras.lang.toml" },

  -- Git
  { import = "lazyvim.plugins.extras.lang.git" },

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
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "just" } },
  },

  -- Assembly/LLVM codes
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "asm", "objdump", "llvm" } },
  },
}
