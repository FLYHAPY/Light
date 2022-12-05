function Createkit(World, x, y, width, height)
    local repairkit = {}
    repairkit.body = love.physics.newBody(World, x, y, "static")
    repairkit.shape = love.physics.newRectangleShape(width, height)
    repairkit.fixture = love.physics.newFixture(repairkit.body, repairkit.shape)
    repairkit.tag = "kit"
    repairkit.fixture:setUserData(repairkit)
    repairkit.fixture:setSensor(true)
    repairkit.disappear = false
    return repairkit
end

function DrawRepairKits(repairkit)
    for i = 1, #repairkit, 1 do
        local currentRepairKit = repairkit[i]

        if currentRepairKit ~= nil then
            love.graphics.setColor(1, 0, 0)
            love.graphics.polygon("fill", currentRepairKit.body:getWorldPoints(currentRepairKit.shape:getPoints())) 
        end
    end
end


function Repairkit_contact(a, b, collision, repairkit, player)
    --if (a:getUserData("kit") and b:getUserData("player")) or (a:getUserData("player") and b:getUserData("kit")) then
        player.health = player.health + 1
        repairkit.disappear = true
        return true
    --end
end

-- Seperated The Checking If You Can Destroy From The Actual Body Destruciton For Clarity
function CanDestroyRepairKit(repairkit)
    if repairkit == nil then
        return false;
    end

    return repairkit.disappear
end

-- Do The Actual Destruction Of The Body
function DestroyRepairKitBody(repairkit)

    if repairkit ~= nil and repairkit.body ~= nil then
        repairkit.body:destroy()
    end

end


--[[ Substituted It With The Above 2 Functions
function CheckRemove_Kit(repairkit)
    if repairkit.disappear == true then
        table.remove(repairkit, 1)
		if repairkit.body ~= nil then
			repairkit.body:destroy()
		end
    end 
end
]]  