local Buffer = {}

function Buffer.close_anonymous_buffers()
  local buflist = vim.api.nvim_list_bufs()
  for _, bufnr in ipairs(buflist) do
    if (vim.api.nvim_buf_get_name(bufnr) == "") and (vim.fn.buflisted(bufnr) == 1) then
      vim.api.nvim_buf_delete(bufnr, { force = true })
    end
  end
end

return Buffer
