Wave = {}
Wave.__index = Wave

function Wave:create(x1, x2, y, amplitude, vel, angle, step, delta)
    local wave = {}
    setmetatable(wave, Wave)
    wave.x1 = x1
    wave.x2 = x2
    wave.y = y
    wave.amplitude = amplitude or 20
    wave.vel = vel or 0.001
    wave.angle = angle or 0
    wave.step = step or 5
    return wave
end

function Wave:draw()
    for x = self.x1, self.x2, self.step do
        y = self.amplitude * math.cos((self.angle + x/24/20) * 5)
        y = y+ self.amplitude * math.sin((self.angle + x/24/10) * 10)
        love.graphics.setColor(1, 0, 1)
        love.graphics.circle("line", x, y + self.y, 10)
        love.graphics.setColor(x/self.x2, (y+self.amplitude)/(self.amplitude*2), (y+self.amplitude)/(self.amplitude*2))
        love.graphics.circle("fill", x, y + self.y, 10)
    end

    self.angle = self.angle + self.vel
end