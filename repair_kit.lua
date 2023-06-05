function Createkit(World, x, y, width, height)
    local repairkit = {}
    repairkit.body = love.physics.newBody(World, x, y, "static")
    repairkit.shape = love.physics.newRectangleShape(width, height)
    repairkit.fixture = love.physics.newFixture(repairkit.body, repairkit.shape)
    repairkit.tag = "kit"
    repairkit.fixture:setUserData(repairkit)
    repairkit.fixture:setSensor(true)
    repairkit.disappear = false
    repairkit.sprite = love.graphics.newImage("assets/.png/RepairKitSprite.png")
    return repairkit
end

function DrawRepairKits(repairkit)
    for i = 1, #repairkit, 1 do


        if repairkit[i] ~= nil and repairkit[i].body ~= nil and repairkit[i].shape ~= nil then
            local repairkitposition = vector2.new(repairkit[i].body:getPosition())
            love.graphics.setColor(1, 0, 0)
            love.graphics.draw(repairkit[i].sprite , repairkitposition.x - 32, repairkitposition.y - 32 ) 
        end
    end
end

function DrawdsRepairKits(repairkit)
    for i = 1, #repairkit, 1 do
        local currentRepairKit = repairkit[i]


        if currentRepairKit ~= nil and currentRepairKit.body ~= nil and currentRepairKit.shape ~= nil then
            love.graphics.setColor(1, 0, 0)
            love.graphics.polygon("fill", currentRepairKit.body:getWorldPoints(currentRepairKit.shape:getPoints())) 
        end
    end
end


function Repairkit_contact(a, b, collision, repairkit, player)
    --if (a:getUserData("kit") and b:getUserData("player")) or (a:getUserData("player") and b:getUserData("kit")) then
    if player ~= nil and repairkit ~= nil then
        player.health = player.health + 1
        repairkit.disappear = true
        love.audio.play(player.PickUpsound)
        return true
    end    
    --end
    return false
end

-- Seperated The Checking If You Can Destroy From The Actual Body Destruciton For Clarity
function CanDestroyRepairKit(repairkit)
    if repairkit == nil then
        return false;
    end

    if repairkit.disappear then return true 
    else   return repairkit.disappear end
end

-- Do The Actual Destruction Of The Body
function DestroyRepairKitBody(repairkit)

--io.write("test\n")

    if repairkit ~= nil and repairkit.body ~= nil then
        repairkit.body:destroy()
        repairkit.body = nil
        repairkit.shape:release()
        repairkit.shape = nil
    end

end 