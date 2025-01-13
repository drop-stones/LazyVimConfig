-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Paste by '<C-v>'
map({ "i", "c" }, "<C-v>", "<C-r>+")

local has_private_keymaps, private_keymaps = pcall(require, "config.private.keymaps")
