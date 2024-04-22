require "main"

--npc
npc = {}
npc.__index = npc

function npc.create(x, y, width, hight, size, talkSize, protrait)
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
    instance.protrait = love.graphics.newImage(protrait)
    instance.protraitSize = 1.2
    instance.protraitX = 0
    instance.protraitY = 200
    instance.speechbubbleX = instance.protraitX+5*instance.protraitSize
    instance.speechbubbleY = instance.protraitY+230*instance.protraitSize
    return instance
end

function npc:draw()
    self.midX = self.x+worldX+(tileSize/2)-(self.size/2)
    self.midY = self.y+worldY+(tileSize/2)-(self.size/2)

    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", self.midX, self.midY, self.size,self.size)

    if interact == true then
        if debug == true then
            print("interact")
        end

        love.graphics.setColor(0, 1, 0)
        love.graphics.rectangle("line", self.midX, self.midY, self.size,self.size)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(E_talk, self.midX, self.midY)
    end

    if interacted == true then
        self.speechbubbleX = self.protraitX+5*self.protraitSize
        self.speechbubbleY = self.protraitY+230*self.protraitSize
        love.graphics.draw(self.protrait, self.protraitX, self.protraitY, 0, self.protraitSize)
        love.graphics.draw(speech_bubble, self.speechbubbleX, self.speechbubbleY, 0, speechBubbleSize)
    end
    
    love.graphics.setColor(1, 1, 1)
end