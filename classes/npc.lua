require "main"

--npc
npc = {}
npc.__index = npc

function npc.create(x, y, width, hight)
    local instance = setmetatable({}, npc)
    instance.x = x
    instance.y = y
    instance.width = width
    instance.hight = hight
    return instance
end

function npc:draw()
    love.graphics.rectangle("fill", self.x+worldX, self.y+worldY, self.width, self.hight)
end