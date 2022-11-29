function Load_Enemie1(World, x, y)
    local enemie1 = {}
    enemie1.width = 20
    enemie1.height = 20
    enemie1.body = love.physics.newBody(World, x, y, "dynamic")
    enemie1.body:setFixedRotation(true)
    enemie1.shape = love.physics.newRectangleShape(enemie1.width, enemie1.height)
    enemie1.fixture = love.physics.newFixture(enemie1.body, enemie1.shape)
    enemie1.fixture:setUserData("enemie1")
    enemie1.fixture:setSensor(true)
    enemie1.width = 60
    enemie1.height = 60
    enemie1.health = 10
    enemie1.attackdamage= 60
    enemie1.viewrange = 170
    enemie1.playerdetect = false
    return enemie1
end


function Drawenemie1(enemie1)
    love.graphics.setColor(0, 1, 1)
    for i = 1, #enemie1, 1 do
        love.graphics.polygon("fill", enemie1[i].body:getWorldPoints(enemie1[i].shape:getPoints()))
    end
end

function AttackPlayer(a, b, collision, enemie1, player)
    player.health = player.health - 1
end