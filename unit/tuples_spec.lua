require 'busted.runner'()
require 'tuple'

describe("A tuple with w=1.0 is a point", function()
  local t = Tuple:new(4.3, -4.2, 3.1, 1.0)

  assert.are.equal(t.x, 4.3)
  assert.are.equal(t.y, -4.2)
  assert.are.equal(t.z, 3.1)
  assert.are.equal(t.w, 1.0)
  assert.are.equal(t:type(), "point")
  assert.are_not.equal(t:type(), "vector")
end)

describe("A tuple with w=0 is a vector", function()
  local t = Tuple:new(4.3, -4.2, 3.1, 0.0)

  assert.are.equal(t.x, 4.3)
  assert.are.equal(t.y, -4.2)
  assert.are.equal(t.z, 3.1)
  assert.are.equal(t.w, 0.0)
  assert.are.equal(t:type(), "vector")
  assert.are_not.equal(t:type(), "point")
end)

describe("Point:new() creates tuples with w=1", function ()
  local p = Point:new(4, -4, 3)
  local t = Tuple:new(4, -4, 3, 1)

  assert.are.equals(p, t)
  assert.are.equal(p.w, 1)
  assert.are.equal(p:type(), "point")
end)

describe("Vector:new() creates tuples with w=0", function ()
  local v = Vector:new(4, -4, 3)
  local t = Tuple:new(4, -4, 3, 0)

  assert.are.equals(v.x, t.x)
  assert.are.equal(v.w, 0)
  assert.are.equal(v:type(), "vector")
end)

describe("Adding two tuples", function ()
  local t1 = Tuple:new(3, -2, 5, 1)
  local t2 = Tuple:new(-2, 3, 1, 0)

  assert.are.equals(t1 + t2, Tuple:new(1, 1, 6, 1))

  assert.are.equals(Tuple:new(5,7,9,2), Point:new(1,2,3) + Point:new(4,5,6))
  assert.are.equals(Tuple:new(5,7,9,0), Vector:new(1,2,3) + Vector:new(4,5,6))
end)

describe("Subtracting two points", function ()
  local p1 = Point:new(3, 2, 1)
  local p2 = Point:new(5, 6, 7)

  assert.are.equals(Vector:new(-2, -4, -6), p1 - p2)
end)

describe("Subtracting a vector from a point", function ()
  local p = Point:new(3, 2, 1)
  local v = Vector:new(5, 6, 7)

  assert.are.equals(Point:new(-2, -4, -6), p - v)
end)

describe("Subtracting two vectors", function ()
  local v1 = Vector:new(3, 2, 1)
  local v2 = Vector:new(5, 6, 7)

  assert.are.equals(Vector:new(-2, -4, -6), v1 - v2)
end)

describe("Subtracting a vector from the zero vector", function ()
  local zero = Vector:new(0, 0, 0)
  local v = Vector:new(1, -2, 3)

  assert.are.equals(Vector:new(-1, 2, -3), zero - v)
end)

describe("Negating a tuple", function ()
  local t = Tuple:new(1, -2, 3, -4)
  
  assert.are.equals(Tuple:new(-1, 2, -3, 4), -t)
end)

describe("Multiplying a tuple by a scalar", function ()
  local t = Tuple:new(1, -2, 3, -4)

  assert.are.equals(Tuple:new(3.5, -7, 10.5, -14), t * 3.5)
end)

describe("Multiplying a tuple by a fraction", function ()
  local t = Tuple:new(1, -2, 3, -4)

  assert.are.equals(Tuple:new(0.5, -1, 1.5, -2), t * 0.5)
end)

describe("Dividing a tuple by a scalar", function ()
  local t = Tuple:new(1, -2, 3, -4)

  assert.are.equals(Tuple:new(0.5, -1, 1.5, -2), t / 2)
end)

describe("Computing the magnitude of vector(1, 0, 0)", function ()
  local v = Vector:new(1, 0, 0)

  assert.are.equals(1, v:magnitude())
end)

describe("Computing the magnitude of vector(0, 1, 0)", function ()
  local v = Vector:new(0, 1, 0)

  assert.are.equals(1, v:magnitude())
end)

describe("Computing the magnitude of vector(1, 2, 3)", function ()
  local v = Vector:new(1, 2, 3)

  assert.are.equals(math.sqrt(14), v:magnitude())
end)

describe("Computing the magnitude of vector(-1, -2, -3)", function ()
  local v = Vector:new(-1, -2, -3)

  assert.are.equals(math.sqrt(14), v:magnitude())
end)

describe("Normalizing vector(4, 0, 0) gives (1, 0, 0)", function ()
  local v = Vector:new(4, 0, 0)

  assert.are.equals(Vector:new(1, 0, 0), v:normalize())
end)

describe("Normalizing vector(1, 2, 3)", function ()
  local v = Vector:new(1, 2, 3)

  --                   1/sqrt(14), 2/sqrt(14), 3/sqrt(14)
  assert.are.equals(Vector:new(0.26726, 0.53452, 0.80178), v:normalize())
end)

describe("The magnitude of a normalized vector", function ()
  local v = Vector:new(1, 2, 3)
  local norm = v:normalize()

  assert.are.equals(1, norm:magnitude())
end)

describe("The dot product of two tuples", function ()
  local a = Vector:new(1, 2, 3)
  local b = Vector:new(2, 3, 4)

  assert.are.equal(20, a:dot(b))
end)

describe("The cross product of two vectors", function ()
  local a = Vector:new(1, 2, 3)
  local b = Vector:new(2, 3, 4)

  assert.are.equals(Vector:new(-1, 2, -1), a:cross(b))
  assert.are.equals(Vector:new(1, -2, 1), b:cross(a))
end)