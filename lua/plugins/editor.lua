return {
  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
        mappings = {
          ["e"] = function()
            vim.api.nvim_command("Neotree focus filesystem")
          end,
          ["b"] = function()
            vim.api.nvim_command("Neotree focus buffers")
          end,
          ["s"] = function()
            vim.api.nvim_command("Neotree focus git_status")
          end,
        },
      },
    },
  },
}
