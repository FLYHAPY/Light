function Createdoor(world, x, y, width, height)
    local door = {}
    door.body = love.physics.newBody(world, x, y, "static")
    door.shape = love.physics.newRectangleShape(width, height)
    door.fixture = love.physics.newFixture(door.body, door.shape, 1)
    door.tag = "door"
    door.fixture:setUserData(door)
    door.collected = false
    door.fixture:setSensor(false)
    door.open = false
    return door
end

function Drawdoor(door, player)
    if door ~= nil and door.body ~= nil and door.shape ~= nil and door.open == false then
        love.graphics.setColor(1, 1, 1) 
        love.graphics.polygon("fill", door.body:getWorldPoints(door.shape:getPoints()))
    end
end

function BeginContactdoor(fixtureA, fixtureB, contact, door, player, key)
    if player.canopendoor == true and ((fixtureA:getUserData().tag == "door" and fixtureB:getUserData().tag == "player") or (fixtureA:getUserData().tag == "player" and fixtureB:getUserData().tag == "door")) then
        player.canopendoor = false
        key.collected = false
        door.open = true
        door.body:destroy()
    end
end


function CreateSpecialspecialdoor(world, x, y, width, height)
    local specialdoor = {}
    specialdoor.body = love.physics.newBody(world, x, y, "static")
    specialdoor.shape = love.physics.newRectangleShape(width, height)
    specialdoor.fixture = love.physics.newFixture(specialdoor.body, specialdoor.shape, 1)
    specialdoor.tag = "specialdoor"
    specialdoor.fixture:setUserData(specialdoor)
    specialdoor.collected = false
    specialdoor.fixture:setSensor(false)
    specialdoor.open = false
    return specialdoor
end

function Drawspecialdoor(specialdoor)
    love.graphics.setColor(1, 0.5, 0.1) 
    love.graphics.polygon("fill", specialdoor.body:getWorldPoints(specialdoor.shape:getPoints()))
end

function BeginContactspecialdoor(fixtureA, fixtureB, contact, player)
    if ((fixtureA:getUserData().tag == "specialdoor" and fixtureB:getUserData().tag == "player") or (fixtureA:getUserData().tag == "player" and fixtureB:getUserData().tag == "specialdoor")) then
        player.body:setPosition(0, 0)
    end
end
