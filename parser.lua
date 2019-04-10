

local Points = {}
function Points.new(a,b,c)
    local self = {}
    self.a = a
    self.b = b
    self.c = c
    return self
end

local Faces = {}
function Faces.new(a,b,c,d,e,f,g,h,i)
    local self = {}
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
    self.f = f
    self.g = g
    self.h = h
    self.i = i
end

function file_exists(file)
    local f = io.open(file,"rb")
    if f then f:close() end
    return f ~= nil
end

function lines_from(file)
    if not file_exists(file) then return {} end
    lines = {}
    for line in io.lines(file) do
        lines[#lines+1] = line
    end
    return lines
end

function get_f_lines(s)
    -- print("get_f_lines " .. s)
    all,a,b,c,d,e,f,g,h,i = string.match(s,"(f%s+(%d+)/(%d+)/(%d+)%s(%d+)/(%d+)/(%d+)%s+(%d+)/(%d+)/(%d+))")
    return tonumber(a), tonumber(b), tonumber(c), tonumber(d), tonumber(e), tonumber(f), tonumber(g), tonumber(h), tonumber(i)
end


function get_v_line(s)
    -- print("-------------")
    -- local s = "v -0.378028 -0.321668 -0.326088"
    a,b,c,d = string.match(s,"(v%s+(-?%d+[.]%d+)%s+(-?%d+[.]%d+)%s+(-?%d+[.]%d+))")
    -- print("b " ..b)
    -- print("c " ..c)
    -- print("d " ..d)
    return tonumber(b),tonumber(c),tonumber(d)
end

function get_points()
    local file = "african_head.obj"
    local lines = lines_from(file)
    local pts = {}
    local faces = {}
    for k,v in pairs(lines) do
        local res = string.find(v,"v ")
        if res ~= nil then
            -- print("\tres " .. res)
        end
        if res == 1 then
            -- print("line: " .. k .. " -> " .. v)
            local a,b,c = get_v_line(v)
            pts[#pts+1] = Points.new(a,b,c)
        end
        res = string.find(v,"f ")
        if res == 1 then
            faces[#faces+1] = Faces.new(get_f_lines(v))
        end
    end
    return pts, faces
end


function testit_v()
    -- local s = "v -0.378028 -0.321668 -0.326088"
    -- print(get_v_line(s))
    local pts,faces = get_points()
    for k,v in pairs(pts) do
        print(v.a,v.b,v.c)
    end
end


function testit_f()
    --[[
   local s = "f 24/1/24 25/2/25 26/3/26"
    all,a,b,c,d,e,f,g,h,i = string.match(s,"(f%s+(%d+)/(%d+)/(%d+)%s(%d+)/(%d+)/(%d+)%s+(%d+)/(%d+)/(%d+))")
    print(a,b,c)
    print(d,e,f)
    print(g,h,i)

    ]]
    local pts, faces = get_points()
    for k,v in pairs(faces) do
        print(v.a)
    end
end

testit_f()