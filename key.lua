function Createkey(world, x, y, width, height)
    local key = {}
    key.body = love.physics.newBody(world, x, y, "static")
    key.shape = love.physics.newRectangleShape(width, height)
    key.fixture = love.physics.newFixture(key.body, key.shape, 1)
    key.tag = "key"
    key.fixture:setUserData(key)
    key.collected = false
    key.fixture:setSensor(true)
    key.disappear = false
    key.sprite = love.graphics.newImage("assets/.png/KeySprite.png")
    return key
end

function Drawkey(key)
    for i = 1, #key, 1 do
     if key[1] ~= nil and key[1].body ~= nil and key[1].shape ~= nil then
            local keyposition = vector2.new(key[1].body:getPosition())
            love.graphics.setColor(1, 1, 1)
            love.graphics.draw(key[1].sprite, keyposition.x - 32, keyposition.y - 32) 
        end
    end
end


function Key_contact(a, b, collision, key, player)
    --if (a:getUserData("kit") and b:getUserData("player")) or (a:getUserData("player") and b:getUserData("kit")) then
    if player ~= nil and key ~= nil then
        player.canopendoor = true
        key.disappear = true
        love.audio.play(player.PickUpsound)
        player.keycollected = true
        return true
    end    
    --end
    return false
end

-- Seperated The Checking If You Can Destroy From The Actual Body Destruciton For Clarity
function CanDestroykey(key)
    if key == nil then
        return false;
    end

    if key.disappear then return true 
    else   return key.disappear end
end

-- Do The Actual Destruction Of The Body
function DestroykeyBody(key)

--io.write("test\n")

    if key ~= nil and key.body ~= nil then
        key.body:destroy()
        key.body = nil
        key.shape:release()
        key.shape = nil
    end

end