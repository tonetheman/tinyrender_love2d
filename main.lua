
local Color = {}
function Color.new(r,g,b)
    local self = {}
    self.r = r
    self.g = g
    self.b = b
    return self
end
local RED = Color.new(255,0,0)
local GREEN = Color.new(0,255,0)
local BLUE = Color.new(0,0,255)

function readFileFromDisk()
	for line in love.filesystem.lines("african_head.obj") do
		print(line)
	end
end

function love.load()
	readFileFromDisk()
end

function love.update(dt)
end

--[[
    taken from here: https://github.com/ssloy/tinyrenderer/wiki/Lesson-1:-Bresenham%E2%80%99s-Line-Drawing-Algorithm
]]
function tinyline(x0,y0,x1,y1,color)
    love.graphics.setColor(color.r,color.g,color.b)
    local steep = false
    if math.abs(x0-x1)<math.abs(y0-y1) then
        local tmp = x0
        x0 = x1
        x1 = tmp
    end
    if x0>x1 then
        local tmp = x0
        x0 = x1
        x1 = tmp
    end
    local dx = x1-x0
    local dy = y1-y0
    local derror2 = math.abs(dy)*2
    local error2 = 0
    local y = y0
    for x=x0,x1 do
        if steep  then
            love.graphics.points(y,x)
        else
            love.graphics.points(x,y)
        end
    end
    error2 = error2 + derror2
    if error2 > dx then
        local tmp = 0
        if y1>y0 then
            tmp = 1
        else
            tmp = -1
        end
        y = y + tmp
        error2 = error2 - (dx*2)
    end 
end

function love.draw()
    tinyline(100,100,200,200,RED)
    tinyline(100,132,200,132,BLUE)
    tinyline(100,164,200,164,GREEN)
end
