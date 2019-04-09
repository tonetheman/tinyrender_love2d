function love.load()
end

function love.update(dt)
end

--[[
    taken from here: https://github.com/ssloy/tinyrenderer/wiki/Lesson-1:-Bresenham%E2%80%99s-Line-Drawing-Algorithm
]]
function tinyline(x0,y0,x1,y1)
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
            love.graphics.point(y,x)
        else
            love.graphics.point(x,y)
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
    tinyline(100,100,200,200)
end
