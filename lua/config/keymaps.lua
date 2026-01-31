-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Paste by '<C-v>'
map({ "i", "c" }, "<C-v>", "<C-r>+")
if vim.fn.has("win32") or vim.fn.has("win64") then -- Paste does not work in terminal mode only in windows
  map("t", "<C-v>", [['<C-\><C-N>"+pi']], { expr = true })
end

-- Prints the current file name
map("n", "<C-p>", "<C-g>")

-- Escape insert mode by 'ｊｋ'
map("i", "ｊｋ", "<Esc>")

local has_private_keymaps, private_keymaps = pcall(require, "config.private.keymaps")
