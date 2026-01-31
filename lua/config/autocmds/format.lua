-- formatoptions (we need to create autocmd because fo is overwritten by ftplugin)
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "r", "o" })
  end,
})
