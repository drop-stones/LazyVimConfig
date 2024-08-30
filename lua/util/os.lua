local Os = {}

---@alias OsKind "wsl" | "windows" | "mac" | "linux"

---@return OsKind
function Os.get_os()
  if vim.fn.has("wsl") == 1 then
    return "wsl"
  elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    return "windows"
  elseif vim.fn.has("mac") == 1 then
    return "mac"
  elseif vim.fn.has("linux") == 1 then
    return "linux"
  else
    print("Unsupported OS")
    os.exit(1)
  end
end

---@return boolean
function Os.is_msystem()
  local msystem = os.getenv("MSYSTEM")
  return msystem ~= nil
end

return Os
