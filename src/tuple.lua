Tuple = {
    x = 0,
    y = 0,
    z = 0,
    w = 0,
    __add =  function (a, b)
      return Tuple:new(a.x + b.x, a.y + b.y, a.z + b.z, a.w + b.w)
    end,
  
    __sub =  function (a, b)
      return Tuple:new(a.x - b.x, a.y - b.y, a.z - b.z, a.w - b.w)
    end

  -- __tostring = function (self)
  --   return "{" .. self.x .. ", " .. self.y .. ", "
  --       .. self.z .. ", " .. self.w "}"
  -- end
}

function Tuple:new(x, y, z, w)
  local t = Tuple
  t.x = x
  t.y = y
  t.z = z
  t.w = w

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
  local t = Tuple
  t.x = x
  t.y = y
  t.z = z
  t.w = 1

  setmetatable({}, t) -- Todo: Create Point MT
  self.__index = self
  return t
end

function Point:type()
    return "point"
end

Vector = {}
function Vector:new(x, y, z)
  local t = Tuple
  t.x = x
  t.y = y
  t.z = z
  t.w = 0

  setmetatable({}, t) -- Todo: Create Vector MT
  self.__index = self
  return t
end

function Vector:type()
    return "vector"
end