-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- formatoptions (we need to create autocmd because fo is overwritten by ftplugin)
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "r", "o" })
  end,
})

-- obsidian.nvim requires conceallevel to be set 1 or 2
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.opt.conceallevel = 2
  end,
})

-- mini.pairs: Disable "'" auto-pairs in Rust
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rust" },
  callback = function()
    vim.keymap.set("i", "'", "'", { buffer = 0 })
  end,
})

-- Indent settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust" },
  command = "setlocal shiftwidth=2 tabstop=2 softtabstop=0",
})

-- fish_indent formatter uses 4 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "fish" },
  command = "setlocal shiftwidth=4 tabstop=4 softtabstop=0",
})

local has_private_autocmds, private_autocmds = pcall(require, "config.private.autocmds")
