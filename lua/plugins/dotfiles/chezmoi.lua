vim.filetype.add({
  filename = {
    ["dot_zshrc"] = "zsh",
    ["dot_zshenv"] = "zsh",
    ["dot_clang-format"] = "yaml",
    ["dot_gitconfig"] = "gitconfig",
  },
  pattern = {
    [".*/gitconfig/.*"] = "gitconfig",
    -- TODO: Injections within template: https://github.com/nvim-treesitter/nvim-treesitter/discussions/1917
    [".*%.sh%.tmpl"] = "sh",
    [".*%.zsh%.tmpl"] = "zsh",
    [".*%.ps1%.tmpl"] = "ps1",
    [".*%.toml%.tmpl"] = "toml",
  },
})

return {
  { import = "lazyvim.plugins.extras.util.chezmoi" },

  -- FIXME: Windows have the following issues:
  --  - powershell: os.getenv("HOME") returns nil
  --  - msys2: $HOME can include illegal back reference (need normalize?)
  {
    "alker0/chezmoi.vim",
    cond = function()
      if require("util.os").get_os() == "windows" then
        return false
      end
      return true
    end,
  },
  {
    "xvzc/chezmoi.nvim",
    cond = function()
      if require("util.os").get_os() == "windows" then
        return false
      end
      return true
    end,
    init = function() end,
  },
}
