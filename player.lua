local IDLE, JUMP, RUN, DASH, IDLESSM, JUMPSSM, RUNSSM, DASHSSM = 1, 2, 3 , 4, 5, 6, 7, 8
function Player_load(World, x, y)
        local player = {}
        player.body = love.physics.newBody(World, x, y, "dynamic")
        player.shape = love.physics.newRectangleShape(50, 64)
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
        player.frame = 1
        player.frametimer = 0
        player.framerate = 0.1
        player.animation = IDLE
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
        player.keycollected = false
        player.damaged = false
        player.timer = 0
        player.spikedamage = false
        player.stamina = 10
        player.staminabarEmpty = false
        player.staminanot = false
        player.spritesheet = love.graphics.newImage("assets/.png/C-37 spritesheet.png")
        player.quads = CreateSpriteSheetQuads(player.spritesheet, 4, 8)
        player.contactdoor = false
        player.jumpsound = love.audio.newSource("assets/.mp3/Jump2.wav","stream")
        player.attacksound = love.audio.newSource("assets/.mp3/Attack.wav","stream")
        player.damagedsound = love.audio.newSource("assets/.mp3/Hurt.wav","stream")
        player.SSMsound = love.audio.newSource("assets/.mp3/SSM.wav","stream")
        player.PickUpsound = love.audio.newSource("assets/.mp3/Pickup_Kit.wav","stream")
        player.dashsound = love.audio.newSource("assets/.mp3/Dash.wav","stream")
        return player
end

function CreateSpriteSheetQuads(spritesheet, cols, rows)
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

function AnimatePlayer(player, animation, dt)
    if player.animation ~= animation then
        player.animation = animation
        player.frametimer = 1
    end
    player.frametimer = player.frametimer + dt
    if player.frametimer > player.framerate then
        player.frametimer = 0     
        player.frame = player.frame + 1   
        if player.animation == RUN then            
            if player.frame < 1 or player.frame > 4 then
                player.frame = 1
            end
        elseif player.animation == JUMP then
            if player.frame < 13 or player.frame > 16 then
                player.frame = 13
            end
        elseif player.animation == IDLE then
            if player.frame < 5 or player.frame > 8 then
                player.frame = 5
            end
        elseif player.animation == DASH then
            if player.frame < 9 or player.frame > 12 then
                player.frame = 9
            end
        elseif player.animation == DASHSSM then
            if player.frame < 25 or player.frame > 28 then
                player.frame = 25
            end
        elseif player.animation == RUNSSM then
            if player.frame < 17 or player.frame > 20 then
                player.frame = 17
            end
        elseif player.animation == IDLESSM then
            if player.frame < 21 or player.frame > 24 then
                player.frame = 21
            end
        elseif player.animation == JUMPSSM then
            if player.frame < 29 or player.frame > 32 then
                player.frame = 29
            end
        end
    end
end

function UpdatePlayer(player, dt)
    
        local playergravity = vector2.new(0, 5500)
        player.body:applyForce(playergravity.x, playergravity.y)
        local playervelocity = vector2.new(player.body:getLinearVelocity())

    if love.keyboard.isDown("right") and player.collisionnormal.x ~= 1 then
        player.body:setLinearVelocity(300, playervelocity.y)
        player.dir = 1
        if player.onground and player.SSMact == false then
            AnimatePlayer(player, RUN, dt)
        elseif player.onground == false and player.SSMact == false then            
            AnimatePlayer(player, JUMP, dt)
        elseif player.onground and player.SSMact == true then
            AnimatePlayer(player, RUNSSM, dt)
        elseif  player.onground == false and player.SSMact == true then
            AnimatePlayer(player, JUMPSSM, dt)
        end
        
    elseif love.keyboard.isDown("left") and player.collisionnormal.x ~= -1 then
        player.body:setLinearVelocity(-300, playervelocity.y)
        player.dir = -1
        if player.onground and player.SSMact == false then
            AnimatePlayer(player, RUN, dt)
        elseif player.onground == false and player.SSMact == false then            
            AnimatePlayer(player, JUMP, dt)
        elseif player.onground and player.SSMact == true then
            AnimatePlayer(player, RUNSSM, dt)
        elseif  player.onground == false and player.SSMact == true then
            AnimatePlayer(player, JUMPSSM, dt)
        end
    else        
        player.body:setLinearVelocity(0, playervelocity.y)
        if player.SSMact == false then
            AnimatePlayer(player, IDLE, dt)
        elseif  player.SSMact == true then
            AnimatePlayer(player, IDLESSM, dt)
        end
    end

    if love.keyboard.isDown("space") and player.jumped == false and player.onground == true and player.spikedamage == false then
        local jumpForce = vector2.new(0, -3500)
        player.body:applyLinearImpulse(jumpForce.x, jumpForce.y)
        player.jumped = true
        love.audio.play(player.jumpsound)
    end

    if love.keyboard.isDown("q") and player.dashtimer < 0.25 and player.candash == true  and player.dir == 1 and player.staminanot == false then
        local dashforce = vector2.new(4500, 0)
        player.body:applyLinearImpulse(dashforce.x, dashforce.y)
        player.isdash = true
        love.audio.play(player.dashsound)
        if player.isdash == true and player.SSMact == false  then
            AnimatePlayer(player, DASH, dt)
        elseif  player.isdash == true and player.SSMact == true then
            AnimatePlayer(player, DASHSSM, dt)
        end
    end

    if love.keyboard.isDown("q") and player.dashtimer < 0.25  and player.candash == true and player.dir == -1 and player.staminanot == false then
        local dashforce = vector2.new(-4500, 0)
        player.body:applyLinearImpulse(dashforce.x, dashforce.y)
        player.isdash = true
        love.audio.play(player.dashsound)
        if player.isdash == true and player.SSMact == false  then
            AnimatePlayer(player, DASH, dt)
        elseif  player.isdash == true and player.SSMact == true then
            AnimatePlayer(player, DASHSSM, dt)
        end
    end

    if player.isdash == true then
        player.dashtimer = player.dashtimer + dt
    end

    if player.dashtimer >= 0.25 then
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
                        player.spikedamage = false
                    end                 
                    player.collisionnormal = vector2.new(normal.x, normal.y)
                end
            elseif (categoryA == 2 and categoryB == 1) then
                local normal = vector2.new(contacts[i]:getNormal())
                if vector2.magnitude(normal) == 1 then
                    if normal.y == -1 then
                        player.onground = true
                        player.spikedamage = false
                    end
                    player.collisionnormal = vector2.new(-normal.x, -normal.y)
                end
            end
        end
    end

    --SSM
    
    if love.keyboard.isDown("0") and player.SSM <= 10 then
        player.SSM = player.SSM + 1
        player.stamina = 10
        player.health = 25
    end

    if player.SSM >= 10 then
        player.SSM = 10
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

    if player.damaged == true then
        player.timer = player.timer + dt
    end

    if player.timer >= 1 then
        player.health = player.health - 4
        player.timer = 0
        love.audio.play(player.damagedsound)
    end

    if player.stamina <= 0 then
        player.staminanot = true
        player.stamina = 0
    end

    if player.staminanot == true then
        player.stamina = player.stamina + dt
    end
    
    if player.stamina >= 10 then
        player.staminanot = false
        player.stamina = 10
    end
    if player.health >= 25 then
        player.health = 25
    end
