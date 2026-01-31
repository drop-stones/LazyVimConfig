-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local path = vim.fn.stdpath("config") .. "/lua/config/autocmds"
for _, file in ipairs(vim.fn.readdir(path)) do
  local ext = vim.fn.fnamemodify(file, ":e")
  local basename = vim.fn.fnamemodify(file, ":t:r")
  if ext == "lua" and basename ~= "init" then
    require("config.autocmds." .. basename)
  end
end
