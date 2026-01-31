-- Paste by '<C-v>'
vim.keymap.set({ "i", "c" }, "<C-v>", "<C-r>+")

-- Paste does not work in terminal mode only in windows
if vim.fn.has("win32") or vim.fn.has("win64") then
  vim.keymap.set("t", "<C-v>", [['<C-\><C-N>"+pi']], { expr = true })
end
