require "vector"
require "pendulum"

function love.load()
    p = Pendulum:create(Vector:create(200, 50), 100)
end

function love.draw()
    p:draw()
end

function love.mousepressed(x, y, button, presses)
    if button == 1 then
        p:clicked(x, y)
    end
end

function love.mousereleased(x, y, button, presses)
    if button == 1 then
        p:unclicked()
    end
end

