Tuple = {
  x = 0,
  y = 0,
  z = 0,
  w = 0,
  
  __add = function (a, b)
    return Tuple:new(
      a.x + b.x, a.y + b.y, 
      a.z + b.z, a.w + b.w
    )
  end,

  __sub = function (a, b)
    local x = a.x - b.x
    local y = a.y - b.y
    local z = a.z - b.z
    local w = a.w - b.w
    
    if w == 0 then
      return Vector:new(x, y, z)
    elseif w == 1 then
      return Point:new(x, y, z)
    else
      return Tuple:new(x, y, z, w)
    end
  end,

  __tostring = function (self)
    return "{" .. self.x .. ", " .. self.y .. ", " 
      .. self.z .. ", " .. self.w  .."}"
  end
}

function Tuple:new(x, y, z, w)
  local t = {
    x = x or 0,
    y = y or 0,
    z = z or 0,
    w = w or 0
  }

  setmetatable(t, self)
  self.__index = self
  return t
end

function Tuple:type()
  if self.w == 0 then
    return "vector"
  elseif self.w == 1 then
    return "point"
  else
    return "tuple"
  end
end

Point = {}
function Point:new(x, y, z)
  local t = {
    x = x or 0,
    y = y or 0,
    z = z or 0,
    w = 1
  }

  -- Todo: Create Point MT(?)
  setmetatable(t, Tuple)
  self.__index = self
  return t
end

function Point:type()
    return "point"
end

Vector = {}
function Vector:new(x, y, z)
  local t = {
    x = x or 0,
    y = y or 0,
    z = z or 0,
    w = 0
  }

  -- Todo: Create Vector MT (?)
  setmetatable(t, Tuple)
  self.__index = self
  return t
end

function Vector:type()
    return "vector"
end