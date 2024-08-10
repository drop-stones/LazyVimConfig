--- Check whether sqlite3.dll is installed or not
--- On windows, env.SQLITE3_DLL_PATH is required to be set to the path to sqlite3.dll
---@return boolean
local is_sqlite3_dll_installed = function()
  local luv = require("luv")
  local os = luv.os_uname().sysname
  if os == "Windows_NT" then
    local path, _ = luv.os_getenv("SQLITE3_DLL_PATH")
    if path ~= nil then
      vim.g.sqlite_clib_path = path
      return true
    end
  else
    local path = vim.fn.exepath("sqlite3")
    if path ~= nil then
      return true
    end
  end
  return false
end

return {
  -- Improved Yank and Put
  { import = "lazyvim.plugins.extras.coding.yanky" },
  {
    "gbprod/yanky.nvim",
    dependencies = {
      {
        "kkharji/sqlite.lua",
        enabled = is_sqlite3_dll_installed,
      },
    },
    opts = {
      ring = {
        storage = (is_sqlite3_dll_installed() and "sqlite") or "shada",
      },
    },
  },
}
