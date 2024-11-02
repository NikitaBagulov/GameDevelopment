

Fly = {}

Fly.__index = Fly

function Fly:create(path, x, y, speed)
    local fly = {}
    setmetatable(fly, Fly)
    fly.path = path
    fly.x = x or 0
    fly.y = y or 0
    fly.image = love.graphics.newImage(path)
    fly.speed = speed or 1
    fly.tx = love.math.random(-2, 2)
    fly.ty = love.math.random(-2, 2)
    fly.stepx = love.math.random()/100
    fly.stepy = love.math.random()/100
    fly.noisex = Noise:create(1, 1, 256)
    fly.noisey = Noise:create(1, 1, 256)
    return fly
end

function Fly:update()
    self.tx = self.tx + self.stepx
    self.ty = self.ty + self.stepy
    local x = self.noisex:call(self.tx)
    local y = self.noisey:call(self.ty)
    self.x = remap(x, 0, 1, 50, background:getWidth() - 50)
    self.y = remap(y, 0, 1, 50, background:getHeight() - 50)
    -- local step = love.math.random()
    -- if step < 0.5 then
    --     self.x = self.x + self.speed
    -- elseif step > 0.5 and step < 0.65 then
    --     self.x = self.x - self.speed
    -- elseif step > 0.65 and step < 0.85 then
    --     self.y = self.y + self.speed
    -- else
    --     self.y = self.y - self.speed
    -- end
    -- self.x = self.x + self.speed
    -- self.y = self.y + self.speed
end

function Fly:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

HerdFlies = {}
HerdFlies.__index = HerdFlies

function HerdFlies:create(path, xmin, xmax, ymin, ymax, n, speed)
    local flies = {}
    setmetatable(flies, HerdFlies)
    flies.n = n
    flies.objs = {}
    for i=1, n do
        local x = love.math.random(xmin, xmax)
        local y = love.math.random(ymin, ymax)
        flies.objs[i] = Fly:create(path, x, y, speed)
    end
    return flies
end

function HerdFlies:draw()
    for i=1, self.n do
        self.objs[i]:draw()
    end
end    

function HerdFlies:update()
    for i=1, self.n do
        self.objs[i]:update()
    end
end

