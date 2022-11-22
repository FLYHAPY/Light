function Createkit(World, x, y, width, height)
    local repairkit = {}
    repairkit.body = love.physics.newBody(World, x, y, "static")
    repairkit.shape = love.physics.newRectangleShape(width, height)
    repairkit.fixture = love.physics.newFixture(repairkit.body, repairkit.shape)
    repairkit.fixture:setUserData("kit")
    repairkit.fixture:setSensor(true)
    repairkit.disappear = false
    return repairkit
end

function DrawRepairKit(repairkit)
        for i = 1, #repairkit, 1 do
                love.graphics.setColor(1, 0, 0)
                love.graphics.polygon("fill", repairkit[i].body:getWorldPoints(repairkit[i].shape:getPoints())) 
            end
        end


function Repairkit_contact(a, b, collision, repairkit, player)
        if a:getUserData("kit") and b:getUserData("player") or a:getUserData("player") and b:getUserData("kit") then
            player.health = player.health + 1
            repairkit.disappear = true
            return true
        end
    end

function CheckRemove_Kit(repairkit)
    if repairkit.disappear == true and not repairkit.body == nil then
        repairkit.body:destroy()
        table.remove(repairkit, 1)
    end 
end

function Remove_Kit(repairkit)
    for i = 1, #repairkit, 1 do
        if repairkit == 1 then
            table.remove(repairkit, i)
            repairkit.body:destroy()
        end
    end
end
    