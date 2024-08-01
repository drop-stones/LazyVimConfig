return {
  -- Escape by "jk" and "ｊｋ" (in double-byte character)
  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    opts = {
      timeout = 150,
      default_mappings = false,
      mappings = {
        i = {
          j = {
            k = "<Esc>",
          },
          ["ｊ"] = {
            ["ｋ"] = "<Esc>",
          },
        },
        c = {
          j = {
            k = "<Esc>",
          },
          ["ｊ"] = {
            ["ｋ"] = "<Esc>",
          },
        },
        t = {
          j = {
            k = function()
              local buf_name = vim.api.nvim_buf_get_name(0)
              local is_lazygit = string.find(buf_name, "term://.*lazygit.*")
              if is_lazygit ~= nil then
                return "<Esc>"
              end
              return "<C-\\><C-N>"
            end,
          },
          ["ｊ"] = {
            ["ｋ"] = "<C-\\><C-N>",
          },
        },
        v = {
          j = {
            k = "<Esc>",
          },
        },
        s = {
          j = {
            k = "<Esc>",
          },
          ["ｊ"] = {
            ["ｋ"] = "<Esc>",
          },
        },
      },
    },
  },
}
