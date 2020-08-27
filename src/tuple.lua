Tuple = {
  x = 0,
  y = 0,
  z = 0,
  w = 0,

  -- https://mathinsight.org/vectors_cartesian_coordinates_2d_3d
  magnitude = function (self)
    return math.sqrt(self.x^2 + self.y^2 + self.z^2 + self.w^2)
  end,

  normalize = function (self)
    local mag = self:magnitude()
    local a = Tuple:new(self.x / mag, self.y / mag, self.z / mag, self.w / mag)
    return a
  end,

  dot = function (self, b)
    -- The smaller the dot product, the larger the angle between the vectors
    return self.x * b.x +
           self.y * b.y +
           self.z * b.z +
           self.w * b.w
  end,
  
  __add = function (a, b)
    return Tuple:new(a.x + b.x, a.y + b.y, a.z + b.z, a.w + b.w)
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

  __unm = function (a)
    return Tuple:new(0, 0, 0, 0) - a
  end,

  __mul = function (a, b)
    return Tuple:new(a.x * b, a.y * b, a.z * b, a.w * b)
  end,

  __div = function (a, b)
    return Tuple:new(a.x / b, a.y / b, a.z / b, a.w / b)
  end,

  __eq = function (a, b)
    local epsilon = 0.00001

    return math.abs(a.x - b.x) < epsilon
      and math.abs(a.y - b.y) < epsilon
      and math.abs(a.z - b.z) < epsilon
      and math.abs(a.w - b.w) < epsilon
  end,

  __tostring = function (self)
    return "{" .. self.x .. ", " .. self.y .. ", " .. self.z .. ", " .. self.w  .."}"
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

  setmetatable(t, Tuple)
  self.__index = self
  return t
end

Vector = {}
function Vector:new(x, y, z)
  local t = {
    x = x or 0,
    y = y or 0,
    z = z or 0,
    w = 0,

    cross = function (self, b)
      -- Returns a new vector that is perpendicular to both input vectors
      return Vector:new(
        self.y * b.z - self.z * b.y,
        self.z * b.x - self.x * b.z,
        self.x * b.y - self.y * b.x
      )
    end
  }

  setmetatable(t, Tuple)
  self.__index = self
  return t
end