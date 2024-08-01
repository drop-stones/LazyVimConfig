return {
  -- Assembly/LLVM codes
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "asm", "objdump", "llvm" } },
  },
}
