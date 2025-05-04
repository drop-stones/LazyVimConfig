return {
  {
    "drop-stones/fzf-lua-git-search",
    dependencies = { "ibhagwan/fzf-lua", "ahmedkhalf/project.nvim" },
    opts = {
      git_grep = {
        fn_transform_cmd = function(query, cmd, _)
          vim.opt.rtp:append(vim.env.FZF_LUA_GREP_CONTEXT)
          return require("fzf-lua-grep-context.transform").git_grep(query, cmd)
        end,
      },
    },
    keys = {
      -- stylua: ignore start
      { "<leader>/", function() require("fzf-lua-git-search").live_grep({ root = true }) end, desc = "Grep (Root Dir)" },
      { "<leader>ff", function() require("fzf-lua-git-search").files({ root = true }) end, desc = "Find Files (Root Dir)" },
      { "<leader>fF", function() require("fzf-lua-git-search").files({ root = false }) end, desc = "Find Files (cwd)" },
      { "<leader>sg", function() require("fzf-lua-git-search").live_grep({ root = true }) end, desc = "Grep (Root Dir)" },
      { "<leader>sG", function() require("fzf-lua-git-search").live_grep({ root = false }) end, desc = "Grep (cwd)" },
      { "<leader>sw", function() require("fzf-lua-git-search").grep_cword({ root = true }) end, desc = "Word (Root Dir)" },
      { "<leader>sW", function() require("fzf-lua-git-search").grep_cword({ root = false }) end, desc = "Word (cwd)" },
      { "<leader>sw", function() require("fzf-lua-git-search").grep_visual({ root = true }) end, mode = "v", desc = "Selection (Root Dir)" },
      { "<leader>sW", function() require("fzf-lua-git-search").grep_visual({ root = false }) end, mode = "v", desc = "Selection (cwd)" },
      -- stylua: ignore end
    },
  },
}
