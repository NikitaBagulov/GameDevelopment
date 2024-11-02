require "vector"
require "mover"
require "attractor"

function love.load()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    gravity = Vector:create(0, 0.01)

    -- mover  = Mover:create(Vector:create(width/3, 250), Vector:create(), 5)
    movers = Movers:create(0, width, 0, height, 10, 5)
    -- attractor = Attractor:create(Vector:create(width/2, 100), 5)
    -- attractor1 = Attractor:create(Vector:create(width/2, 400), 10)

end

function love.update()
    -- mover:applyForce(gravity)

    -- local friction = (mover.velocity * -1):norm()
    -- if friction then
    --     friction:mul(0.0005)
    --     mover:applyForce(friction)
    -- end
    -- local force1 = attractor:attract(mover)
    -- local force2 = attractor1:attract(mover)
    -- mover:applyForce(force1)
    -- mover:applyForce(force2)
    -- mover:force_boundaries()
    -- mover:update()
    movers:update()
end

function love.draw()
    -- mover:draw()
    movers:draw()
    -- attractor:draw()
    -- attractor1:draw()
end