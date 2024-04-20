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

    if dDown == false then
        if love.keyboard.isDown('a') then
            aDown = true
            for i = 1, collisionSize, 1 do
                if playerX < collisions[i].x+worldX + collisions[i].width and playerY+PlayerH > collisions[i].y+worldY and playerY < collisions[i].y+worldY + collisions[i].hight then
                    if playerX+PlayerW > collisions[i].x+worldX then
                        worldX = worldX - 1
                        print('left')
                    else
                        if aDown == true then
                            worldX = worldX + 1
                            aDown = false
                        end
                    end
                else
                    if aDown == true then
                        worldX = worldX + 1
                        aDown = false
                    end
                end
            end
        else
            if aDown == true then
                worldX = worldX - 1
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
                        worldX = worldX + 1
                        print('right')
                    else
                        if dDown == true then
                            worldX = worldX - 1
                            dDown = false
                        end
                    end
                else
                    if dDown == true then
                        worldX = worldX - 1
                        dDown = false
                    end
                end
            end
        else
            if dDown == true then
                worldX = worldX + 1
                dDown = false
            end
        end
    end

    if sDown == false then
        if love.keyboard.isDown('w') then
            wDown = true
            for i = 1, collisionSize, 1 do
                if playerX+PlayerW > collisions[i].x+worldX and playerY < collisions[i].y+worldY + collisions[i].hight and playerX < collisions[i].x+worldX + collisions[i].width  then
                    if playerY+PlayerH > collisions[i].y+worldY then
                        worldY = worldY - 1
                        print('up')
                    else
                        if wDown == true then
                            worldY = worldY + 1
                            wDown = false
                        end
                    end
                else
                    if wDown == true then
                        worldY = worldY + 1
                        wDown = false
                    end
                end
            end
        else
            if wDown == true then
                worldY = worldY - 1
                wDown = false
            end
        end
    end
    
    if wDown == false then
        if love.keyboard.isDown('s') then
            sDown = true
            for i = 1, collisionSize, 1 do
                if playerX+PlayerW > collisions[i].x+worldX and playerY+PlayerH > collisions[i].y+worldY and playerX < collisions[i].x+worldX + collisions[i].width  then
                    if playerY < collisions[i].y+worldY + collisions[i].hight then
                        worldY = worldY + 1
                        print('down')
                    else
                        if sDown == true then
                            worldY = worldY - 1
                            sDown = false
                        end
                    end
                else
                    if sDown == true then
                        worldY = worldY - 1
                        sDown = false
                    end
                end
            end
        else
            if sDown == true then
                worldY = worldY + 1
                sDown = false
            end
        end
    end
    --end
    
    if love.keyboard.isDown('f11') then
        fullscreen = not fullscreen
        if fullscreen == true then
            love.window.setMode( 0, 0, {fullscreen=true, vsync=0} )
        else    
            love.window.setMode( 800, 600, {resizable=true, vsync=0, minwidth=400, minheight=300} )
        end
    end
    if love.keyboard.isDown('f1') then
        debug = not debug
    end
end

function loadMap()

    map = {
        {2,1,1,1,2,1,1,1,1,1,2,1,1,1,1,1,2,1,1,1,2},
        {2,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,2},
        {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
        {2,0,0,0,2,0,0,0,0,0,2,0,0,0,0,0,2,0,0,0,2},
        {2,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,2},
        {2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
    }
    mapSize = #map*#map[1]
    mapY = #map
    mapX = mapSize/mapY
    tileScale = 3
    tileSize = 32*tileScale

    collisionSize = 0

    for y = 1, mapY, 1 do
        for x = 1, mapX, 1 do
            if map[y][x] == 1 then
                collisionSize = collisionSize + 1
                collisions[collisionSize] = collision.create((x*tileSize)-tileSize, (y*tileSize)-tileSize, tileSize,tileSize)
            else 
                if map[y][x] == 0 then
                
                else
                    if map[y][x] == 2 then
                        collisionSize = collisionSize + 1
                        collisions[collisionSize] = collision.create((x*tileSize)-tileSize, (y*tileSize)-tileSize, tileSize,tileSize)
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

function LoadTexture()
    love.graphics.setDefaultFilter("nearest", "nearest")
    floor = love.graphics.newImage("sprites/floor.png")
    wall = love.graphics.newImage("sprites/wall.png")
    wallTop = love.graphics.newImage("sprites/wallTop.png")
end

function loadNpcs()
    npcs[1] = npc.create(0,0,10,10)
end

function drawNpcs()
    npcs[1]:draw()
end