local cmds = require("plugins.fuzzy_finder.fzf-lua.cmds")

local M = {}

-- Normal mode in fzf-lua
local normal_keymap = {
  -- motion
  { key = "j", action = "<Down>" },
  { key = "k", action = "<Up>" },
  { key = "<Down>", action = "<Down>" },
  { key = "<Up>", action = "<Up>" },
  { key = "gg", action = "<A-G>" }, -- first
  { key = "G", action = "<A-g>" }, -- end
  { key = "<C-u>", action = "<C-u>" }, -- page-up
  { key = "<C-d>", action = "<C-d>" }, --page-down
  { key = "s", action = "<C-x>", insert = true }, -- jump
  -- preview
  { key = "J", action = "<C-f>" },
  { key = "K", action = "<C-b>" },
  -- menu
  { key = "m", action = "<A-m>", insert = true },
  -- quit
  { key = "q", action = "<Esc>" },
  -- select
  { key = "<Enter>", action = "<Enter>" },
}

-- Normal mode
local fzf_keymap = {
  keys = {
    { "<leader>/", cmds.live_grep(), desc = "Grep (Root Dir)" },
    { "<leader>sg", cmds.live_grep(), desc = "Grep (Root Dir)" },
    { "<leader>sG", cmds.live_grep({ root = false }), desc = "Grep (cwd)" },
    { "<leader>sw", cmds.grep_cword(), desc = "Word (Root Dir)" },
    { "<leader>sW", cmds.grep_cword({ root = false }), desc = "Word (cwd)" },
    { "<leader>sw", cmds.grep_visual(), mode = "v", desc = "Selection (Root Dir)" },
    { "<leader>sW", cmds.grep_visual({ root = false }), mode = "v", desc = "Selection (cwd)" },
    { "<leader>ff", cmds.find_files(), desc = "Find Files (Root Dir)" },
    { "<leader>fF", cmds.find_files({ root = false }), desc = "Find Files (cwd)" },
  },
  remove_keys = {
    { "<leader>fg" },
  },
}

local setup_keymap = function(mode, keymap)
  vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "filetype",
    callback = function()
      if vim.bo.filetype ~= "fzf" then
        return
      end
      for _, keybind in ipairs(keymap) do
        if type(keybind.action) == "function" then
          vim.keymap.set(mode, keybind.key, keybind.action, { buffer = true })
        else
          vim.keymap.set(mode, keybind.key, function()
            if keybind.insert then
              return "i" .. keybind.action
            else
              return "i" .. keybind.action .. "<C-\\><C-N>" .. "l" -- "l" is to not move the cursor position
            end
          end, { buffer = true, expr = true, remap = true })
        end
      end
    end,
  })
  vim.api.nvim_set_option_value("cursorline", false, { scope = "local" }) -- disable search window highlighting
end

function M.setup_normal_keymap()
  setup_keymap("n", normal_keymap)
end

function M.setup_fzf_keymap(fzf_keys)
  local keys = {}
  for _, v in ipairs(fzf_keys) do
    local overwrite = false
    for _, additional_key in ipairs(fzf_keymap.keys) do
      if v[1] == additional_key[1] then
        overwrite = true
      end
    end

    local remove = false
    for _, remove_key in ipairs(fzf_keymap.remove_keys) do
      if v[1] == remove_key[1] then
        remove = true
      end
    end

    if (overwrite == false) and (remove == false) then
      table.insert(keys, v)
    end
  end

  for _, v in ipairs(fzf_keymap.keys) do
    table.insert(keys, v)
  end
  return keys
end

return M
