return {
  { import = "lazyvim.plugins.extras.coding.blink" },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<Right>"] = { "snippet_forward", "fallback" },
        ["<Left>"] = { "snippet_backward", "fallback" },
      },
      completion = {
        list = {
          selection = { preselect = false, auto_insert = false },
        },
      },
    },
  },
}
