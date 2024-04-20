
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

    debug = false

    playerX, playerY, PlayerW, PlayerH = WindowWidth/2, WindowHight/2, 20, 20
end

function love.update(dt)
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