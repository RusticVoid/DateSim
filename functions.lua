require("main")

function file_exist(name)
    local f = io.open(name, "r")
    if f~=nil then 
        io.close(f) 
        return true 
    else
        return false
    end
end

function KeyInput()
    if interacted == true then

    else
        if dDown == false then
            if love.keyboard.isDown('a') then
                aDown = true
                for i = 1, collisionSize, 1 do
                    if playerX < collisions[i].x+worldX + collisions[i].width and playerY+PlayerH > collisions[i].y+worldY and playerY < collisions[i].y+worldY + collisions[i].hight then
                        if playerX+PlayerW > collisions[i].x+worldX then
                            if collisions[i].solid == false then
                                interactFunc(i)
                            else
                                worldX = worldX - playerSpeed
                                if debug == true then
                                    print('left')
                                end
                            end
                        else
                            if aDown == true then
                                worldX = worldX + playerSpeed
                                aDown = false
                            end
                        end
                    else
                        if aDown == true then
                            worldX = worldX + playerSpeed
                            aDown = false
                            interactFalse()
                        end
                    end
                end
            else
                if aDown == true then
                    worldX = worldX - playerSpeed
                    aDown = false
                end
            end
        end

        if aDown == false then
            if love.keyboard.isDown('d') then
                dDown = true
                for i = 1, collisionSize, 1 do
                    if playerX+PlayerW > collisions[i].x+worldX and playerY+PlayerH > collisions[i].y+worldY and playerY < collisions[i].y+worldY + collisions[i].hight then
                        if playerX < collisions[i].x+worldX + collisions[i].width then
                            if collisions[i].solid == false then
                                interactFunc(i)
                            else
                                worldX = worldX + playerSpeed
                                if debug == true then
                                    print('right')
                                end
                            end
                        else
                            if dDown == true then
                                worldX = worldX - playerSpeed
                                dDown = false
                            end
                        end
                    else
                        if dDown == true then
                            worldX = worldX - playerSpeed
                            dDown = false
                            interactFalse()
                        end
                    end
                end
            else
                if dDown == true then
                    worldX = worldX + playerSpeed
                    dDown = false
                end
            end
        end

        if sDown == false then
            if love.keyboard.isDown('w') then
                wDown = true
                for i = 1, collisionSize, 1 do
                    if playerX+PlayerW > collisions[i].x+worldX and playerY < collisions[i].y+worldY + collisions[i].hight and playerX < collisions[i].x+worldX + collisions[i].width then
                        if playerY+PlayerH > collisions[i].y+worldY then
                            if collisions[i].solid == false then
                                interactFunc(i)
                            else
                                worldY = worldY - playerSpeed
                                if debug == true then
                                    print('up')
                                end
                            end
                        else
                            if wDown == true then
                                worldY = worldY + playerSpeed
                                wDown = false
                            end
                        end
                    else
                        if wDown == true then
                            worldY = worldY + playerSpeed
                            wDown = false
                            interactFalse()
                        end
                    end
                end
            else
                if wDown == true then
                    worldY = worldY - playerSpeed
                    wDown = false
                end
            end
        end
    
        if wDown == false then
            if love.keyboard.isDown('s') then
                sDown = true
                for i = 1, collisionSize, 1 do
                    if playerX+PlayerW > collisions[i].x+worldX and playerY+PlayerH > collisions[i].y+worldY and playerX < collisions[i].x+worldX + collisions[i].width then
                        if playerY < collisions[i].y+worldY + collisions[i].hight then
                            if collisions[i].solid == false then
                                interactFunc(i)
                            else
                                worldY = worldY + playerSpeed
                                if debug == true then
                                    print('down')
                                end
                            end
                        else
                            if sDown == true then
                                worldY = worldY - playerSpeed
                                sDown = false
                            end
                        end
                    else
                        if sDown == true then
                            worldY = worldY - playerSpeed
                            sDown = false
                            interactFalse()
                        end
                    end
                end
            else
                if sDown == true then
                    worldY = worldY + playerSpeed
                    sDown = false
                end
            end
        end
    end
    
    if love.keyboard.isDown('q') then
        coin_amount = coin_amount + 1
    end
