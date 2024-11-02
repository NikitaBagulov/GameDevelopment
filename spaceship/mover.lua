Mover = {}
Mover.__index = Mover

function Mover:create(position, velocity, mass)
    local mover = {}
    setmetatable(mover, Mover)
    mover.position = position
    mover.velocity = velocity
    mover.mass = mass or 1
    mover.acceleration = Vector:create(0, 0)
    mover.angle = 0 
    mover.active = false
    return mover
end

function Mover:applyForce(force)
        self.acceleration:add(force)
end

function Mover:update()
    self.velocity = self.velocity + self.acceleration
    self.position = self.position + self.velocity
    self.acceleration:mul(0)
end

function Mover:check_boundaries()
    if self.position.x > width then
        self.position.x = 0
    elseif self.position.x < 0 then
        self.position.x = width
    end
    if self.position.y > height then
        self.position.y = 0
    elseif self.position.y < 0 then
        self.position.y = height
    end
end

function Mover:draw()
    love.graphics.push()
    love.graphics.translate(self.position.x, self.position.y)
    love.graphics.rotate(self.angle)
    r, g, b, a = love.graphics.getColor()

    love.graphics.setLineWidth(4)
    love.graphics.line(-30, -30, 30, 0, -30, 30, -30, -30)

    local type = "line"
    if self.active then
        love.graphics.setColor(1, 0, 0, 1)
        type = "fill"
    end
    love.graphics.rectangle(type, -40, 5, 10, 20)
    love.graphics.rectangle(type, -40, -25, 10, 20)

    love.graphics.setColor(r, g, b, a)
    love.graphics.pop()
end