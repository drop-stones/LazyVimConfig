return {
  -- TreeSitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = {
        -- disable indentation because it is experimental feature
        -- See https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#indentation
        enable = false,
      },
    },
  },
}
