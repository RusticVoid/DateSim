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
    --playerX+PlayerW > collisions[1].x+worldX
    --playerX < collisions[1].x+worldX + collisions[1].width 
    --playerY+PlayerH > collisions[1].y+worldY
    --playerY < collisions[1].y+worldY + collisions[1].hight
    if interacted == true then

    else
        if dDown == false then
            if love.keyboard.isDown('a') then
                aDown = true
                for i = 1, collisionSize, 1 do
                    if playerX < collisions[i].x+worldX + collisions[i].width and playerY+PlayerH > collisions[i].y+worldY and playerY < collisions[i].y+worldY + collisions[i].hight then
                        if playerX+PlayerW > collisions[i].x+worldX then
                            if collisions[i].solid == false then
                                if debug == true then
                                    print("inside")
                                end
                                interact = true
                                if collisions[i].collisionID == npcs[1].collisionQ then
                                    if debug == true then
                                        print("npc 1")
                                    end
                                    npcs[1].playerNear = true
                                else
                                    if collisions[i].collisionID == npcs[2].collisionQ then
                                        if debug == true then
                                            print("npc 2")
                                        end
                                        npcs[2].playerNear = true
                                    else
                                    end
                                end
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
                            interact = false
                            npcs[1].playerNear = false
                            npcs[2].playerNear = false
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
                                if debug == true then
                                    print("inside")
                                end
                                interact = true
                                if collisions[i].collisionID == npcs[1].collisionQ then
                                    if debug == true then
                                        print("npc 1")
                                    end
                                    npcs[1].playerNear = true
                                else
                                    if collisions[i].collisionID == npcs[2].collisionQ then
                                        if debug == true then
                                            print("npc 2")
                                        end
                                        npcs[2].playerNear = true
                                    else
                                    end
                                end
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
                            interact = false
                            npcs[1].playerNear = false
                            npcs[2].playerNear = false
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
                                if debug == true then
                                    print("inside")
                                end
                                interact = true
                                if collisions[i].collisionID == npcs[1].collisionQ then
                                    if debug == true then
                                        print("npc 1")
                                    end
                                    npcs[1].playerNear = true
                                else
                                    if collisions[i].collisionID == npcs[2].collisionQ then
                                        if debug == true then
                                            print("npc 2")
                                        end
                                        npcs[2].playerNear = true
                                    else
                                    end
                                end
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
                            interact = false
                            npcs[1].playerNear = false
                            npcs[2].playerNear = false
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
                                if debug == true then
                                    print("inside")
                                end
                                interact = true
                                if collisions[i].collisionID == npcs[1].collisionQ then
                                    if debug == true then
                                        print("npc 1")
                                    end
                                    npcs[1].playerNear = true
                                else
                                    if collisions[i].collisionID == npcs[2].collisionQ then
                                        if debug == true then
                                            print("npc 2")
                                        end
                                        npcs[2].playerNear = true
                                    else
                                    end
                                end
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
                            interact = false
                            npcs[1].playerNear = false
                            npcs[2].playerNear = false
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
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
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
end

function loadNpcs()
    npcs[1] = npc.create(tileSize*1,tileSize*5,tileSize,tileSize, 50, 30, "sprites/TEST_charchter.png", collisionSize + 1, {
        "Hello, My name is Aloe Starcon.", --npc
        "Hello",                           --player
        "Hows your day.",                  --npc
        "good",                            --player
        "thats nice",                      --npc
        ""                                 --player
    })
    collisionSize = collisionSize + 1
    collisions[collisionSize] = collision.create(npcs[1].x-npcs[1].talkSize, npcs[1].y-npcs[1].talkSize, npcs[1].width+(npcs[1].talkSize*2),npcs[1].hight+(npcs[1].talkSize*2), false, collisionSize)
    collisionSize = collisionSize + 1
    collisions[collisionSize] = collision.create(npcs[1].midXcol, npcs[1].midYcol, npcs[1].size, npcs[1].size, true, collisionSize)
    npcs[2] = npc.create(tileSize*5,tileSize*1,tileSize,tileSize, 50, 30, "sprites/TEST_charchter_red.png", collisionSize + 1, {
        "Hi I'm Brett Rockton.",           --npc
        "Your ugly.",                      --player
        "Get Away From Me!",               --npc
        ""                                 --player
    })
    collisionSize = collisionSize + 1
    collisions[collisionSize] = collision.create(npcs[2].x-npcs[2].talkSize, npcs[2].y-npcs[2].talkSize, npcs[2].width+(npcs[2].talkSize*2),npcs[2].hight+(npcs[2].talkSize*2), false, collisionSize)
    collisionSize = collisionSize + 1
    collisions[collisionSize] = collision.create(npcs[2].midXcol, npcs[2].midYcol, npcs[2].size, npcs[2].size, true, collisionSize)
end

function drawNpcs()
    npcs[1]:draw()
    npcs[2]:draw()
end