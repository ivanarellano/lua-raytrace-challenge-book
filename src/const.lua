-- Read-Only Tables: https://www.lua.org/pil/13.4.5.html

function const(table)
  local meta_table = {
    __index = function (self, key)
        if table[key] == nil then
          error("Accessed non-existing field: " .. key)
        else
          return table[key]
        end
    end,

    __newindex = function (self, key, value)
        error("Cannot modify const table: " .. key .. " " .. value)
    end,

    __metatable = false
  }
  
  return setmetatable({}, meta_table)
end