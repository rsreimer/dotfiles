function table:any(fn)
  for _, value in pairs(self) do
    if fn(value) then
      return true
    end
  end

  return false
end

function table:filter(fn)
  local result = {}

  for _, value in pairs(self) do
    if fn(value) then
      table.insert(result, value)
    end
  end

  return result
end
