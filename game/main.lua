require "fly"
require "perlin"

function love.load()
    background = love.graphics.newImage("resources/background.png")
    love.window.setMode(background:getWidth(), background:getHeight())
    love.graphics.setBackgroundColor(37/255, 226/255, 247/255)

    -- fly = Fly:create("resources/mosquito_small.png",100,100, 1)
    

    flies = HerdFlies:create("resources/mosquito_small.png", 0, background:getWidth(), 0, background:getHeight(), 5)

end

function love.update(dt)
    -- fly:update()
    flies:update()
end 

function love.draw()
    love.graphics.draw(background, 0, 0)
    -- fly:draw()
    flies:draw()
    love.graphics.print("Current FPS: " .. tostring(love.timer.getFPS()), 10, 10)
end