require "main"

--npc
npc = {}
npc.__index = npc

function npc.create(x, y, width, hight, size, talkSize, protrait, collisionQ, say, PlayerSay, DrawWorldBox)
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
    instance.DrawWorldBox = DrawWorldBox
    return instance
end

function npc:draw()
    self.midX = self.x+worldX+(tileSize/2)-(self.size/2)
    self.midY = self.y+worldY+(tileSize/2)-(self.size/2)

    love.graphics.setColor(1, 1, 1)
    if self.DrawWorldBox == true then
        love.graphics.rectangle("fill", self.midX, self.midY, self.size,self.size)
    end

    if self.playerNear == true then
        if debug == true then
            print("interact")
        end

        if self.DrawWorldBox == true then
            love.graphics.setColor(0, 1, 0)
            love.graphics.rectangle("line", self.midX, self.midY, self.size,self.size)
            love.graphics.setColor(1, 1, 1)
            love.graphics.draw(E_talk, self.midX, self.midY)
        end
    end

    --if interacted == true and self.playerNear == true then
    --    self.speechbubbleX = self.protraitX+5*self.protraitSize
    --    self.speechbubbleY = self.protraitY+230*self.protraitSize
    --
    --    love.graphics.draw(self.protrait, self.protraitX, self.protraitY, 0, self.protraitSize)
    --
    --    love.graphics.draw(speech_bubble, self.speechbubbleX, self.speechbubbleY, 0, speechBubbleSize)
    --    love.graphics.setColor(0, 0, 0)
    --    love.graphics.print(self.text[self.currentText], self.speechbubbleX+20*self.protraitSize, self.speechbubbleY+20*self.protraitSize, 0, TextSize)
    --    
    --    if MouseX > self.speechbubbleX+45*self.protraitSize and MouseX < self.speechbubbleX+45*self.protraitSize+150 and MouseY > self.speechbubbleY+45*self.protraitSize and MouseY < self.speechbubbleY+45*self.protraitSize+50 then
    --        if self.playerText[self.currentPlayerText] == "" then
    --        else
    --            love.graphics.setColor(0.7, 0.7, 1)
    --            love.graphics.rectangle("fill", self.speechbubbleX+45*self.protraitSize, self.speechbubbleY+45*self.protraitSize, 150, 50)
    --        end
    --        
    --        if MousePressed == true then
    --            if self.currentText+1 < #self.text then
    --                self.currentText = self.currentText + 2
    --            end
    --            if self.currentPlayerText+1 < #self.text then
    --                self.currentPlayerText = self.currentPlayerText + 2
    --            end
    --            love.timer.sleep(0.1)
    --        end
    --    else
    --        if self.playerText[self.currentPlayerText] == "" then
    --        else
    --            love.graphics.setColor(1, 1, 1)
    --            love.graphics.rectangle("fill", self.speechbubbleX+45*self.protraitSize, self.speechbubbleY+45*self.protraitSize, 150, 50)
    --        end
    --    end
    --    love.graphics.setColor(0, 0, 0)
    --    love.graphics.print(self.playerText[self.currentPlayerText], self.speechbubbleX+45*self.protraitSize, self.speechbubbleY+45*self.protraitSize, 0, TextSize)
    --end
    
    love.graphics.setColor(1, 1, 1)
end