end

function loadMap()

    map = {
        {2,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
        {2,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
        {2,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
        {2,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
        {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
    }
    map2 = {
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,1,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,2,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
    }
    mapSize = #map*#map[1]
    mapY = #map
    mapX = mapSize/mapY
    tileScale = 4
    tileSize = 32*tileScale

    collisionSize = 0

    for y = 1, mapY, 1 do
        for x = 1, mapX, 1 do
            if map[y][x] == 1 then
                collisionSize = collisionSize + 1
                collisions[collisionSize] = collision.create((x*tileSize)-tileSize, (y*tileSize)-tileSize, tileSize,tileSize, true, collisionSize)
            else 
                if map[y][x] == 0 then
                    
                else
                    if map[y][x] == 2 then
                        collisionSize = collisionSize + 1
                        collisions[collisionSize] = collision.create((x*tileSize)-tileSize, (y*tileSize)-tileSize, tileSize,tileSize, true, collisionSize)
                    end
                end
            end
        end
    end
    for y = 1, mapY, 1 do
        for x = 1, mapX, 1 do
            if map2[y][x] == 0 then
            else 
                if map2[y][x] == 1 then
                    collisionSize = collisionSize + 1
                    collisions[collisionSize] = collision.create((x*tileSize)-tileSize, (y*tileSize)-tileSize, tileSize,tileSize, true, collisionSize)
                else  
                    if map2[y][x] == 2 then
                        collisionSize = collisionSize + 1
                        collisions[collisionSize] = collision.create((x*tileSize)-tileSize, (y*tileSize)-tileSize, tileSize,tileSize, true, collisionSize)
                    else
                        if map2[y][x] == 3 then
                            collisionSize = collisionSize + 1
                            collisions[collisionSize] = collision.create((x*tileSize)-tileSize, (y*tileSize)-tileSize+44, tileSize,tileSize, true, collisionSize)
                        else
                            if map2[y][x] == 4 then
                                collisionSize = collisionSize + 1
                                collisions[collisionSize] = collision.create((x*tileSize)-tileSize, (y*tileSize)-tileSize, tileSize,tileSize, false, collisionSize)
                            end
                        end    
                    end
                end
            end
        end
    end
end

function drawMap()
    for y = 1, mapY, 1 do
        for x = 1, mapX, 1 do
            if map[y][x] == 1 then
                love.graphics.setColor(1, 1, 1)
                love.graphics.draw(wall, worldX+(x*tileSize)-tileSize, worldY+(y*tileSize)-tileSize, 0, tileScale,tileScale)
            else 
                if map[y][x] == 0 then
                love.graphics.setColor(1, 1, 1)
                love.graphics.draw(floor, worldX+(x*tileSize)-tileSize, worldY+(y*tileSize)-tileSize, 0, tileScale,tileScale)
                else
                    if map[y][x] == 2 then
                    love.graphics.setColor(1, 1, 1)
                    love.graphics.draw(wallTop, worldX+(x*tileSize)-tileSize, worldY+(y*tileSize)-tileSize, 0, tileScale,tileScale)
                    end
                end
            end
        end
    end
end

function drawMap2()
    for y = 1, mapY, 1 do
        for x = 1, mapX, 1 do
            if map2[y][x] == 0 then
            else 
                if map2[y][x] == 1 then
                    love.graphics.setColor(1, 1, 1)
                    love.graphics.draw(FloorBed_top, worldX+(x*tileSize)-tileSize, worldY+(y*tileSize)-tileSize, 0, tileScale,tileScale)
                else
                    if map2[y][x] == 2 then
                        love.graphics.setColor(1, 1, 1)
                        love.graphics.draw(FloorBed_bottom, worldX+(x*tileSize)-tileSize, worldY+(y*tileSize)-tileSize, 0, tileScale,tileScale)
                    else
                        if map2[y][x] == 3 then
                            love.graphics.setColor(1, 1, 1)
                            love.graphics.draw(wooden_box, worldX+(x*tileSize)-tileSize, worldY+(y*tileSize)-tileSize, 0, tileScale,tileScale)
                        else
                            if map2[y][x] == 4 then
                                love.graphics.setColor(1, 1, 1)
                                love.graphics.draw(coin_UI, worldX+(x*tileSize)-tileSize, worldY+(y*tileSize)-tileSize, 0, tileScale*4,tileScale*4)
                            else
                                if map2[y][x] == 5 then
                                    love.graphics.setColor(1, 1, 1)
                                    love.graphics.draw(map_MrLandLord, worldX+(x*tileSize)-tileSize, worldY+(y*tileSize)-tileSize, 0, tileScale,tileScale)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function LoadTexture()
    love.graphics.setDefaultFilter("nearest", "nearest")
    floor = love.graphics.newImage("sprites/floor.png")
    wall = love.graphics.newImage("sprites/wall.png")
    wallTop = love.graphics.newImage("sprites/wallTop.png")
    E_talk = love.graphics.newImage("sprites/E-talk.png")
    speech_bubble = love.graphics.newImage("sprites/speech_bubble.png")
    FloorBed_bottom = love.graphics.newImage("sprites/FloorBed_bottom.png")
    FloorBed_top = love.graphics.newImage("sprites/FloorBed_top.png")
    wooden_box = love.graphics.newImage("sprites/wooden_box.png")
    coin_UI = love.graphics.newImage("sprites/coin.png")
    map_MrLandLord = love.graphics.newImage("sprites/MrLandlord.png")
end

function loadNpcs()
    npcs[1] = npc.create(tileSize*1,tileSize*5,tileSize,tileSize, tileSize-80, 30, "sprites/TEST_charchter.png", collisionSize + 1, "Sup.", "Hello!", true)
    collisionSize = collisionSize + 1
    collisions[collisionSize] = collision.create(npcs[1].x-npcs[1].talkSize, npcs[1].y-npcs[1].talkSize, npcs[1].width+(npcs[1].talkSize*2),npcs[1].hight+(npcs[1].talkSize*2), false, collisionSize)
    collisionSize = collisionSize + 1
    collisions[collisionSize] = collision.create(npcs[1].midXcol, npcs[1].midYcol, npcs[1].size, npcs[1].size, true, collisionSize)

    npcs[2] = npc.create(tileSize*5,tileSize*1,tileSize,tileSize, tileSize-80, 30, "sprites/TEST_charchter_red.png", collisionSize + 1, "Hey.", "Hello!", true)
    collisionSize = collisionSize + 1
    collisions[collisionSize] = collision.create(npcs[2].x-npcs[2].talkSize, npcs[2].y-npcs[2].talkSize, npcs[2].width+(npcs[2].talkSize*2),npcs[2].hight+(npcs[2].talkSize*2), false, collisionSize)
    collisionSize = collisionSize + 1
    collisions[collisionSize] = collision.create(npcs[2].midXcol, npcs[2].midYcol, npcs[2].size, npcs[2].size, true, collisionSize)

    npcs[3] = npc.create(tileSize*3,tileSize*1,tileSize,tileSize, tileSize, 30, "sprites/MrLandlord.png", collisionSize + 1, "Hello Im Mr. Landlord.", "Hello!", false)
    collisionSize = collisionSize + 1
    collisions[collisionSize] = collision.create(npcs[3].x-npcs[3].talkSize, npcs[3].y-npcs[3].talkSize, npcs[3].width+(npcs[3].talkSize*2),npcs[3].hight+(npcs[3].talkSize*2), false, collisionSize)
    collisionSize = collisionSize + 1
    collisions[collisionSize] = collision.create(npcs[3].midXcol, npcs[3].midYcol, npcs[3].size, npcs[3].size, true, collisionSize)
end

function drawNpcs()
    for i = 1, #npcs, 1 do
        npcs[i]:draw()
    end
end

function Ui()
    love.graphics.draw(coin_UI, 0, 0, 0, 10)
    love.graphics.print(":"..coin_amount, 80, -5, 0, 6)
end

function interactFunc(i)
    if debug == true then
        print("inside")
    end

    if collisions[i].collisionID == npcs[1].collisionQ then
        if debug == true then
            print("npc 1")
        end
        npcs[1].playerNear = true
        interact = true
    end

    if collisions[i].collisionID == npcs[2].collisionQ then
        if debug == true then
            print("npc 2")
        end
        npcs[2].playerNear = true
        interact = true
    end

    if collisions[i].collisionID == npcs[3].collisionQ then
        if debug == true then
            print("npc 3")
        end
        npcs[3].playerNear = true
        interact = true
    end
end

function interactFalse()
    interact = false
    for i = 1, #npcs, 1 do
        npcs[i].playerNear = false
    end
end

function NpcTalk()
    if interacted == true and npcs[1].playerNear == true then
        currentNpc = 1
        npcs[currentNpc].speechbubbleX = npcs[currentNpc].protraitX+5*npcs[currentNpc].protraitSize
        npcs[currentNpc].speechbubbleY = npcs[currentNpc].protraitY+230*npcs[currentNpc].protraitSize
        
        npcs[currentNpc].buttonX = npcs[currentNpc].speechbubbleX+45*npcs[currentNpc].protraitSize
        npcs[currentNpc].buttonY = npcs[currentNpc].speechbubbleY+60*npcs[currentNpc].protraitSize
        npcs[currentNpc].buttonSizeX = 35*TextSize + npcs[currentNpc].buttonMorphX
        npcs[currentNpc].buttonSizeY = 13*TextSize + npcs[currentNpc].buttonMorphY

        love.graphics.draw(npcs[currentNpc].protrait, npcs[currentNpc].protraitX, npcs[currentNpc].protraitY, 0, npcs[currentNpc].protraitSize)
        love.graphics.draw(speech_bubble, npcs[currentNpc].speechbubbleX, npcs[currentNpc].speechbubbleY, 0, speechBubbleSize)
        love.graphics.setColor(1, 0.1, 0.1)
        love.graphics.print(npcs[currentNpc].say, npcs[currentNpc].speechbubbleX+20*npcs[currentNpc].protraitSize, npcs[currentNpc].speechbubbleY+20*npcs[currentNpc].protraitSize, 0, TextSize*1.2)

        if MouseX > npcs[currentNpc].buttonX and MouseX < npcs[currentNpc].buttonX+npcs[currentNpc].buttonSizeX and MouseY > npcs[currentNpc].buttonY and MouseY < npcs[currentNpc].buttonY+npcs[currentNpc].buttonSizeY then
            love.graphics.setColor(0.7, 0.7, 1)
            love.graphics.rectangle("fill", npcs[currentNpc].buttonX, npcs[currentNpc].buttonY, npcs[currentNpc].buttonSizeX, npcs[currentNpc].buttonSizeY)
        
            if MousePressed == true then
                if npcs[currentNpc].stage == 1 then
                    npcs[currentNpc].say = "What's your name?"
                    npcs[currentNpc].buttonMorphX = 120
                    npcs[currentNpc].PlayerSay = " *Your Name*"
                    npcs[currentNpc].stage = 2
                    love.timer.sleep(0.1)
                else
                    if npcs[currentNpc].stage == 2 then
                        npcs[currentNpc].say = "Thats a cool name."
                        npcs[currentNpc].buttonMorphX = 10
                        npcs[currentNpc].PlayerSay = "Thanks"
                        npcs[currentNpc].stage = 3
                        love.timer.sleep(0.1)
                    else
                        if npcs[currentNpc].stage == 3 then
                            npcs[currentNpc].say = "Oh wait can you help me with something!"
                            npcs[currentNpc].buttonMorphX = 190
                            npcs[currentNpc].PlayerSay = "What can I help with."
                            npcs[currentNpc].stage = 4
                            love.timer.sleep(0.1)
                        else
                            if npcs[currentNpc].stage == 4 then
                                npcs[currentNpc].say = "I need 4 gold to pay my rent to Mr. Landlord."
                                npcs[currentNpc].buttonMorphX = 250
                                npcs[currentNpc].PlayerSay = "Ok I'll get you some gold."
                                npcs[currentNpc].stage = 5
                                love.timer.sleep(0.1)
                            else
                                if npcs[currentNpc].stage == 5 then
                                    npcs[currentNpc].say = "Thank you so much!"
                                    npcs[currentNpc].buttonMorphX = 80
                                    npcs[currentNpc].PlayerSay = "No problem."
                                    npcs[currentNpc].stage = 6
                                    love.timer.sleep(0.1)
                                else
                                    if npcs[currentNpc].stage == 6 then
                                        npcs[currentNpc].say = "Come back with 4 cold."
                                        if coin_amount >= 4 then
                                            npcs[currentNpc].buttonMorphX = 140
                                            npcs[currentNpc].PlayerSay = "Heres The Gold!"
                                            npcs[currentNpc].stage = 7
                                        else
                                            npcs[currentNpc].buttonMorphX = 190
                                            npcs[currentNpc].PlayerSay = "*Not Enough Gold!*"
                                            npcs[currentNpc].stage = 6
                                            update = true
                                        end
                                        love.timer.sleep(0.1)
                                    else
                                        if npcs[currentNpc].stage == 7 then
                                            npcs[currentNpc].say = "Thank you so much your so kind."
                                            npcs[currentNpc].buttonMorphX = 80
                                            npcs[currentNpc].PlayerSay = "No problem!"
                                            npcs[currentNpc].stage = 7
                                            love.timer.sleep(0.1)
                                        else
                                        end
                                    end
                                end
                            end
                        end
                    end 
                end
            end
        else
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("fill", npcs[currentNpc].buttonX, npcs[currentNpc].buttonY, npcs[currentNpc].buttonSizeX, npcs[currentNpc].buttonSizeY)
        end
        love.graphics.setColor(0, 0, 0)
        love.graphics.print(npcs[currentNpc].PlayerSay, npcs[currentNpc].buttonX, npcs[currentNpc].buttonY, 0, TextSize*1.1)

        if update == true then
            if coin_amount >= 4 then
                npcs[currentNpc].buttonMorphX = 140
                npcs[currentNpc].PlayerSay = "Heres The Gold!"
                npcs[currentNpc].stage = 7
                update = false
            else
                npcs[currentNpc].buttonMorphX = 190
                npcs[currentNpc].PlayerSay = "*Not Enough Gold!*"
                npcs[currentNpc].stage = 6
            end
        end
    end

    if interacted == true and npcs[2].playerNear == true then
        currentNpc = 2
        npcs[currentNpc].speechbubbleX = npcs[currentNpc].protraitX+5*npcs[currentNpc].protraitSize
        npcs[currentNpc].speechbubbleY = npcs[currentNpc].protraitY+230*npcs[currentNpc].protraitSize
        
        npcs[currentNpc].buttonX = npcs[currentNpc].speechbubbleX+45*npcs[currentNpc].protraitSize
        npcs[currentNpc].buttonY = npcs[currentNpc].speechbubbleY+60*npcs[currentNpc].protraitSize
        npcs[currentNpc].buttonSizeX = 50*TextSize
        npcs[currentNpc].buttonSizeY = 13*TextSize

        love.graphics.draw(npcs[currentNpc].protrait, npcs[currentNpc].protraitX, npcs[currentNpc].protraitY, 0, npcs[currentNpc].protraitSize)
        love.graphics.draw(speech_bubble, npcs[currentNpc].speechbubbleX, npcs[currentNpc].speechbubbleY, 0, speechBubbleSize)
        love.graphics.setColor(1, 0.1, 0.1)
        love.graphics.print("Hey.", npcs[currentNpc].speechbubbleX+20*npcs[currentNpc].protraitSize, npcs[currentNpc].speechbubbleY+20*npcs[currentNpc].protraitSize, 0, TextSize*1.2)

        if MouseX > npcs[currentNpc].buttonX and MouseX < npcs[currentNpc].buttonX+npcs[currentNpc].buttonSizeX and MouseY > npcs[currentNpc].buttonY and MouseY < npcs[currentNpc].buttonY+npcs[currentNpc].buttonSizeY then
            love.graphics.setColor(0.7, 0.7, 1)
            love.graphics.rectangle("fill", npcs[currentNpc].buttonX, npcs[currentNpc].buttonY, npcs[currentNpc].buttonSizeX, npcs[currentNpc].buttonSizeY)

            if MousePressed == true then
                love.timer.sleep(0.1)
            end
        else
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("fill", npcs[currentNpc].buttonX, npcs[currentNpc].buttonY, npcs[currentNpc].buttonSizeX, npcs[currentNpc].buttonSizeY)
        end
        love.graphics.setColor(0, 0, 0)
        love.graphics.print("hello", npcs[currentNpc].buttonX, npcs[currentNpc].buttonY, 0, TextSize*1.1)
    end

    if interacted == true and npcs[3].playerNear == true then
        currentNpc = 3
        npcs[currentNpc].speechbubbleX = npcs[currentNpc].protraitX+5*npcs[currentNpc].protraitSize
        npcs[currentNpc].speechbubbleY = npcs[currentNpc].protraitY+230*npcs[currentNpc].protraitSize
        
        npcs[currentNpc].buttonX = npcs[currentNpc].speechbubbleX+45*npcs[currentNpc].protraitSize
        npcs[currentNpc].buttonY = npcs[currentNpc].speechbubbleY+60*npcs[currentNpc].protraitSize
        npcs[currentNpc].buttonSizeX = 35*TextSize + npcs[currentNpc].buttonMorphX
        npcs[currentNpc].buttonSizeY = 13*TextSize + npcs[currentNpc].buttonMorphY

        love.graphics.draw(npcs[currentNpc].protrait, npcs[currentNpc].protraitX, npcs[currentNpc].protraitY-20, 0, npcs[currentNpc].protraitSize*10)
        love.graphics.draw(speech_bubble, npcs[currentNpc].speechbubbleX, npcs[currentNpc].speechbubbleY, 0, speechBubbleSize)
        love.graphics.setColor(1, 0.1, 0.1)
        love.graphics.print(npcs[currentNpc].say, npcs[currentNpc].speechbubbleX+20*npcs[currentNpc].protraitSize, npcs[currentNpc].speechbubbleY+20*npcs[currentNpc].protraitSize, 0, TextSize*1.2)

        if MouseX > npcs[currentNpc].buttonX and MouseX < npcs[currentNpc].buttonX+npcs[currentNpc].buttonSizeX and MouseY > npcs[currentNpc].buttonY and MouseY < npcs[currentNpc].buttonY+npcs[currentNpc].buttonSizeY then
            love.graphics.setColor(0.7, 0.7, 1)
            love.graphics.rectangle("fill", npcs[currentNpc].buttonX, npcs[currentNpc].buttonY, npcs[currentNpc].buttonSizeX, npcs[currentNpc].buttonSizeY)
        
            if MousePressed == true then
                if npcs[currentNpc].stage == 1 then
                    npcs[currentNpc].say = "What's your name?"
                    npcs[currentNpc].buttonMorphX = 120
                    npcs[currentNpc].PlayerSay = " *Your Name*"
                    npcs[currentNpc].stage = 2
                    love.timer.sleep(0.1)
                else
                    if npcs[currentNpc].stage == 2 then
                        npcs[currentNpc].say = "Thats a cool name."
                        npcs[currentNpc].buttonMorphX = 10
                        npcs[currentNpc].PlayerSay = "Thanks"
                        npcs[currentNpc].stage = 3
                        love.timer.sleep(0.1)
                    else
                        
                    end 
                end
            end
        else
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("fill", npcs[currentNpc].buttonX, npcs[currentNpc].buttonY, npcs[currentNpc].buttonSizeX, npcs[currentNpc].buttonSizeY)
        end
        love.graphics.setColor(0, 0, 0)
        love.graphics.print(npcs[currentNpc].PlayerSay, npcs[currentNpc].buttonX, npcs[currentNpc].buttonY, 0, TextSize*1.1)
    end
end