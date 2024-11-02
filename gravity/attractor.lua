Attractor = {}
Attractor.__index = Attractor

function Attractor:create(position, mass)
    local attractor = {}
    setmetatable(attractor, Attractor)
    attractor.position = position
    attractor.mass = mass
    attractor.size = 30 + 0.3 * mass 
    attractor.inner_size = attractor.size
    return attractor
end

function Attractor:attract(mover)
    local force = self.position - mover.position
    local distance = force:mag()
    if distance then
        if distance < 5 then
            distance = 5
        end
        if distance > 50 then
            distance = 50
        end
        local direction = force:norm()
        local strength = (0.9 * self.mass * mover.mass) / (distance*distance)
        direction:mul(strength)
        return direction
    end
end

function Attractor:draw()
    love.graphics.circle("line", self.position.x, self.position.y, self.size)
    self.inner_size = self.inner_size - 0.5
    if self.inner_size <= 0 then
        self.inner_size = self.size
    end
    love.graphics.circle("line", self.position.x, self.position.y, self.inner_size)
end
