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

-- commentstring
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "cpp", "cs" },
  callback = function()
    vim.bo.commentstring = "// %s"
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

local has_private_autocmds, private_autocmds = pcall(require, "config.private.autocmds")
