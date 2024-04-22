require "main"

--collision
collision = {}
collision.__index = collision

function collision.create(x, y, width, hight, solid, collisionID)
    local instance = setmetatable({}, collision)
    instance.x = x
    instance.y = y
    instance.width = width
    instance.hight = hight
    instance.solid = solid
    instance.collisionID = collisionID
    return instance
end

function collision:draw()
    love.graphics.rectangle("line", self.x+worldX, self.y+worldY, self.width, self.hight)
end