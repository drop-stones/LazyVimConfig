local Table = {}

---@param tbl table
---@return integer
function Table.table_len(tbl)
  local len = 0
  for _ in pairs(tbl) do
    len = len + 1
  end
  return len
end

return Table
