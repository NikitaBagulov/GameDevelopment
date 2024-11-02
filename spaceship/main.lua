require "vector"
require "mover"
require "obstacle"

function love.load()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    gravity = Vector:create(0, 0.01)

    mover  = Mover:create(Vector:create(width/4, 100), Vector:create(), 5)
    obstacle = Obstacle:create()

end

function love.update()
    if love.keyboard.isDown("left") then
        mover.angle = mover.angle - 0.05
    end
    if love.keyboard.isDown("right") then
        mover.angle = mover.angle + 0.05
    end

    if love.keyboard.isDown("up") then
        local x = 0.1 * math.cos(mover.angle)
        local y = 0.1 * math.sin(mover.angle)
        mover:applyForce(Vector:create(x, y))
        mover.active = true
    else
        mover.active = false
    end

    mover:check_boundaries()
    mover:update()
    obstacle:check_boundaries()
    obstacle:update()
    
end

function love.draw()
    print("before: ",obstacle.position.x, obstacle.position.y, mover.position.x, mover.position.y)

    -- obstacle.position.x = obstacle.position.x * math.cos(obstacle.angle.x) - obstacle.position.y * math.sin(obstacle.angle.x)
    -- obstacle.position.y = obstacle.position.y * math.cos(obstacle.angle.y) + obstacle.position.x * math.sin(obstacle.angle.y)
    love.graphics.setColor(1, 1, 1)
    local result = mover:line_circle_collision(mover.segments.line1.x, mover.segments.line1.y, mover.segments.line2.x, mover.segments.line2.y, obstacle.position.x, obstacle.position.y, 20)
    if result then
        love.graphics.setColor(0, 1, 0)
        for count = 1, #result do
            local x = result[count][1]
            local y = result[count][2]
            love.graphics.circle("fill", x, y, 4)
        end
        love.graphics.setColor(1, 0, 0)
    end
    print("after: ",obstacle.position.x, obstacle.position.y, mover.position.x, mover.position.y)
    mover:draw()
    obstacle:draw()
    
    
    
    

end