require 'account'

--[[
  Inheritance tutorial: http://lua-users.org/wiki/InheritanceTutorial
]]
SpecialAccount = Account

function SpecialAccount:withdraw (v)
  if v - self.balance >= self:getLimit() then
    error"insufficient funds"
  end
  self.balance = self.balance - v
end

function SpecialAccount:getLimit ()
  return self.limit or 0
end