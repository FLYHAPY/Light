require "player"
require "repair_kit"
require "platform"
require "enemies"
require "vector2"
require "spikes"

local STI = require("sti")
local player
local repairKits -- Renamed to plural to make it clear its multiple repair kits (aka an array)
local level1
local enemy1
local attack
local spikes

function love.load() 
    World = love.physics.newWorld(0,0)
    World:setCallbacks(BeginContact, EndContact)
    

    
    player = Player_load(World, -1000, 40)

    level1 = {}
    level1[1] = CreatePlatform(World, 0, 600, 2000, 50)
    level1[2] = CreatePlatform(World, -900, 560, 30, 80)
    level1[3] = CreatePlatform(World, -800, 550, 30, 130)
    level1[4] = CreatePlatform(World, -700, 520, 30, 200)
    level1[5] = CreatePlatform(World, -300, 580, 30, 20)
    level1[6] = CreatePlatform(World, 100, 580, 30, 20)
    level1[7] = CreatePlatform(World, 500, 580, 30, 20)


    repairKits = {}
    repairKits[1] = Createkit(World, -300, 560, 20, 20)
    repairKits[2] = Createkit(World, 100, 560, 20, 20)
    repairKits[3] = Createkit(World, 500, 560, 20, 20)

    enemy1 = {}
    enemy1[1] = Load_enemy(World, -300, 350)
    enemy1[2] = Load_enemy(World, 100, 350)
    enemy1[3] = Load_enemy(World, 300, 350)

    attack = LoadAttack(World, player)

    spikes = {}
    spikes[1] = Createspikes(World, -850, 560, 70, 30)
    spikes[2] = Createspikes(World, -750, 560, 70, 30)

end

function love.draw()
    local playerposition = vector2.new(player.body:getPosition())
    love.graphics.push()
    love.graphics.translate(-playerposition.x  + 380, 0)
    
    DrawPlayer(player)

    DrawLevel(level1)
    DrawRepairKits(repairKits)
    DrawEnemy(enemy1)
    DrawAttack(attack, player)
    Drawspikes(spikes)
    love.graphics.pop()

    love.graphics.setColor(0.5, 0.5, 0) 
    love.graphics.print("Health:".. player.health, 10, 10)
    love.graphics.setColor(1, 1, 1) 
    love.graphics.print("SSM Gauge:"..player.SSM, 10, 25)
    love.graphics.print("SSM Gauge Timer:"..math.floor(player.SSMtimer), 10, 40)

    if player.died == true then
        love.graphics.setColor(1, 1, 1) 
        love.graphics.print("game over", 500, 300)
    end
    

end


function love.update(dt)
    World:update(dt)
    
    
    if player.died ==  false then
    UpdatePlayer(player, dt)
    UpdateEnemy(enemy1, dt)
    UpdateAttack(attack, player, dt)
    UpdateSSM(player, attack)

    local playerposition = vector2.new(player.body:getPosition())
    
    if player.restart == true then
        player.died = false
        playerposition.x = 30
        playerposition.y = 40
        player.health = 10 
    end

    -- Update All Repair Kits
    for i = 1, #repairKits, 1 do
        if CanDestroyRepairKit(repairKits[i]) then
            DestroyRepairKitBody(repairKits[i])
            repairKits[i] = nil
            table.remove(repairKits, i)
        end
    end

    for i = 1, #enemy1, 1 do
        if CanDestroyEnemy(enemy1[i]) and enemy1[i].health <= 0 then
            DestroyEnemyBody(enemy1[i], player)
            enemy1[i] = nil
            table.remove(enemy1, i)
        end
    end
end

    
    local playerposition = vector2.new()
    playerposition.x= player.body:getX()
    playerposition.y = player.body:getY()

    if player.restart == true then
        player.died = false
        playerposition.x = 30
        playerposition.y = 40
        player.health = 10
        player.SSM = 0 
    end

end

function BeginContact(a, b, collision)

	-- Do Kit Collision Check And Reaction
	if (IsPlayerCollidingWithRepairKit(a, b)) then
		--io.write ("\n"..a:getUserData().." colliding with "..b:getUserData().."\n")

		local kitFixture
		if a:getUserData().tag == "kit" then
			kitFixture = a 
		else kitFixture = b end
		
		local repairKit = FindRepairKitFromBody( kitFixture )
		
		Repairkit_contact(a, b, collision, repairKit, player)

	end

    --collision of attack
    
    if (IsAttackCollidingEnemy(a, b)) then

		local enemyFixture
		if a:getUserData().tag == "enemy" then
			enemyFixture = a 
		else enemyFixture = b end
		
		local enemy = FindEnemyFromBody( enemyFixture )
		
		Enemy_contact(a, b, collision, enemy, attack)

	end

    --collision with spikes

    SpikeAttack(a, b, collision, player)
    
    -- collision of enemy
    
    if IsPlayerCollidingWithEnemy(a, b) then
        AttackPlayer(a, b, collision, enemy1, player)
    end

    BeginContactEnemy(a, b, collision)

	--if Repairkit_contact(a, b, collision, repairKit, player) then return end
    BeginContactPlayer(a, b, collision, player)
end

function EndContact(fixtureA, fixtureB, contact)
    if (fixtureA:getUserData().tag == "player" and 
       fixtureB:getUserData().tag == "platform") or 
       (fixtureA:getUserData().tag == "platform" and 
       fixtureB:getUserData().tag == "player") then
        player.onground = false
        player.collisionnormal = vector2.new(0, 0)
    end
end

function love.keyreleased(key)
    KeyReleasedPlayer(key, player)
    AttackReellease(key, attack, player)
    if key == 'r' then
        player.restart = false
    end
end


function love.keypressed(key)
    if key == 'f' then
        StartAttack(attack, player)
    end
    KeyPressedSSM(key, player, attack)
    if key == "r" and player.died == true then
        player.restart = true
    end
end

--repairkit

function IsPlayerCollidingWithRepairKit(bodyA, bodyB)

	return (bodyA:getUserData().tag == "kit" and bodyB:getUserData().tag == "player") or (bodyA:getUserData().tag == "player" and bodyB:getUserData().tag == "kit")

end

function FindRepairKitFromBody(Fixture)

	for i = 1, #repairKits, 1 do
		
		if repairKits[i] ~= nil and repairKits[i].fixture == Fixture then
			return repairKits[i]
		end
	
	end

	return nil

end

--enemy


function IsPlayerCollidingWithEnemy(bodyA, bodyB)

	return (bodyA:getUserData().tag == "enemy" and bodyB:getUserData().tag == "player") or (bodyA:getUserData().tag == "player" and bodyB:getUserData().tag == "enemy")

end


--attack


function IsAttackCollidingEnemy(bodyA, bodyB)

	return (bodyA:getUserData().tag == "attack" and bodyB:getUserData().tag == "enemy") or (bodyA:getUserData().tag == "enemy" and bodyB:getUserData().tag == "attack")

end

function FindEnemyFromBody(Fixture)

	for i = 1, #enemy1, 1 do
		
		if enemy1[i] ~= nil and enemy1[i].fixture == Fixture then
			return enemy1[i]
		end
	
	end

	return nil

end