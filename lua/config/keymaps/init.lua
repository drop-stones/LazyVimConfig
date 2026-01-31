-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local path = vim.fn.stdpath("config") .. "/lua/config/keymaps"
for _, file in ipairs(vim.fn.readdir(path)) do
  local ext = vim.fn.fnamemodify(file, ":e")
  local basename = vim.fn.fnamemodify(file, ":t:r")
  if ext == "lua" and basename ~= "init" then
    require("config.keymaps." .. basename)
  end
end
