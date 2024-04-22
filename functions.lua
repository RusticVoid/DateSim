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
        {0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
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
end

function loadNpcs()
    npcs[1] = npc.create(tileSize*1,tileSize*5,tileSize,tileSize, 50, 30, "sprites/TEST_charchter.png", collisionSize + 1, "Sup.", "Hello!")
    collisionSize = collisionSize + 1
    collisions[collisionSize] = collision.create(npcs[1].x-npcs[1].talkSize, npcs[1].y-npcs[1].talkSize, npcs[1].width+(npcs[1].talkSize*2),npcs[1].hight+(npcs[1].talkSize*2), false, collisionSize)
    collisionSize = collisionSize + 1
    collisions[collisionSize] = collision.create(npcs[1].midXcol, npcs[1].midYcol, npcs[1].size, npcs[1].size, true, collisionSize)
    npcs[2] = npc.create(tileSize*5,tileSize*1,tileSize,tileSize, 50, 30, "sprites/TEST_charchter_red.png", collisionSize + 1, "Hey.", "Hello!")
    collisionSize = collisionSize + 1
    collisions[collisionSize] = collision.create(npcs[2].x-npcs[2].talkSize, npcs[2].y-npcs[2].talkSize, npcs[2].width+(npcs[2].talkSize*2),npcs[2].hight+(npcs[2].talkSize*2), false, collisionSize)
    collisionSize = collisionSize + 1
    collisions[collisionSize] = collision.create(npcs[2].midXcol, npcs[2].midYcol, npcs[2].size, npcs[2].size, true, collisionSize)
end

function drawNpcs()
    npcs[1]:draw()
    npcs[2]:draw()
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
end

function interactFalse()
    interact = false
    npcs[1].playerNear = false
    npcs[2].playerNear = false
end

function NpcTalk()
    if interacted == true and npcs[1].playerNear == true then
        npcs[1].speechbubbleX = npcs[1].protraitX+5*npcs[1].protraitSize
        npcs[1].speechbubbleY = npcs[1].protraitY+230*npcs[1].protraitSize
        
        npcs[1].buttonX = npcs[1].speechbubbleX+45*npcs[1].protraitSize
        npcs[1].buttonY = npcs[1].speechbubbleY+60*npcs[1].protraitSize
        npcs[1].buttonSizeX = 35*TextSize + npcs[1].buttonMorphX
        npcs[1].buttonSizeY = 13*TextSize + npcs[1].buttonMorphY

        love.graphics.draw(npcs[1].protrait, npcs[1].protraitX, npcs[1].protraitY, 0, npcs[1].protraitSize)
        love.graphics.draw(speech_bubble, npcs[1].speechbubbleX, npcs[1].speechbubbleY, 0, speechBubbleSize)
        love.graphics.setColor(1, 0.1, 0.1)
        love.graphics.print(npcs[1].say, npcs[1].speechbubbleX+20*npcs[1].protraitSize, npcs[1].speechbubbleY+20*npcs[1].protraitSize, 0, TextSize*1.2)

        if MouseX > npcs[1].buttonX and MouseX < npcs[1].buttonX+npcs[1].buttonSizeX and MouseY > npcs[1].buttonY and MouseY < npcs[1].buttonY+npcs[1].buttonSizeY then
            love.graphics.setColor(0.7, 0.7, 1)
            love.graphics.rectangle("fill", npcs[1].buttonX, npcs[1].buttonY, npcs[1].buttonSizeX, npcs[1].buttonSizeY)
        
            if MousePressed == true then
                if npcs[1].stage == 1 then
                    npcs[1].say = "What's your name?"
                    npcs[1].buttonMorphX = 120
                    npcs[1].PlayerSay = " *Your Name*"
                    npcs[1].stage = 2
                    love.timer.sleep(0.1)
                else
                    if npcs[1].stage == 2 then
                        npcs[1].say = "Thats a cool name."
                        npcs[1].buttonMorphX = 10
                        npcs[1].PlayerSay = "Thanks"
                        npcs[1].stage = 3
                        love.timer.sleep(0.1)
                    else
                        if npcs[1].stage == 3 then
                            npcs[1].say = "Oh wait can you help me with something!"
                            npcs[1].buttonMorphX = 190
                            npcs[1].PlayerSay = "What can I help with."
                            npcs[1].stage = 4
                            love.timer.sleep(0.1)
                        else
                            if npcs[1].stage == 4 then
                                npcs[1].say = "I need 4 gold to pay my rent to Mr. Landlord."
                                npcs[1].buttonMorphX = 250
                                npcs[1].PlayerSay = "Ok I'll get you some gold."
                                npcs[1].stage = 5
                                love.timer.sleep(0.1)
                            else
                                if npcs[1].stage == 5 then
                                    npcs[1].say = "Thank you so much!"
                                    npcs[1].buttonMorphX = 80
                                    npcs[1].PlayerSay = "No problem."
                                    npcs[1].stage = 6
                                    love.timer.sleep(0.1)
                                else
                                    if npcs[1].stage == 6 then
                                        npcs[1].say = "Come back with 4 cold."
                                        if coin_amount >= 4 then
                                            npcs[1].buttonMorphX = 140
                                            npcs[1].PlayerSay = "Heres The Gold!"
                                            npcs[1].stage = 7
                                        else
                                            npcs[1].buttonMorphX = 190
                                            npcs[1].PlayerSay = "*Not Enough Gold!*"
                                            npcs[1].stage = 6
                                            update = true
                                        end
                                        love.timer.sleep(0.1)
                                    else
                                        if npcs[1].stage == 7 then
                                            npcs[1].say = "Thank you so much your so kind."
                                            npcs[1].buttonMorphX = 80
                                            npcs[1].PlayerSay = "No problem!"
                                            npcs[1].stage = 7
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
            love.graphics.rectangle("fill", npcs[1].buttonX, npcs[1].buttonY, npcs[1].buttonSizeX, npcs[1].buttonSizeY)
        end
        love.graphics.setColor(0, 0, 0)
        love.graphics.print(npcs[1].PlayerSay, npcs[1].buttonX, npcs[1].buttonY, 0, TextSize*1.1)

        if update == true then
            if coin_amount >= 4 then
                npcs[1].buttonMorphX = 140
                npcs[1].PlayerSay = "Heres The Gold!"
                npcs[1].stage = 7
                update = false
            else
                npcs[1].buttonMorphX = 190
                npcs[1].PlayerSay = "*Not Enough Gold!*"
                npcs[1].stage = 6
            end
        end
    end

    if interacted == true and npcs[2].playerNear == true then
        npcs[2].speechbubbleX = npcs[2].protraitX+5*npcs[2].protraitSize
        npcs[2].speechbubbleY = npcs[2].protraitY+230*npcs[2].protraitSize
        
        npcs[2].buttonX = npcs[2].speechbubbleX+45*npcs[2].protraitSize
        npcs[2].buttonY = npcs[2].speechbubbleY+60*npcs[2].protraitSize
        npcs[2].buttonSizeX = 50*TextSize
        npcs[2].buttonSizeY = 13*TextSize

        love.graphics.draw(npcs[2].protrait, npcs[2].protraitX, npcs[2].protraitY, 0, npcs[2].protraitSize)
        love.graphics.draw(speech_bubble, npcs[2].speechbubbleX, npcs[2].speechbubbleY, 0, speechBubbleSize)
        love.graphics.setColor(1, 0.1, 0.1)
        love.graphics.print("Hey.", npcs[2].speechbubbleX+20*npcs[2].protraitSize, npcs[2].speechbubbleY+20*npcs[2].protraitSize, 0, TextSize*1.2)

        if MouseX > npcs[2].buttonX and MouseX < npcs[2].buttonX+npcs[2].buttonSizeX and MouseY > npcs[2].buttonY and MouseY < npcs[2].buttonY+npcs[2].buttonSizeY then
            love.graphics.setColor(0.7, 0.7, 1)
            love.graphics.rectangle("fill", npcs[2].buttonX, npcs[2].buttonY, npcs[2].buttonSizeX, npcs[2].buttonSizeY)

            if MousePressed == true then
                love.timer.sleep(0.1)
            end
        else
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("fill", npcs[2].buttonX, npcs[2].buttonY, npcs[2].buttonSizeX, npcs[2].buttonSizeY)
        end
        love.graphics.setColor(0, 0, 0)
        love.graphics.print("hello", npcs[2].buttonX, npcs[2].buttonY, 0, TextSize*1.1)
    end
end