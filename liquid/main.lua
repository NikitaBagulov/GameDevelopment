require "vector"
require "mover"
require "liquid"

function love.load()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    gravity = Vector:create(0, 0.01)

    mover  = Mover:create(Vector:create(width/4, 100), Vector:create(), 5, 50, 50)
    mover1  = Mover:create(Vector:create(width/4*3, 100), Vector:create(), 5, 100, 50)
    liquid = Liquid:create(0, height/2, width, height/2, 0.05)
end

function love.update()
    mover:applyForce(gravity)
    mover1:applyForce(gravity)

    local friction = (mover.velocity * -1):norm()
    if friction then
        friction:mul(0.0005)
        mover:applyForce(friction)
    end

    local friction1 = (mover1.velocity * -1):norm()
    if friction1 then
        friction1:mul(0.0005)
        mover1:applyForce(friction1)
    end
    
    if liquid:isInside(mover) then
        local mag = mover.velocity:mag()
        drag = liquid.c * mag * mag/100
        local dragVec = (mover.velocity * -1):norm()
        dragVec:mul(drag)
        dragVec:mul(mover.w)
        mover:applyForce(dragVec)
    end

    if liquid:isInside(mover1) then
        local mag1 = mover1.velocity:mag()
        drag1 = liquid.c * mag1 * mag1/100
        local dragVec1 = (mover1.velocity * -1):norm()
        dragVec1:mul(drag1)
        dragVec1:mul(mover1.w)
        mover1:applyForce(dragVec1)
    end
    mover:force_boundaries()
    mover:update()
    mover1:force_boundaries()
    mover1:update()
end

function love.draw()
    liquid:draw()
    mover:draw()
    mover1:draw()
    
end