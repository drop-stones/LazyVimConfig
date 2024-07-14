return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>:", group = "task" },
      },
    },
  },
  {
    "stevearc/overseer.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    cmd = { "OverseerOpen", "OverseerRunCmd", "OverseerRun" },
    opts = {
      strategy = {
        "toggleterm",
        -- Work around to see a task log.
        -- https://github.com/stevearc/overseer.nvim/issues/186
        on_create = function()
          vim.cmd("stopinsert")
        end,
      },
    },
    keys = {
      { "<leader>:o", "<Cmd>OverseerOpen<CR>", desc = "Open the overseer window" },
      { "<leader>:x", "<Cmd>OverseerClose<CR>", desc = "Close the overseer window" },
      { "<leader>:t", "<Cmd>OverseerToggle<CR>", desc = "Toggle the overseer window" },
      { "<leader>:s", "<Cmd>OverseerSaveBundle<CR>", desc = "Save the current tasks to disk" },
      { "<leader>:l", "<Cmd>OverseerLoadBundle<CR>", desc = "Load a saved task from disk" },
      { "<leader>:d", "<Cmd>OverseerDeleteBundle<CR>", desc = "Delete a saved task bundle" },
      { "<leader>:s", "<Cmd>OverseerRunCmd<CR>", desc = "Run a raw shell command" },
      { "<leader>::", "<Cmd>OverseerRun<CR>", desc = "Run a task from a template" },
      { "<leader>:b", "<Cmd>OverseerBuild<CR>", desc = "Open the task builder" },
      { "<leader>:q", "<Cmd>OverseerQuickAction<CR>", desc = "Run an action on the most recent task" },
      { "<leader>:a", "<Cmd>OverseerTaskAction<CR>", desc = "Select a task to run an action on" },
      { "<leader>:i", "<Cmd>OverseerInfo<CR>", desc = "Display diagnostic information about overseer" },
      { "<leader>:c", "<Cmd>OverseerClearCache<CR>", desc = "Clear the task cache" },
    },
  },
}
