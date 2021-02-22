
local Ship = require("ship")
local Starfield = require("starfield")

function love.load()
  Starfield:load()
  Ship:load()
end

function love.update(dt)
  su = Starfield:update(dt, Ship.x, Ship.y)
  Ship:update(dt, su)
end

function love.draw()
  Starfield:draw()
  Ship:draw()
end