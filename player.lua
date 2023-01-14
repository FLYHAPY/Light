function Player_load(World, x, y)
        local player = {}
        player.body = love.physics.newBody(World, x, y, "dynamic")
        player.shape = love.physics.newRectangleShape(30, 60)
        player.fixture = love.physics.newFixture(player.body, player.shape, 1)
        player.fixture:setFriction(0)
        player.tag = "player"
        player.fixture:setUserData(player)
        player.body:setFixedRotation(true)
        player.maxvelocity = 200
        player.jumped = false
        player.onground = false
        player.collisionnormal = vector2.new(0, 0)
        player.health = 10
        player.dir = 1
        player.dashtimer = 0
        player.dashduration = 0.25
        player.isdash = false
        player.candash = false
        player.attacks = false
        player.SSM = 0
        player.SSMact = false
        player.SSMtimer = 20
        player.SSMfinished = false
        player.died = false
        player.restart = false
        player.canopendoor = false
        player.damaged = false
        return player
end

function UpdatePlayer(player, dt)
    
        local playergravity = vector2.new(0, 2500)
        player.body:applyForce(playergravity.x, playergravity.y)
        local playervelocity = vector2.new(player.body:getLinearVelocity())

    if love.keyboard.isDown("right") and player.collisionnormal.x ~= 1 then
        player.body:setLinearVelocity(300, playervelocity.y)
        player.dir = 1
    elseif love.keyboard.isDown("left") and player.collisionnormal.x ~= -1 then
        player.body:setLinearVelocity(-300, playervelocity.y)
        player.dir = -1
    else
        player.body:setLinearVelocity(0, playervelocity.y)
    end

    if love.keyboard.isDown("space") and player.jumped == false and player.onground == true and player.damaged == false then
        local jumpForce = vector2.new(0, -1500)
        player.body:applyLinearImpulse(jumpForce.x, jumpForce.y)
        player.jumped = true
        --player.onground = false
    end

    if love.keyboard.isDown("q") and player.dashtimer < 0.25 and player.candash == true  and player.dir == 1 then
        local dashforce = vector2.new(2100, 0)
        player.body:applyLinearImpulse(dashforce.x, dashforce.y)
        player.isdash = true
    end

    if love.keyboard.isDown("q") and player.dashtimer < 0.25  and player.candash == true and player.dir == -1 then
        local dashforce = vector2.new(-2100, 0)
        player.body:applyLinearImpulse(dashforce.x, dashforce.y)
        player.isdash = true
    end

    if player.isdash == true then
        player.dashtimer = player.dashtimer + dt
    end

    if player.dashtimer >= 0.05 then
        player.candash = false
        player.isdash = false
    end
    if player.isdash == false then
        player.candash = true
    end

    local contacts = player.body:getContacts()
    if #contacts == 0 then
        player.onground = false
        player.collisionnormal = vector2.new(0, 0)
    else
        for i = 1, #contacts, 1 do            
            local fixtureA, fixtureB = contacts[i]:getFixtures()
            local categoryA = fixtureA:getCategory()
            local categoryB = fixtureB:getCategory()
            if (categoryA == 1 and categoryB == 2) then 
                local normal = vector2.new(contacts[i]:getNormal())
                if vector2.magnitude(normal) == 1 then
                    if normal.y == 1 then
                        player.onground = true
                    end                 
                    player.collisionnormal = vector2.new(normal.x, normal.y)
                end
            elseif (categoryA == 2 and categoryB == 1) then
                local normal = vector2.new(contacts[i]:getNormal())
                if vector2.magnitude(normal) == 1 then
                    if normal.y == -1 then
                        player.onground = true
                    end
                    player.collisionnormal = vector2.new(-normal.x, -normal.y)
                end
            end
        end
    end
    --io.write(player.dashtimer,  " \n")

    --SSM
    
    if love.keyboard.isDown("0") then
        player.SSM = player.SSM + 1
    end
    if player.SSMact == true then
        player.SSMtimer = player.SSMtimer -dt
    end

    if player.SSMtimer <= 0 then
        player.SSMtimer = 20
        player.SSMact = false
        player.SSM = 0
        player.SSMfinished = true
    end

    if player.health <=0 then
        player.died = true
    end
    --io.write(player.SSMtimer,  " \n")
end


function KeyPressedSSM(key, player, attack)
    if key == "e" and player.SSM >= 10 and player.SSMtimer >= 20 then
       player.SSMact = true
       attack.damage = attack.damage * 3
       player.health = player.health * 2
    end
end


function BeginContactPlayer(fixtureA, fixtureB, contact, player)
    if (fixtureA:getUserData().tag == "player" and fixtureB:getUserData().tag == "platform") or (fixtureA:getUserData().tag == "platform" and fixtureB:getUserData().tag == "player") then
        local normal = vector2.new(contact:getNormal())
        player.damaged = false
        if normal.y == 1 then
            player.onground = true
        end
        player.collisionnormal = normal
    end
end


 function DrawPlayer(player)
    local playerposition = vector2.new(player.body:getPosition())
    if player.SSMact == true then
        love.graphics.setColor(1, 1, 1) 
    else  love.graphics.setColor(0, 0, 1)
    end
    love.graphics.rectangle("fill", 380 - 15, 620 - 30 , 30, 60)
 end

function KeyReleasedPlayer(key, player)
     if key == "space" then
         player.jumped = false
     end
     if key == "q" then
        player.dashtimer = 0
     end
 end
 

function LoadAttack(World, player)
    local attack = {}
    attack.body = love.physics.newBody(World, player.body:getX(), player.body:getY(), "kinematic")
    attack.body:setFixedRotation(true)
    attack.body:setActive(false)
    attack.shape = love.physics.newRectangleShape(50, 10)
    attack.fixture = love.physics.newFixture(attack.body, attack.shape)
    attack.fixture:setUserData(attack)
    attack.tag = "attack"
    attack.fixture:setSensor(true)
    attack.timer = 0
    attack.duration = 0.50
    attack.damage = 4
    attack.disappear = false
    return attack
end

function DrawAttack(attack, player)
    if player.attacks == true then
        love.graphics.polygon("fill", attack.body:getWorldPoints(attack.shape:getPoints()))
    end
end

function StartAttack(attack, player)
    if player.died == true then return end
    
    if attack.timer <= 0.25 then
        player.attacks = true
        attack.body:setActive(true)
    end
end

function UpdateAttack(attack, player, dt)
    if player.died == true then return end
    local posx, posy = player.body:getPosition()
    if player.dir == 1 then
        posx = posx + 20
    else
        posx = posx - 20
    end
    attack.body:setPosition(posx, posy)

    if player.attacks == true then
        attack.timer = attack.timer + dt
    end
    
    if attack.timer >= 0.25 then
        player.attacks = false
        attack.timer = 0
        attack.body:setActive(false)
    end
end

function AttackReellease(key, attack, player)
    if player.died == true then return end
    if key == "f" then
        attack.timer = 0
        player.attacks = false
        attack.body:setActive(false)
    end
end

function UpdateSSM(player, attack)
    if player.SSMfinished == true then
        attack.damage = 4
        player.health = player.health / 2
        player.SSMfinished = false
    end
end

