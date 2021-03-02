
local Ship = require("ship")
local Starfield = require("starfield")
local Bullets = require("bullets")

function love.load()
  Starfield:load()
  Ship:load()
end

function love.update(dt)
  su = Starfield:update(dt, Ship)
  Bullets:update(dt)
  Ship:update(dt, su, Bullets)
end

function love.draw()
  Starfield:draw()
  Bullets:draw()
  Ship:draw()
end