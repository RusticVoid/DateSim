
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

    DefaultSpeechBubbleSize = 10
    speechBubbleSize = DefaultSpeechBubbleSize
    DefaultTextSize = 2
    TextSize = DefaultTextSize

    playerX, playerY, PlayerW, PlayerH, playerSpeed = WindowWidth/2, WindowHight/2, 50, 50, 1
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
            TextSize = 8
        else
            love.window.setMode( 800, 600, {vsync=0} )
            worldX = worldX - 560
            worldY = worldY - 240
            npcs[1].protraitSize = 1.2
            speechBubbleSize = DefaultSpeechBubbleSize
            TextSize = DefaultTextSize
        end
    end

    if key == 'f1' then
        debug = not debug
    end
    
    if key == 'lshift' then
        if debug == true then
            playerSpeed = 5
        else
            playerSpeed = 2
        end
    end
end

function love.keyreleased( key, scancode )
    if key == 'lshift' then
        playerSpeed = 1
    end
end

function love.mousepressed( x, y, button, istouch, presses )
    if button == 1 then
        MousePressed = true
    end
end

function love.mousereleased( x, y, button, istouch, presses )
    if button == 1 then
        MousePressed = false
    end
end

function love.update(dt)
    WindowWidth, WindowHight = love.window.getMode()
    playerX, playerY = WindowWidth/2, WindowHight/2
    MouseX, MouseY = love.mouse.getPosition()
    KeyInput()
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    drawMap()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", playerX, playerY, PlayerW, PlayerH)
    drawMap2()
    drawNpcs()
    if debug == true then
        love.graphics.setColor(1, 0, 0)
        for i = 1, collisionSize, 1 do
            collisions[i]:draw()
        end
    end
end