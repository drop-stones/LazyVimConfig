local Job = require("plenary.job")

local M = {}

--- From treesitter.nvim
---@param cmd table<string>
---@param cwd string?
---@return table, integer, table
function M.get_os_command_output(cmd, cwd)
  local command = table.remove(cmd, 1)
  local stderr = {}
  local stdout, ret = Job:new({
    command = command,
    args = cmd,
    cwd = cwd,
    on_stderr = function(_, data)
      table.insert(stderr, data)
    end,
  }):sync()
  return stdout, ret, stderr
end

return M