end


function KeyPressedSSM(key, player, attack)
    if key == "e" and player.SSM >= 10 and player.SSMtimer >= 20 then
        love.audio.play(player.SSMsound)
       player.SSMact = true
       attack.damage = attack.damage * 3
       player.health = player.health * 2
    end
end


 function DrawPlayer(player)
    love.graphics.setColor(1, 1, 1)
    local playerposition = vector2.new(player.body:getPosition())
    local offset = 0    
    if player.dir == -1 then
        offset = 53
    end    
    love.graphics.draw(player.spritesheet, player.quads[player.frame], 380 - 25 + offset,  620 - 45 , 0, 1 * player.dir, 1)
 end

function KeyReleasedPlayer(key, player)
     if key == "space" then
         player.jumped = false
     end
     if key == "q"  and player.staminanot == false then
        player.dashtimer = 0
        player.stamina = player.stamina- 2
        player.isdash = false
     end
     if key == "f"  and player.staminanot == false then
        player.stamina = player.stamina - 2
        love.audio.stop(player.attacksound)
     end
 end
 

function LoadAttack(World, player)
    local attack = {}
    attack.body = love.physics.newBody(World, player.body:getX(), player.body:getY(), "kinematic")
    attack.body:setFixedRotation(true)
    attack.body:setActive(false)
    attack.shape = love.physics.newRectangleShape(64, 32)
    attack.fixture = love.physics.newFixture(attack.body, attack.shape)
    attack.fixture:setUserData(attack)
    attack.tag = "attack"
    attack.fixture:setSensor(true)
    attack.timer = 0
    attack.duration = 0.50
    attack.damage = 4
    attack.disappear = false
    attack.spritesheet = love.graphics.newImage("assets/.png/swordsprite.png")
    return attack
end

function DrawAttack(attack, player)
    if player.attacks == true  and player.dir == 1 then
        local attackposition = vector2.new(attack.body:getPosition())
        love.graphics.draw(attack.spritesheet, attackposition.x - 32, attackposition.y - 16  )
    elseif player.attacks == true  and player.dir == -1 then
        local attackposition = vector2.new(attack.body:getPosition())
        love.graphics.draw(attack.spritesheet, attackposition.x + 32, attackposition.y + 16, math.rad(180))
    end
end

function StartAttack(attack, player)
    if player.died == true then return end
    
    if attack.timer <= 0.25 and player.staminanot == false then
        player.attacks = true
        attack.body:setActive(true)
    end
end

function UpdateAttack(attack, player, dt)
    if player.died == true then return end
    local posx, posy = player.body:getPosition()
    if player.dir == 1 then
        posx = posx + 30
    else
        posx = posx - 30
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
    if key == "f"  and player.staminanot == false then
        attack.timer = 0
        player.attacks = false
        attack.body:setActive(false)
        love.audio.play(player.attacksound)
    end
end

function UpdateSSM(player, attack)
    if player.SSMfinished == true then
        attack.damage = 4
        player.health = player.health / 2
        player.SSMfinished = false
    end
end

