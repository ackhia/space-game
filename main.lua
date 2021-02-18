
local Ship = require("ship")
local Starfield = require("starfield")

function love.load()
  Starfield:load()
  Ship:load()
end

function love.update(dt)
  Ship:update(dt)
end

function love.draw()
  Starfield:draw()
  Ship:draw()
end