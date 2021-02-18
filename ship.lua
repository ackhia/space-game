
local ship = {}

function ship:load()
  self.yaw = 0.0
  self.roll = 0.0
  self.x = 200 
  self.y = 200
  self.width = 30
  self.length = 50
  self.maxRoll = 0.1
  self.speed = 0.0
  self.maxSpeed = 10
end

function ship:draw()
  love.graphics.print(self.roll)
  love.graphics.translate(self.x, self.y)
  love.graphics.rotate( self.yaw )
  love.graphics.polygon("fill", 
                        -(self.length / 2), self.width / 2, 
                        self.length / 2, 0,
                        -(self.length / 2), -(self.length / 2)
                        )
  love.graphics.translate(-self.x, -self.y)
  
end

function ship:update(dt)
  local turnKeyDown = false
  if love.keyboard.isDown("right") then
    if self.roll < 0 then
      self.roll = self.roll + dt * 0.6
    else
      self.roll = self.roll + dt * 0.25
    end
    if self.roll > self.maxRoll then
      self.roll = self.maxRoll
    end
    turnKeyDown = true
  end

  if love.keyboard.isDown("left") then
    if self.roll > 0 then
      self.roll = self.roll - dt * 0.6
    else
      self.roll = self.roll - dt * 0.25
    end
    if self.roll < -self.maxRoll then
      self.roll = -self.maxRoll
    end
    turnKeyDown = true
  end

  if turnKeyDown == false then
    if math.abs(self.roll) < dt * 0.5 then
      self.roll = 0
    elseif self.roll > 0 then
      self.roll = self.roll - dt * 0.5
    elseif self.roll < 0 then
      self.roll = self.roll + dt * 0.5
    end
  end 

  if love.keyboard.isDown("up") then
    self.speed = self.speed + dt * 6
    if self.speed > self.maxSpeed then
      self.speed = self.maxSpeed
    end
  else 
    self.speed = self.speed - dt * 8
    if self.speed < 0 then
      self.speed = 0
    end   
  end

  self.yaw = self.yaw + self.roll
  self.yaw = self.yaw % (math.pi * 2)
  self.width = 30 - 30 * (math.abs(self.roll) / math.abs(self.maxRoll)) * 0.8

  velocity_x = self.speed * math.cos(self.yaw)
  velocity_y = self.speed * math.sin(self.yaw)
  self.x = self.x + velocity_x 
  self.y = self.y +  velocity_y
end

return ship