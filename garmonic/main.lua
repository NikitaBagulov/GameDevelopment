require "wave"

function love.load()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()

    wave = Wave:create(width/7, width-width/3, height/2, 100, 0.002, 5, 5)
    wave1 = Wave:create(width/3, width, height/3, 20, 0.002, 5, 20)
end

function love.draw()
    wave:draw()
    wave1:draw()
end

-- function love.load()
--     width = love.graphics.getWidth()
--     height = love.graphics.getHeight()
--     amplitude = 20
--     vel = 0.001
--     angle = 1
-- end

-- function love.draw()
--     for x = 0, width, 5 do
--         y = amplitude * math.cos((angle + x/24/20) * 5)
--         y = y+ amplitude * math.sin((angle + x/24/10) * 10)
--         love.graphics.setColor(1, 0, 1)
--         love.graphics.circle("line", x, y + height/2, 10)
--         love.graphics.setColor(181/255, 220/255, 151/255)
--         love.graphics.circle("fill", x, y + height/2, 10)
--     end

--     angle = angle + vel
-- end