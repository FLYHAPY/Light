local IDLE, JUMP, RUN = 1, 2, 3 
function Load_enemy(World, x, y)
    local enemy = {}
    enemy.width = 30
    enemy.height = 60
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
    enemy.attackdamage = 4
    enemy.viewrange = 170
    enemy.playerdetect = false
    enemy.colideplayer = false
    enemy.health = 10
    enemy.spritesheet = love.graphics.newImage("assets/enemies/Enemy1AnimationRight.png")
    enemy.quads = CreateSpriteSheetEnemyQuads(enemy.spritesheet, 4, 1)
    enemy.frame = 1
    enemy.frametimer = 0
    enemy.framerate = 0.6 
    enemy.animation = RUN
    return enemy
end

function CreateSpriteSheetEnemyQuads(spritesheet, cols, rows)
    local w = spritesheet:getWidth() / cols
    local h = spritesheet:getHeight() / rows
    local quads = {}
    local count = 1
    for j = 0, rows - 1, 1 do
        for i = 0, cols - 1, 1 do
            quads[count] = love.graphics.newQuad(i * w, j * h, w, h, 
                            spritesheet:getWidth(), spritesheet:getHeight())
            count = count + 1
        end
    end
    return quads
end

function AnimateEnemy(enemy, animation, dt)
    for i = 1, #enemy, 1 do
    if enemy[i].animation ~= animation then
        enemy[i].animation = animation
        enemy[i].frametimer = 1
    end
    enemy[i].frametimer = enemy[i].frametimer + dt
    if enemy[i].frametimer > enemy[i].framerate then
        enemy[i].frametimer = 0     
        enemy[i].frame = enemy[i].frame + 1   
        if enemy[i].animation == RUN then            
            if enemy[i].frame < 1 or enemy[i].frame > 4 then
                enemy[i].frame = 1
            end
        elseif enemy[i].animation == JUMP then
            if enemy[i].frame < 16 or enemy[i].frame > 22 then
                enemy[i].frame = 16
            end
        elseif enemy[i].animation == IDLE then
            if enemy[i].frame < 23 or enemy[i].frame > 37 then
                enemy[i].frame = 1
            end
        end
    end
end
end


function DrawEnemy(enemy)
    for i = 1, #enemy, 1 do
        love.graphics.setColor(1, 1, 1)
        local currentEnemy = enemy[i]
        if currentEnemy ~= nil and currentEnemy.body ~= nil and currentEnemy.shape ~= nil  then
            local offset = 0    
            local enemyposition = vector2.new(enemy[i].body:getPosition())
                if enemy[i].direction == 1 then
                    offset = 65
                 end   
            love.graphics.draw(enemy[i].spritesheet, enemy[i].quads[enemy[i].frame], enemyposition.x + 35 - offset,  enemyposition.y - 35 , 0, 1 * enemy[i].direction, 1)
        end
    end
end

function AttackPlayer(a, b, collision, enemy, player)
    player.damaged = true
    player.health = player.health - 4
    love.audio.play(player.damagedsound)
end

function UpdateEnemy(enemy, dt)
    for i = 1, #enemy, 1 do
        if enemy[i] ~= nil and enemy[i].body ~= nil  then    
            local contacts = enemy[i].body:getContacts()
            for i = 1, #contacts, 1 do            
                local fixtureA, fixtureB = contacts[i]:getFixtures()
                local categoryA = fixtureA:getCategory()
                local categoryB = fixtureB:getCategory()
                if (categoryA == 1 and categoryB == 2) then 
                    local normal = vector2.new(contacts[i]:getNormal())
                    if vector2.magnitude(normal) == 1 then
                        if normal.x == -1 or normal.x == 1 then
                            local currentEnemy = fixtureA:getUserData()
                            currentEnemy.collisionnormal = vector2.new(normal.x, normal.y)
                            currentEnemy.direction = currentEnemy.collisionnormal.x
                        end                        
                    end
                elseif (categoryA == 2 and categoryB == 1) then
                    local normal = vector2.new(contacts[i]:getNormal())
                    if vector2.magnitude(normal) == 1 then
                        if normal.x == -1 or normal.x == 1 then                            
                            local currentEnemy = fixtureB:getUserData()
                            currentEnemy.collisionnormal = vector2.new(normal.x, normal.y)
                            currentEnemy.direction = currentEnemy.collisionnormal.x
                        end
                    end
                end
            end
       
            local enemygravity = vector2.new(0, 2500)
            enemy[i].body:applyForce(enemygravity.x, enemygravity.y)
            local enemyvelocity = vector2.new(enemy[i].body:getLinearVelocity())
            enemy[i].body:setLinearVelocity(100 * enemy[i].direction, enemyvelocity.y)
            AnimateEnemy(enemy, RUN, dt)
        end
    end
end



function BeginContactEnemy(fixtureA, fixtureB, contact)
    if (fixtureA:getUserData().tag == "enemy" and fixtureB:getUserData().tag == "platform") then
        fixtureA:getUserData().collisionnormal = vector2.new(contact:getNormal())
    elseif (fixtureA:getUserData().tag == "platform" and fixtureB:getUserData().tag == "enemy") then
        fixtureB:getUserData().collisionnormal = vector2.new(contact:getNormal())
    end   
end

function Enemy_contact(a, b, collision, enemy, attack)
        enemy.health = enemy.health - attack.damage
        enemy.disappear = true
        return true
end

-- Seperated The Checking If You Can Destroy From The Actual Body Destruciton For Clarity
function CanDestroyEnemy(enemy)
    if enemy == nil then
        return false;
    end

    return enemy.disappear
end

-- Do The Actual Destruction Of The Body
function DestroyEnemyBody(enemy, player)

    if enemy ~= nil and enemy.body ~= nil then
        enemy.body:destroy()
        enemy.shape:release()
        enemy.body = nil
        enemy.shape = nil
        if player.SSM < 10 then
            player.SSM = player.SSM + 1
        end
    end

end