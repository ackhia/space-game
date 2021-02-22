
starfield = {}

bgSize = 10000

function starfield:load()
  bg = love.graphics.newCanvas(bgSize, bgSize)
  love.graphics.setCanvas(bg)
  for i = 0, 50000
  do
    x = love.math.random() * bgSize
    y = love.math.random() * bgSize
    size = love.math.random() * 2 
    love.graphics.setColor(1, 1, 1, love.math.random())
    love.graphics.circle('fill', x, y, size)
  end
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setCanvas()
  self.x = 0
  self.y = 0
end

function starfield:update(dt, shipX, shipY)
  screenWidth = love.graphics.getWidth()
  screenHeight = love.graphics.getHeight()

  oldX = self.x
  oldY = self.y

  self.x = self.x + (shipX - screenWidth / 2) * 3 * dt
  self.y = self.y + (shipY - screenHeight / 2) * 3 * dt 

  self.x = math.max(self.x, 0)
  self.y = math.max(self.y, 0)  
  self.x = math.min(self.x, bgSize - screenWidth)
  self.y = math.min(self.y, bgSize - screenHeight)

  su = {}
  su.x = oldX-self.x
  su.y = oldY-self.y
  return su
end

function starfield:draw()
  love.graphics.print(self.y)
  love.graphics.draw(bg, 0, 0, 0, 1, 1, self.x, self.y)
end

return starfield