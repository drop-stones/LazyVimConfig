return {
  { import = "lazyvim.plugins.extras.editor.fzf" },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "drop-stones/fzf-lua-normal-mode", "drop-stones/fzf-lua-grep-context" },
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
        rg_glob = false,
        fn_transform_cmd = function(query, cmd, _)
          vim.opt.rtp:append(vim.env.FZF_LUA_GREP_CONTEXT)
          return require("fzf-lua-grep-context.transform").rg(query, cmd)
        end,
        actions = {
          -- stylua: ignore
          ["ctrl-t"] = function() require("fzf-lua-grep-context").picker() end,
          ["ctrl-r"] = require("fzf-lua.actions").grep_lgrep,
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
