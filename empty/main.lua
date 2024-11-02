require "vector"

function love.load()
    love.window.setMode(500, 500)
    center = Vector:create(250, 250)
    
end

function love.draw()
    local x, y =  love.mouse.getPosition()
    local mouse = Vector:create(x, y)
    print(mouse)

    local diff = mouse - center
    local mag = diff:mag()
    local line_end = center+diff:norm()*50
    love.graphics.setColor(1, 0, 0)
    love.graphics.line(center.x, center.y, line_end.x, line_end.y)
    love.graphics.rectangle("fill", 0, 0, mag, 10)
end

