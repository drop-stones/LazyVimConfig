return {
  { import = "lazyvim.plugins.extras.editor.fzf" },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "drop-stones/fzf-lua-normal-mode" },
    opts = {
      files = { headers = false },
      git = {
        files = {
          cmd = "git ls-files --cached --others --exclude-standard",
          headers = false,
        },
        status = { headers = false },
        commit = { headers = false },
        bcommits = { headers = false },
        branches = { headers = false },
        tags = { headers = false },
        stash = { headers = false },
      },
      grep = {
        headers = false,
        live_ast_prefix = false, -- remove '*' from prompt
        actions = {
          ["ctrl-r"] = { require("fzf-lua.actions").grep_lgrep },
        },
      },
      args = { headers = false },
      oldfiles = { headers = false },
      buffers = { headers = false },
      tabs = { headers = false },
      lines = { headers = false },
      previewers = {
        builtin = {
          extensions = {
            ["png"] = { "viu", "-b" },
            ["jpg"] = { "viu", "-b" },
            ["svg"] = { "chafa", "-f", "symbols" },
          },
        },
      },
    },
    keys = {
      { "<leader>/", false },
      { "<leader>ff", false },
      { "<leader>fF", false },
      { "<leader>sg", false },
      { "<leader>sG", false },
      { "<leader>sw", false },
      { "<leader>sW", false },
      { "<leader>sw", mode = "v", false },
      { "<leader>sW", mode = "v", false },
    },
  },
}
