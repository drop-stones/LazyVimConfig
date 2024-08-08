return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>f", group = "file/find", mode = "x" },
      },
    },
  },
  {
    "chrisgrieser/nvim-rip-substitute",
    cmd = "RipSubstitute",
    opts = {
      popupWin = {
        border = vim.g.borderStyle,
        hideSearchReplaceLabels = true,
      },
      prefill = {
        visual = false,
        startInReplaceLineIfPrefill = true,
      },
      editingBehavior = {
        autoCaptureGroups = true,
      },
    },
    keys = {
      {
        "<leader>fs",
        function()
          local mode = vim.fn.mode()
          if mode == "n" then
            require("rip-substitute").sub()
          else -- visual mode
            local begin_line = vim.fn.getpos("'<")[2]
            local end_line = vim.fn.getpos("'>")[2]
            require("rip-substitute").sub({ range = 2, line1 = begin_line, line2 = end_line, args = "" })
          end
        end,
        mode = { "n", "x" },
        desc = " rip substitute",
      },
    },
    config = function(_, opts)
      require("rip-substitute").setup(opts)

      -- Set completion sources
      local cmp = require("cmp")
      cmp.setup.filetype("rip-substitute", {
        sources = cmp.config.sources({
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                local bufs = {}
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                  bufs[vim.api.nvim_win_get_buf(win)] = true
                end
                return vim.tbl_keys(bufs)
              end,
            },
          },
        }),
      })
    end,
  },
}
