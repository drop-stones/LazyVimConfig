-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.fn.has("win32") or vim.fn.has("win64") then
  if vim.fn.executable("zsh") == 1 or vim.fn.executable("bash") then
    vim.opt.shell = vim.fn.executable("zsh") and "zsh" or "bash"

    -- Change windows default "/s /c" to "-c"
    -- https://neovim.io/doc/user/options.html#'shellcmdflag'
    vim.opt.shellcmdflag = "-c"

    -- Clear windows default "\""
    -- https://neovim.io/doc/user/options.html#'shellquote'
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
  elseif vim.fn.executable("pwsh") == 1 then
    vim.opt.shell = "pwsh"
  end
end

vim.opt.spelllang = { "en_us", "cjk" }
vim.opt.spell = true

local has_private_options, private_options = pcall(require, "config.private.options")
