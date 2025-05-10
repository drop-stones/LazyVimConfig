return {
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
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "netcoredbg" } },
      },
    },
  },
}
