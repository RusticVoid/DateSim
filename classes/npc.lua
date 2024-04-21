require "main"

--npc
npc = {}
npc.__index = npc

function npc.create(x, y, width, hight, size, talkSize)
    local instance = setmetatable({}, npc)
    instance.x = x
    instance.y = y
    instance.width = width
    instance.hight = hight
    instance.size = size
    instance.talkSize = talkSize
    instance.midX = instance.x+worldX+(tileSize/2)-(instance.size/2)
    instance.midY = instance.y+worldY+(tileSize/2)-(instance.size/2)
    instance.midXcol = instance.x+(tileSize/2)-(instance.size/2)
    instance.midYcol = instance.y+(tileSize/2)-(instance.size/2)
    return instance
end

function npc:draw()
    self.midX = self.x+worldX+(tileSize/2)-(self.size/2)
    self.midY = self.y+worldY+(tileSize/2)-(self.size/2)
    love.graphics.setColor(1, 0, 0)
    --love.graphics.rectangle("line", self.x+worldX-self.talkSize, self.y+worldY-self.talkSize, self.width+(self.talkSize*2), self.hight+(self.talkSize*2))
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", self.midX, self.midY, self.size,self.size)
    love.graphics.setColor(1, 1, 1)
end