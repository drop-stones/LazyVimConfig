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
  },
}
