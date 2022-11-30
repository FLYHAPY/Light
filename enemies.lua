function Load_enemy(World, x, y)
    local enemy = {}
    enemy.width = 40
    enemy.height = 40
    enemy.body = love.physics.newBody(World, x, y, "dynamic")
    enemy.body:setFixedRotation(true)
    enemy.shape = love.physics.newRectangleShape(enemy.width, enemy.height)
    enemy.fixture = love.physics.newFixture(enemy.body, enemy.shape)
    enemy.tag = "enemy"
    enemy.fixture:setUserData(enemy)
    enemy.fixture:setSensor(false)
    enemy.collisionnormal = vector2.new(0, 0)
    enemy.direction = -1
    enemy.width = 60
    enemy.height = 60
    enemy.health = 10
    enemy.attackdamage= 60
    enemy.viewrange = 170
    enemy.playerdetect = false
    enemy.colideplayer = false
    return enemy
end


function Drawenemy(enemy)
    love.graphics.setColor(0, 1, 1)
    for i = 1, #enemy, 1 do
        if enemy[i].colideplayer == false then
            love.graphics.polygon("fill", enemy[i].body:getWorldPoints(enemy[i].shape:getPoints()))
        end
    end
end

function AttackPlayer(a, b, collision, enemy, player)
    player.health = player.health - 1
end

function Updateenemy(enemy, dt)
    for i = 1, #enemy, 1 do
            local enemygravity = vector2.new(0, 2500)
            enemy[i].body:applyForce(enemygravity.x, enemygravity.y)
        
        if enemy[i].collisionnormal.x == 1 or enemy[i].collisionnormal.x == -1 then
           enemy[i].direction = enemy[i].collisionnormal.x
        end

        local enemyvelocity = vector2.new(enemy[i].body:getLinearVelocity())
        enemy[i].body:setLinearVelocity(100 * enemy[i].direction, enemyvelocity.y)

    end
end


function BeginContactEnemy(fixtureA, fixtureB, contact)
    if (fixtureA:getUserData().tag == "enemy" and fixtureB:getUserData().tag == "platform") then
        fixtureA:getUserData().collisionnormal = vector2.new(contact:getNormal())
    elseif (fixtureA:getUserData().tag == "platform" and fixtureB:getUserData().tag == "enemy") then
        fixtureB:getUserData().collisionnormal = vector2.new(contact:getNormal())
    end   
end