
local Starfield = require("starfield")

local bullets = {}
local active = {}

function bullets:update(dt)
  for k = #active, 1, -1 do
    if active[k].x < 0 or active[k].x > Starfield.bgSize or 
       active[k].y < 0 or active[k].y > Starfield.bgSize or active[k].age > 1 then
       table.remove(active, k)
    else
      active[k].x = active[k].x + math.cos(active[k].angle) * dt * 1000
      active[k].y = active[k].y + math.sin(active[k].angle) * dt * 1000
      active[k].age = active[k].age + dt
    end
  end
end

function bullets:draw()
  love.graphics.print(#active)
  for k, v in pairs(active) do
    love.graphics.circle("fill", v.x - Starfield.x, v.y - Starfield.y, 2)
  end
end

function bullets:fire(x, y, angle)
  table.insert(active, {x = x, y = y, angle = angle, age = 0})
end

return bullets