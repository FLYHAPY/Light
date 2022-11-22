function Player_load(World)
    local player = {}
    player.x = 150
    player.y = 0
    player.width = 20
    player.height = 60
    player.xvelo = 0
    player.yvelo = 0
    player.maxspeed = 200
    player.acelaration = 4000
    player.friction = 3500
    player.gravity = 1500
    player.grounded = false
    player.totaljump = -700
    player.totaldash = 800
    player.dashduration = 0.25
    player.dashtimer = 0
    player.dir = 1
    player.isdash = false
    player.health = 2
    
    player.body = love.physics.newBody(World, player.x, player.y, "dynamic")
    player.body:setFixedRotation(true)
    player.shape = love.physics.newRectangleShape(player.width, player.height)
    player.fixture = love.physics.newFixture(player.body, player.shape)
    player.fixture:setUserData("player")
    return player
end

function Player_update(player, dt)
    Player_syncPhysics(player)
    Player_move(player, dt)
    Player_applygravity(player, dt)
    Player_dashagain(player, dt)
    --io.write(player.health)     
end

function Player_move(player, dt)
    if love.keyboard.isDown("d", "right") and player.dashtimer <= 0 then
        if player.xvelo < player.maxspeed then
            if  player.xvelo + player.acelaration * dt < player.maxspeed then
                player.xvelo = player.xvelo + player.acelaration * dt
                player.dir = 1
            else
                player.xvelo = player.maxspeed
                player.dir = 1
            end
        end
    elseif love.keyboard.isDown("a", "left") and player.dashtimer <= 0 then
        if player.xvelo > - player.maxspeed then
            if  player.xvelo - player.acelaration * dt > player.maxspeed then
                player.xvelo = player.xvelo - player.acelaration * dt
                player.dir = 0
            else
                player.xvelo = - player.maxspeed
                player.dir = 0
            end
        end
    else
        Player_applyfriction(player, dt)
    end
end

function Player_applyfriction(player, dt)
    if player.xvelo > 0 then
        if player.xvelo - player.friction * dt > 0 then
            player.xvelo = player.xvelo - player.friction * dt
        else    
            player.xvelo = 0
        end
    elseif player.xvelo < 0 then
        if player.xvelo + player.friction * dt < 0 then
            player.xvelo = player.xvelo + player.friction * dt
        else
            player.xvelo = 0
        end
    end    
end

function Player_applygravity(player, dt)
    if not player.grounded then
        player.yvelo = player.yvelo + player.gravity * dt
    end
end

function Player_syncPhysics(player)
    player.x, player.y = player.body:getPosition()
    player.body:setLinearVelocity(player.xvelo, player.yvelo)
end

function Player_beginContact(a, b, collision, player)
    if player.grounded == true then return end
    local nx, ny = collision:getNormal()
    if a:getUserData("player") then
        if ny > 0 then
            Player_land(player, collision)
        end
    elseif b:getUserData("player") then
        if ny < 0 then
            Player_land(player, collision)
        end
    end
end

function Player_land(player, collision)
    player.currentGroundColision = collision
    player.yvelo = 0
    player.grounded = true
end

function Player_jump(key, player)
    if key == "space" and player.grounded then
        player.yvelo = player.totaljump
        player.grounded = false
    end
end

function Player_endContact(a, b, collision, player)
    if a == player.fixture or b == player.fixture then
        if player.currentGroundColision == collision then
            player.grounded = false
        end
    end
end

function Player_draw(player)
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle("fill", player.x - player.width / 2, player.y - player.height / 2, player.width, player.height)
end


function Player_dash(key, player)
    if key == "q" then
        if player.dir == 1  and player.dashtimer <= 0  and player.isdash == false then
            player.isdash = true
            player.xvelo = player.totaldash
            player.dashtimer = player.dashduration
        end
    end

    if key == "q" then
        if player.dir == 0  and player.dashtimer <= 0  and player.isdash == false then 
            player.isdash = true
            player.xvelo = -player.totaldash
            player.dashtimer = player.dashduration
        end
    end
end

function Player_dashagain(player, dt)
    if player.dashtimer > 0 then
        player.dashtimer = player.dashtimer - dt
        player.isdash = false
    end
end