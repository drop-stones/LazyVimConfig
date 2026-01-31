-- obsidian.nvim requires conceallevel to be set 1 or 2
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.opt.conceallevel = 2
  end,
})
