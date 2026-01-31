-- stylua: ignore
return vim.fn.executable("dotnet") == 1 and {
  -- dotnet
  { import = "lazyvim.plugins.extras.lang.dotnet" },
} or {}
