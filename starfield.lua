
starfield = {}

function starfield:load()
  self.bgSize = 10000
  bg = love.graphics.newCanvas(self.bgSize, self.bgSize)
  love.graphics.setCanvas(bg)
  for i = 0, 50000
  do
    x = love.math.random() * self.bgSize
    y = love.math.random() * self.bgSize
    size = love.math.random() * 2 
    love.graphics.setColor(1, 1, 1, love.math.random())
    love.graphics.circle('fill', x, y, size)
  end
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setCanvas()
  self.x = 0
  self.y = 0
end

function starfield:update(dt, ship)
  screenWidth = love.graphics.getWidth()
  screenHeight = love.graphics.getHeight()

  oldX = self.x
  oldY = self.y

  self.x = self.x + (ship.x - screenWidth / 2) * 3 * dt
  self.y = self.y + (ship.y - screenHeight / 2) * 3 * dt 

  self.x = math.max(self.x, 0)
  self.y = math.max(self.y, 0)  
  self.x = math.min(self.x, self.bgSize - screenWidth)
  self.y = math.min(self.y, self.bgSize - screenHeight)

  su = {}
  su.x = oldX-self.x
  su.y = oldY-self.y
  return su
end

function starfield:draw()
  love.graphics.draw(bg, 0, 0, 0, 1, 1, self.x, self.y)
end

return starfield