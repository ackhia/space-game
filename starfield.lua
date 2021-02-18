
starfield = {}

function starfield:load()
  bg = love.graphics.newCanvas(10000, 10000)
  love.graphics.setCanvas(bg)
  for i = 0, 1500
  do
    x = love.math.random() * 1000
    y = love.math.random() * 1000
    size = love.math.random() * 2 
    love.graphics.setColor(1, 1, 1, love.math.random())
    love.graphics.circle('fill', x, y, size)
  end
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setCanvas()
end

function starfield:draw()
  love.graphics.draw(bg)
end

return starfield