-- fish_indent formatter uses 4 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "fish" },
  command = "setlocal shiftwidth=4 tabstop=4 softtabstop=0",
})
