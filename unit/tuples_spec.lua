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

  assert.are.equal(p.x, t.x)
  assert.are.equal(p.y, t.y)
  assert.are.equal(p.z, t.z)
  assert.are.equal(p.w, t.w)
  assert.are.equal(p:type(), "point")
end)

describe("Vector:new() creates tuples with w=0", function ()
  local v = Vector:new(4, -4, 3)
  local t = Tuple:new(4, -4, 3, 0)

  assert.are.equal(v.x, t.x)
  assert.are.equal(v.y, t.y)
  assert.are.equal(v.z, t.z)
  assert.are.equal(v.w, t.w)
  assert.are.equal(v:type(), "vector")
end)

describe("Adding two tuples", function ()
  local t1 = Tuple:new(3, -2, 5, 1)
  local t2 = Tuple:new(-2, 3, 1, 0)

  assert.are.same(t1 + t2, Tuple:new(1, 1, 6, 1))

  assert.are.same(Point:new(1,2,3) + Point:new(4,5,6), Tuple:new(5,7,9,2))
  assert.are.same(Vector:new(1,2,3) + Vector:new(4,5,6), Tuple:new(5,7,9,0))
end)

describe("Subtracting two points", function ()
  local p1 = Point:new(3, 2, 1)
  local p2 = Point:new(5, 6, 7)

  assert.are.same(p1 - p2, Vector:new(-2, -4, -6))
end)

describe("Subtracting a vector from a point", function ()
  local p = Point:new(3, 2, 1)
  local v = Vector:new(5, 6, 7)

  assert.are.same(p - v, Point:new(-2, -4, -6))
end)

describe("Subtracting two vectors", function ()
    local v1 = Vector:new(3, 2, 1)
    local v2 = Vector:new(5, 6, 7)

    assert.are.same(v1 - v2, Vector:new(-2, -4, -6))
end)