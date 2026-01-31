-- stylua: ignore
return vim.fn.executable("pwsh") == 1 and {
  -- PowerShell
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "powershell" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs powershell editor services
        powershell_es = {
          settings = { powershell = { codeFormatting = { Preset = "OTBS" } } },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      -- Ensure mason installs netcoredbg
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "netcoredbg" } },
      },
    },
  },
} or {}
