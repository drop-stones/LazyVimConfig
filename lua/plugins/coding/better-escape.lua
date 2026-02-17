return {
  -- better-escape.nvim: Map keys without delay when typing
  {
    "max397574/better-escape.nvim",
    event = { "InsertEnter", "TermEnter" },
    opts = {
      timeout = 150,
      mappings = {
        i = { j = { j = false } },
        c = { j = { j = false } },
        t = { j = { k = false } },
      },
    },
  },
}
