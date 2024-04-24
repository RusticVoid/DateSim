
function love.load()
    love.window.setMode( 800, 600, {vsync=0} )
    WindowWidth = 800
    WindowHight = 600
    fullscreen = false
    ScreenScale = 1
    MainMenu = true

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

    clickDelay = 0.3
end

function love.keypressed( key, scancode, isrepeat )
    if key == "escape" then
        MainMenu = true
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
            end
            ScreenScale = 2.4
        else
            love.window.setMode( 800, 600, {vsync=0} )
            worldX = worldX - 560
            worldY = worldY - 240
            speechBubbleSize = DefaultSpeechBubbleSize
            TextSize = DefaultTextSize
            for i = 1, #npcs, 1 do
                npcs[i].protraitSize = 1.2
            end
            ScreenScale = 1
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
    if MainMenu == false then
        MouseX, MouseY = love.mouse.getPosition()
        WindowWidth, WindowHight = love.window.getMode()
        playerX, playerY = WindowWidth/2, WindowHight/2
        KeyInput()
    end
    MouseX, MouseY = love.mouse.getPosition()
end

function love.draw()
    if MainMenu == true then
        buttonX = 10*ScreenScale
        buttonXWidth = buttonX+275*ScreenScale
        buttonY = 10*ScreenScale
        buttonYWidth = buttonY+100*ScreenScale

        if MouseX > buttonX*ScreenScale and MouseX < buttonXWidth*ScreenScale and MouseY > buttonY*ScreenScale and MouseY < buttonYWidth*ScreenScale then
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("fill", buttonX*ScreenScale, buttonY*ScreenScale, 275*ScreenScale, 100*ScreenScale)
            love.graphics.setColor(0, 0, 0)
            love.graphics.print("PLAY!", buttonX*ScreenScale, buttonY*ScreenScale, 0, TextSize*3.5)
            if MousePressed == true then
                MainMenu = false
            end
        else
            love.graphics.setColor(0.5, 0.5, 0.5)
            love.graphics.rectangle("fill", buttonX*ScreenScale, buttonY*ScreenScale, 275*ScreenScale, 100*ScreenScale)
            love.graphics.setColor(1, 1, 1)
            love.graphics.print("PLAY!", buttonX*ScreenScale, buttonY*ScreenScale, 0, TextSize*3.5)
        end

        if MouseX > buttonX*ScreenScale and MouseX < buttonXWidth-65*ScreenScale and MouseY > buttonY+110*ScreenScale and MouseY < buttonYWidth+75*ScreenScale then
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("fill", buttonX*ScreenScale, buttonY+110*ScreenScale, 210*ScreenScale, 60*ScreenScale)
            love.graphics.setColor(0, 0, 0)
            love.graphics.print("Settings", buttonX*ScreenScale, buttonY+110*ScreenScale, 0, TextSize*2)
        else
            love.graphics.setColor(0.5, 0.5, 0.5)
            love.graphics.rectangle("fill", buttonX*ScreenScale, buttonY+110*ScreenScale, 210*ScreenScale, 60*ScreenScale)
            love.graphics.setColor(1, 1, 1)
            love.graphics.print("Settings", buttonX*ScreenScale, buttonY+110*ScreenScale, 0, TextSize*2)
        end

        if MouseX > buttonX*ScreenScale and MouseX < buttonXWidth-175*ScreenScale and MouseY > buttonY+180*ScreenScale and MouseY < buttonYWidth+150*ScreenScale then
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("fill", buttonX*ScreenScale, buttonY+180*ScreenScale, 100*ScreenScale, 60*ScreenScale)
            love.graphics.setColor(0, 0, 0)
            love.graphics.print("Exit", buttonX*ScreenScale, buttonY+180*ScreenScale, 0, TextSize*2)
            if MousePressed == true then
                os.exit()
            end
        else
            love.graphics.setColor(0.5, 0.5, 0.5)
            love.graphics.rectangle("fill", buttonX*ScreenScale, buttonY+180*ScreenScale, 100*ScreenScale, 60*ScreenScale)
            love.graphics.setColor(1, 1, 1)
            love.graphics.print("Exit", buttonX*ScreenScale, buttonY+180*ScreenScale, 0, TextSize*2)
        end
    else
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
end