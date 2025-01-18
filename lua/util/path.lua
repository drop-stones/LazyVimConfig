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

--- Get the path to latest package
---@param dir string
---@param filter string
---@param subdir nil|string
---@return string|nil
function path.latest_package_path(dir, filter, subdir)
  local dir_path = require("plenary.path"):new(dir)
  if not dir_path:exists() then
    return nil
  end
  if not dir_path:is_dir() then
    return nil
  end

  local dirs = {}
  require("plenary.scandir").scan_dir(dir, {
    only_dirs = true,
    depth = 1,
    search_pattern = ".*" .. filter,
    on_insert = function(entry)
      table.insert(dirs, entry)
    end,
  })

  if require("util.table").table_len(dirs) == 0 then
    return nil
  end

  table.sort(dirs)

  if subdir then
    return dirs[#dirs] .. "/" .. subdir
  else
    return dirs[#dirs]
  end
end

return path
