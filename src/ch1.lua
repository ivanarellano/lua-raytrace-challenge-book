require 'tuple'

function Projectile(pos, vel)
  return {
    position = pos or Point:new(),
    velocity = vel or Vector:new()
  }
end

function Tick(env, proj)
  local position = proj.position + proj.velocity
  local velocity = proj.velocity + env.Gravity + env.Wind
  return Projectile(position, velocity)
end

local Environment = {
  Gravity = Vector:new(0, -0.1, 0),
  Wind = Vector:new(-0.01, 0, 0)
}

local P1 = Projectile(Point:new(0, 1, 0), Vector:new(1, 1, 0))

repeat
  P1 = Tick(Environment, P1)
  print(P1.position)
until P1.position.y <= 0