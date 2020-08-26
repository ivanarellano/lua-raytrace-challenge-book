Tuple = {}
function Tuple:new(x, y, z, w)
  self.x = x or 0
  self.y = y or 0
  self.z = z or 0
  self.w = w or 0

  setmetatable({}, self)
  self.__index = self
  return self
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

Vector = {}
function Vector:new(x, y, z)
  self.x = x or 0
  self.y = y or 0
  self.z = z or 0
  self.w = 0

  setmetatable({}, self)
  self.__index = self
  return self
end

function Vector:type()
    return "vector"
end

Point = {}
function Point:new(x, y, z)
  self.x = x or 0
  self.y = y or 0
  self.z = z or 0
  self.w = 1

  setmetatable({}, self)
  self.__index = self
  return self
end

function Point:type()
    return "point"
end