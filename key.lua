function Createkey(world, x, y, width, height)
    local key = {}
    key.body = love.physics.newBody(world, x, y, "static")
    key.shape = love.physics.newRectangleShape(width, height)
    key.fixture = love.physics.newFixture(key.body, key.shape, 1)
    key.tag = "key"
    key.fixture:setUserData(key)
    key.collected = false
    key.fixture:setSensor(true)
    return key
end

function BeginContactkey(fixtureA, fixtureB, contact, key, player)
    if (fixtureA:getUserData().tag == "key" and fixtureB:getUserData().tag == "player") or (fixtureA:getUserData().tag == "player" and fixtureB:getUserData().tag == "key") then
        player.canopendoor = true
        key.body:destroy()
        key.body = nil
        key.collected = true
        key = nil
    end
end

function Drawkey(key, player)
    if key == nil then return end
    if key ~= nil and key.body ~= nil and key.shape ~= nil and  key.collected == false then
        love.graphics.setColor(0.5, 0.3, 0.8)
        love.graphics.polygon("fill", key.body:getWorldPoints(key.shape:getPoints()))
    end
end