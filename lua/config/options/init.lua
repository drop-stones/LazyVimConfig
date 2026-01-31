-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local path = vim.fn.stdpath("config") .. "/lua/config/options"
for _, file in ipairs(vim.fn.readdir(path)) do
  local ext = vim.fn.fnamemodify(file, ":e")
  local basename = vim.fn.fnamemodify(file, ":t:r")
  if ext == "lua" and basename ~= "init" then
    require("config.options." .. basename)
  end
end
