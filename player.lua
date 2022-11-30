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
        player.health = 2
        player.dir = 1
        player.dashtimer = 0
        player.dashduration = 0.25
        player.isdash = false
        player.candash = false
        player.attacks = false
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

    if love.keyboard.isDown("space") and player.jumped == false and player.onground == true then
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
    else
        for i = 1, #contacts, 1 do
            local normal = vector2.new(contacts[i]:getNormal())
            --io.write("X: ", normal.x, " Y:", normal.y, " \n")            
            if normal.y == 1 then
                player.onground = true
            end
        end
    end
    io.write(player.dashtimer,  " \n")
end

function BeginContactPlayer(fixtureA, fixtureB, contact, player)
    if (fixtureA:getUserData().tag == "player" and fixtureB:getUserData().tag == "platform") or (fixtureA:getUserData().tag == "platform" and fixtureB:getUserData().tag == "player") then
        local normal = vector2.new(contact:getNormal())
        if normal.y == 1 then
            player.onground = true
        end
        player.collisionnormal = normal
    end
end


 function DrawPlayer(player)
     love.graphics.setColor(0, 0, 1)
     love.graphics.polygon("fill", player.body:getWorldPoints(player.shape:getPoints()))
 end

function KeyReleasedPlayer(key, player)
     if key == "space" then
         player.jumped = false
     end
     if key == "q" then
        player.dashtimer = 0
     end
 end
 

--[[function LoadAttack(World, player)
    local attack = {}
    attack.body = love.physics.newBody(World, player.body:getX(), player.body:getY(), "dynamic")
    attack.body:setFixedRotation(true)
    attack.shape = love.physics.newRectangleShape(30, 10)
    attack.fixture = love.physics.newFixture(attack.body, attack.shape)
    attack.fixture:setUserData("attack")
    attack.fixture:setSensor(true)
    return attack
end

function DrawAttack(attack, player)
    if player.attacks == true then
        love.graphics.polygon("fill", attack.body:getWorldPoints(attack.shape:getPoints()))
    end
end

function UpdateAttack(key, attack, player)
    if key == "f" then
        player.attacks = true
    end
end]]--