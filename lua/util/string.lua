local string = {}

---@param str string
---@param sep string
---@return string[]
function string.split(str, sep)
  local fields = {}
  for field in str:gmatch("([^" .. sep .. "]+)") do
    fields[#fields + 1] = field
  end
  return fields
end

return string
