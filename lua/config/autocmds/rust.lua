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
