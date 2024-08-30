local path = {}

local os = require("util.os")

function path.sep()
  local os_kind = os.get_os()
  if (os_kind == "windows") and (os.is_msystem() == false) then
    return "\\"
  else
    return "/"
  end
end

return path
