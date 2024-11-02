require "vector"
require "mover"

function love.load()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    mover  = Mover:create(Vector:create(width/4, 200), Vector:create(), 1)
    mover2  = Mover:create(Vector:create(width/4*3, 200), Vector:create(), 5)
    wind = Vector:create(0.01, 0)
    isWind = false
    gravity = Vector:create(0, 0.01)
    isGravity = false
    floating = Vector:create(0, -0.02)
    isFloating = false
    -- mover.acceleration.x = 0.01
    -- mover.acceleration.y = -0.01
end

function love.update()
    if isGravity then
        mover:applyForce(gravity)
        mover2:applyForce(gravity)
    end
    if isFloating then
        mover:applyForce(floating)
        mover2:applyForce(floating)
    end
    if isWind then
        mover:applyForce(wind)
        mover2:applyForce(wind)
    end

    if mover.position.x < width/2 and mover.position.y > height - mover.size then
        local friction = (mover.velocity * -1):norm()
        if friction then
            friction:mul(0.005)
            mover:applyForce(friction)
        end
    end

    if mover.position.x > width/2 and mover.position.y > height - mover.size then
        local friction = mover.velocity:norm()
        if friction then
            friction:mul(0.005)
            mover:applyForce(friction)
        end
    end

    if mover2.position.x < width/2 and mover2.position.y > height - mover2.size then
        local friction = (mover2.velocity * -1):norm()
        if friction then
            friction:mul(0.005)
            mover:applyForce(friction)
        end
    end

    if mover2.position.x > width/2 and mover2.position.y > height - mover2.size then
        local friction = mover2.velocity:norm()
        if friction then
            friction:mul(0.005)
            mover:applyForce(friction)
        end
    end
    -- local x, y = love.mouse.getPosition()
    -- local mouse = Vector:create(x, y)
    -- local diff = mouse - mover.position
    -- local dir = diff:norm()
    -- local acceleration = dir * 0.2 --???
    -- mover.acceleration = acceleration
    mover:update()
    mover2:update()
    mover:force_boundaries()
    mover2:force_boundaries()
    -- mover:check_boundaries()
end

function love.draw()
    mover:draw()
    mover2:draw()
    love.graphics.print("w: " .. tostring(isWind) .. " g: " .. tostring(isGravity) .. " f: " .. tostring(isFloating))
end

function love.keypressed(key)
    if key == 'g' then
        isGravity = not isGravity
    end
    if key == 'f' then
        isFloating = not isFloating
    end
    if key == 'w' then
        isWind = not isWind
        if isWind then
            wind:mul(-1)
        end
    end
end
