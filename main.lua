
function love.load()
    love.window.setMode( 800, 600, {vsync=0} )
    WindowWidth = 800
    WindowHight = 600
    fullscreen = false

    worldX = 100
    worldY = 100

    collisions = {}
    npcs = {}
    
    require("functions")
    require("classes")

    LoadTexture()
    loadMap()
    loadNpcs()

    aDown = false
    dDown = false
    sDown = false
    wDown = false
    interact = false
    debug = false

    speechBubbleSize = 10

    playerX, playerY, PlayerW, PlayerH = WindowWidth/2, WindowHight/2, 50, 50
end

function love.keypressed( key, scancode, isrepeat )
   if key == "escape" then
      love.event.quit()
   end
   
   if interact == true then
       if key == 'e' then
           interacted = not interacted
       end
   end

    if key == 'f11' then
        fullscreen = not fullscreen
        screen_width = love.graphics.getWidth()
        screen_height = love.graphics.getHeight()
        if fullscreen == true then
            love.window.setMode( screen_width, screen_height, {fullscreen=true, vsync=0} )
            worldX = worldX + 560
            worldY = worldY + 240
            npcs[1].protraitSize = 2.5
            speechBubbleSize = 24
        else
            love.window.setMode( 800, 600, {vsync=0} )
            worldX = worldX - 560
            worldY = worldY - 240
            npcs[1].protraitSize = 1.2
            speechBubbleSize = 10
        end
    end

    if key == 'f1' then
        debug = not debug
    end
end

function love.update(dt)
    WindowWidth, WindowHight = love.window.getMode()
    playerX, playerY = WindowWidth/2, WindowHight/2
    KeyInput()
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    drawMap()
    drawNpcs()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", playerX, playerY, PlayerW, PlayerH)
    if debug == true then
        for i = 1, collisionSize, 1 do
            collisions[i]:draw()
        end
    end
end