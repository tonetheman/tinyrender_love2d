

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

local file = "african_head.obj"
local lines = lines_from(file)
for k,v in pairs(lines) do
    local res = string.find(v,"v ")
    if res ~= nil then
        print("\tres " .. res)
    end
    if res == 1 then
        print("line: " .. k .. " -> " .. v)
    end
end

print("-------------")
local s = "v -0.378028 -0.321668 -0.326088"
a,b,c,d = string.match(s,"(v%s+(-?%d+[.]%d+)%s+(-?%d+[.]%d+)%s+(-?%d+[.]%d+))")
print("b " ..b)
print("c " ..c)
print("d " ..d)