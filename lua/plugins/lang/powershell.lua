return {
  -- PowerShell (no parsers are maintained)
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
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "netcoredbg" })
        end,
      },
    },
  },
}
