require ('const')

local Constant = const({
  GRAVITY = 200
})

Constant['Hello'] = 10

function Factorial(number)
  if number == 0 then
    return 1
  else
    return number * Factorial(number - 1)
  end
end

function MyOuterFun()
  local myLocal = "Hello"

  local function myInnerFn(ending)
    print(myLocal .. ending)
  end

  myInnerFn(" World")
end

local TableOfNumbers = {99, 2, 6, 2, 72, 124}

-- for i = 1, #TableOfNumbers do
--   print(TableOfNumbers[i])
-- end

local Table = {
  1, 2, 3,
  ['hello'] = 123,
  world = 234,
  { 4, 5, 6 }
}
print(#Table)
print(Table.hello) --123
print(Table.world) --234
print(Table[4][2]) --5

local Point = { x = 0, y = 0, z = 0}

function Vec2(x, y) end

local vec2_meta = {
  __add =  function (a, b)
    return Vec2(a.x + b.x, a.y + b.y)
  end,

  __sub =  function (a, b)
    return Vec2(a.x - b.x, a.y - b.y)
  end,

  __call = function (self)
    print("{" .. self.x .. ", " .. self.y .. "}")
  end,

  __tostring = function (self)
    return "{" .. self.x .. ", " .. self.y .. "}"
  end

  --__div, __mul
}

function Vec2(x, y)
    local v = {
      x = x or 0,
      y = y or 0
    }

    setmetatable(v, vec2_meta)

    return v
end

local a = Vec2(10, 2)
local b = Vec2(23, 1)
local c = Vec2(0, 0)

c = a + b

print(c.x, c.y)

c = a - b

print(c.x, c.y)

c()
a()
b()

print(c)