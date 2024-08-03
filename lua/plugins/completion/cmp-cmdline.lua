return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "folke/noice.nvim",
    opts = {
      popupmenu = {
        backend = "cmp",
      },
    },
  },
  {
    "hrsh7th/cmp-cmdline",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function(_, _)
      local cmp = require("cmp")

      local confirm_in_select_mode = function(option)
        cmp.confirm(option)
        vim.api.nvim_feedkeys("." .. vim.api.nvim_replace_termcodes("<BS>", true, false, true), "c", false) -- HACK: workaround to activate IncSearch
      end

      local cmdline_next_completion = function(confirm, option)
        if cmp.visible() then
          if #cmp.get_entries() == 1 then
            confirm(option)
          else
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select, count = 1 })
          end
        else
          cmp.complete()
          if #cmp.get_entries() == 1 then
            confirm(option)
          end
        end
      end

      local cmdline_previous_completion = function()
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select, count = 1 })
        else
          cmp.complete()
        end
      end

      local cmdline_confirm_completion = function(confirm, option, fallback)
        if cmp.visible() and (cmp.get_selected_entry() ~= nil) then
          confirm(option)
        else
          fallback()
        end
      end

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline({
          ["<Tab>"] = cmp.mapping(function(_)
            cmdline_next_completion(confirm_in_select_mode, { select = true })
          end, { "c" }),
          ["<S-Tab>"] = cmp.mapping(function(_)
            cmdline_previous_completion()
          end, { "c" }),
          ["<CR>"] = cmp.mapping(function(fallback)
            cmdline_confirm_completion(
              confirm_in_select_mode,
              { behavior = cmp.ConfirmBehavior.Replace, select = false },
              fallback
            )
          end, { "c" }),
        }),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline({
          ["<Tab>"] = cmp.mapping(function(_)
            cmdline_next_completion(cmp.confirm, { select = true })
          end, { "c" }),
          ["<S-Tab>"] = cmp.mapping(function(_)
            cmdline_previous_completion()
          end, { "c" }),
          ["<CR>"] = cmp.mapping(function(fallback)
            cmdline_confirm_completion(
              cmp.confirm,
              { behavior = cmp.ConfirmBehavior.Replace, select = false },
              fallback
            )
          end, { "c" }),
        }),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
    end,
  },
}
