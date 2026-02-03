-- The Nix language
return vim.fn.executable("nix") == 1
    and vim.fn.executable("nixfmt") == 1
    and vim.fn.executable("statix") == 1
    and { import = "lazyvim.plugins.extras.lang.nix" }
  or {}
