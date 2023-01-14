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
    return key
end

function Drawkey(key)
    for i = 1, #key, 1 do
        local currentkey = key[i]


        if currentkey ~= nil and currentkey.body ~= nil and currentkey.shape ~= nil then
            love.graphics.setColor(1, 0, 0)
            love.graphics.polygon("fill", currentkey.body:getWorldPoints(currentkey.shape:getPoints())) 
        end
    end
end


function Key_contact(a, b, collision, key, player)
    --if (a:getUserData("kit") and b:getUserData("player")) or (a:getUserData("player") and b:getUserData("kit")) then
    if player ~= nil and key ~= nil then
        player.canopendoor = true
        key.disappear = true
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
    end

end
