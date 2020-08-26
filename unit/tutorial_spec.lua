require 'busted.runner'()
require 'account'
require 'special-account'


describe("Test Account Class", function ()
  local a = Account:new()
  local b = Account:new()

  -- Using the colon operator, Lua hides the self parameter
  a:deposit(100)
  assert.are.equal(a.balance, 100)
  
  a:withdraw(25)
  assert.are.equal(a.balance, 75)

  assert.are_not.equal(a.balance, b.balance)

  b:deposit(75)
  assert.are.same(a, b)
end)

describe("Test Special Account Class", function ()
  -- Start with an empty class that inherits all operations from base class
  local s = SpecialAccount:new{limit=1000.00}

  s:deposit(200)
  s:withdraw(50)
  assert.are.equal(s.balance, 150)

  assert.has_error(function () s:withdraw(2000) end)
end)

describe("Busted unit testing framework", function()
  describe("should be awesome", function()
    it("should be easy to use", function()
      assert.truthy("Yup.")
    end)

    it("should have lots of features", function()
      -- deep check comparisons!
      assert.are.same({ table = "great"}, { table = "great" })

      -- or check by reference!
      assert.are_not.equal({ table = "great"}, { table = "great"})

      assert.truthy("this is a string") -- truthy: not false or nil

      assert.True(1 == 1)
      assert.is_true(1 == 1)

      assert.falsy(nil)
      assert.has_error(function() error("Wat") end, "Wat")
    end)

    it("should provide some shortcuts to common functions", function()
      assert.are.unique({{ thing = 1 }, { thing = 2 }, { thing = 3 }})
    end)

  end)
end)