function Createdoor(world, x, y, width, height)
    local door = {}
    door.body = love.physics.newBody(world, x, y, "static")
    door.shape = love.physics.newRectangleShape(width, height)
    door.fixture = love.physics.newFixture(door.body, door.shape, 1)
    door.tag = "door"
    door.fixture:setUserData(door)
    door.collected = false
    door.fixture:setSensor(false)
    door.disappear = false
    door.open = false
    door.collected = false
    door.contact = false
    door.sprite = love.graphics.newImage("assets/.png/DoorSprite.png")
    return door
end

function Drawdoor(door)
    for i = 1, #door, 1 do
       if door[1] ~= nil and door[1].body ~= nil and door[1].shape ~= nil then
            local doorposition = vector2.new(door[1].body:getPosition())
            love.graphics.setColor(1, 1, 1)
            love.graphics.draw(door[1].sprite, doorposition.x - 32, doorposition.y - 64) 
        end
    end
end


function Door_contact(a, b, collision, door, player)
    --if (a:getUserData("kit") and b:getUserData("player")) or (a:getUserData("player") and b:getUserData("kit")) then
    if player ~= nil and door ~= nil then
        door.disappear = true
        door.contact = true
        player.contactdoor = true
        love.audio.play(player.PickUpsound)
        player.keycollected = false
        return true
    end    
    --end
    return false
end

-- Seperated The Checking If You Can Destroy From The Actual Body Destruciton For Clarity
function CanDestroydoor(door, player)
    if door == nil then
        return false;
    end

    if door.disappear  then return true 
    else   return door.disappear end
end

-- Do The Actual Destruction Of The Body
function DestroydoorBody(door, player)

    if player.contactdoor == false then return end
    if door ~= nil and door.body ~= nil and player.canopendoor  == true and door.contact == true and player.contactdoor == true    then
        door.body:destroy()
        door.body = nil
        door.shape:release()
        door.shape = nil
    end

end