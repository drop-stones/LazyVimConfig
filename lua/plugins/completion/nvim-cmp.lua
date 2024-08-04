return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      local LazyVim = require("lazyvim.util.cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() and has_words_before() then
            if #cmp.get_entries() == 1 then
              LazyVim.confirm({ select = true })(fallback)
            else
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select, count = 1 })
            end
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() and has_words_before() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select, count = 1 })
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping(function(fallback)
          LazyVim.confirm({ behavior = require("cmp").ConfirmBehavior.Replace, select = false })(fallback)
        end, { "i", "s" }),
      })

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      opts.preselect = require("cmp").PreselectMode.None
      opts.completion = { completeopt = "menu,menuone,noselect" } -- disable preslect for LSPs
    end,
  },
}
