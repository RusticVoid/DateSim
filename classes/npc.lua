require "main"

--npc
npc = {}
npc.__index = npc

function npc.create(x, y, width, hight, size, talkSize, protrait, collisionQ, say, PlayerSay, MapTexture)
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
    instance.collisionQ = collisionQ
    instance.playerNear = false
    instance.buttonX = instance.speechbubbleX+45*instance.protraitSize
    instance.buttonY = instance.speechbubbleY+45*instance.protraitSize+20
    instance.buttonSizeX = 150
    instance.buttonSizeY = 30
    instance.say = say
    instance.PlayerSay = PlayerSay
    instance.stage = 1
    instance.buttonMorphX = 0
    instance.buttonMorphY = 0
    instance.MapTexture = MapTexture
    return instance
end

function npc:draw()
    self.midX = self.x+worldX+(tileSize/2)-(self.size/2)
    self.midY = self.y+worldY+(tileSize/2)-(self.size/2)

    if self.MapTexture == false then
        love.graphics.rectangle("fill", self.midX, self.midY, self.size,self.size)
    else
        love.graphics.draw(self.MapTexture, self.midX, self.midY, 0, tileScale)
    end
    
    if self.playerNear == true then
        if debug == true then
            print("interact")
        end

        if self.MapTexture == false then
            love.graphics.setColor(0, 1, 0)
            love.graphics.rectangle("line", self.midX, self.midY, self.size,self.size)
            love.graphics.setColor(1, 1, 1)
            love.graphics.draw(E_talk, self.midX, self.midY)
        end
    end
    love.graphics.setColor(1, 1, 1)
end