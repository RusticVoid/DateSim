
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
    DefaultTextSize = 2.5
    TextSize = DefaultTextSize
    
    TextFont = love.graphics.newFont(10, "mono")
    TextFont:setFilter("nearest")
    love.graphics.setFont(TextFont)

    playerX, playerY, PlayerW, PlayerH, playerSpeed = WindowWidth/2, WindowHight/2, 50, 50, 1
    coin_amount = 0
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
            speechBubbleSize = DefaultSpeechBubbleSize*2.4
            TextSize = DefaultTextSize*2.4
            for i = 1, #npcs, 1 do
                npcs[i].protraitSize = 2.5
                npcs[i].buttonMorphX = npcs[i].buttonMorphX*2+10
            end
        else
            love.window.setMode( 800, 600, {vsync=0} )
            worldX = worldX - 560
            worldY = worldY - 240
            speechBubbleSize = DefaultSpeechBubbleSize
            TextSize = DefaultTextSize
            for i = 1, #npcs, 1 do
                npcs[i].protraitSize = 1.2
                npcs[i].buttonMorphX = (npcs[i].buttonMorphX-10)/2
            end
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
    Ui()
    NpcTalk()
end