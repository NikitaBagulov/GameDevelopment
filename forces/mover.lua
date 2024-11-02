Mover = {}
Mover.__index = Mover

function Mover:create(position, velocity, mass)
    local mover = {}
    setmetatable(mover, Mover)
    mover.position = position
    mover.velocity = velocity
    mover.mass = mass or 1
    mover.size = size or 20
    mover.acceleration = Vector:create(0, 0)
    return mover
end

function Mover:applyForce(force)
    if force.y > 0 then
        self.acceleration:add(force)
        self.acceleration:mul(self.mass)
    else
        self.acceleration:add(force)
        self.acceleration:div(self.mass)
    end
end

function Mover:update()
    self.velocity = self.velocity + self.acceleration
    self.position = self.position + self.velocity
    self.acceleration:mul(0)
end

function Mover:force_boundaries()
    if self.position.x > width - self.size then
        self.position.x = width - self.size
        self.velocity.x = self.velocity.x * -1
    elseif self.position.x < self.size then
        self.position.x = self.size
        self.velocity.x = self.velocity.x * -1
    end
    if self.position.y > height - self.size then
        self.position.y = height - self.size
        self.velocity.y = self.velocity.y * -1
    elseif self.position.y < self.size then
        self.position.y = self.size
        self.velocity.y = self.velocity.y * -1
    end
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
    love.graphics.circle("fill", self.position.x, self.position.y, self.size)
end