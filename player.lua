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
        player.totaldash = 500
        player.xvelo = 0
        return player
end

function UpdatePlayer(player, dt)
    local playergravity = vector2.new(0, 1100)
    player.body:applyForce(playergravity.x, playergravity.y)
    local playervelocity = vector2.new(player.body:getLinearVelocity())

    if love.keyboard.isDown("right") and player.collisionnormal.x ~= 1 then
        player.body:setLinearVelocity(300, playervelocity.y)
        player.dir = 1
    elseif love.keyboard.isDown("left") and player.collisionnormal.x ~= -1 then
        player.body:setLinearVelocity(-300, playervelocity.y)
        player.dir = 0
    else
        player.body:setLinearVelocity(0, playervelocity.y)
    end

    if love.keyboard.isDown("space") and player.jumped == false and
       player.onground == true then
        local jumpForce = vector2.new(0, -1200)
        player.body:applyLinearImpulse(jumpForce.x, jumpForce.y)
        player.jumped = true
        --player.onground = false
    end

    if love.keyboard.isDown("q") and player.dashtimer <= 0  and player.isdash == false and player.dir == 1 then
        local dashforce = vector2.new(1500, 0)
        player.body:applyLinearImpulse(dashforce.x, dashforce.y)
        player.isdash = true
        player.dashtimer = player.dashduration
    end

    if love.keyboard.isDown("q") and player.dashtimer <= 0  and player.isdash == false and player.dir == 0 then
        local dashforce = vector2.new(1500, 0)
        player.body:applyLinearImpulse(-dashforce.x, dashforce.y)
        player.isdash = true
        player.dashtimer = player.dashduration
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
        love.graphics.setColor(1, 0, 0)
        love.graphics.polygon("fill", player.body:getWorldPoints(player.shape:getPoints()))
    end

    function KeyReleasedPlayer(key, player)
        if key == "up" then
            player.jumped = false
        end
    end



function Player_dashagain(player, dt)
    if player.dashtimer > 0 then
        player.dashtimer = player.dashtimer - dt
        player.isdash = false
    end
end

function LoadAttack(World, player)
    local attack = {}
    attack.body = love.physics.newBody(World, player.body:getX(), player.body:getY(), "dynamic")
    attack.body:setFixedRotation(true)
    attack.shape = love.physics.newRectangleShape(30, 10)
    attack.fixture = love.physics.newFixture(player.body, attack.shape)
    attack.fixture:setUserData("attack")
    attack.fixture:setSensor(true)
    attack.attacking = false
    return attack
end

function DrawAttack(attack)
    if attack.attacking == true then
        love.graphics.polygon("fill", attack.body:getWorldPoints(attack.shape:getPoints()))
    end
end

function UpdateAttack(key, attack)
    if key == "f" then
        attack.attacking = true
    end
end

--[[function AttackLocation(attack, player)
    attack.body:setLinearVelocity(player.xvelo, player.yvelo)
end--]]
