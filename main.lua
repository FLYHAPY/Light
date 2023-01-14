require "player"
require "repair_kit"
require "platform"
require "enemies"
require "vector2"
require "spikes"
require "key"
require "door"
require "Gaim"

local mainMenu
local sti = require "sti"
local player
local repairKits -- Renamed to plural to make it clear its multiple repair kits (aka an array)
local level1
local enemy1
local attack
local spikes
local key
local door

function love.load() 
    mainMenu = LoadMAINMenu()
        
    World = love.physics.newWorld(0,0)
    World:setCallbacks(BeginContact, EndContact)
    level1 = sti("assets/Level/Level1.lua", {"box2d"})
    level1 :box2d_init(World)
    
    player = Player_load(World, 400, 700)


    attack = LoadAttack(World, player)




    door = Createdoor(World, -500, 300, 100, 100)
    


    --[[level1 = {}
    level1[1] = CreatePlatform(World, 0, 600, 2000, 50)
    level1[2] = CreatePlatform(World, -900, 560, 30, 80)
    level1[3] = CreatePlatform(World, -800, 550, 30, 130)
    level1[4] = CreatePlatform(World, -700, 520, 30, 200)
    level1[5] = CreatePlatform(World, -300, 580, 30, 20)
    level1[6] = CreatePlatform(World, 100, 580, 30, 20)
    level1[7] = CreatePlatform(World, 500, 580, 30, 20)--]]
    repairKits = {}
    enemy1 = {}
    spikes = {}
    key = {}

    if  mainMenu.game_state == "menu" then 
          key = Createkey(World, 200, 500, 20, 20) 
    end
    


end

function love.draw()
    
    
    
    if mainMenu.game_state == 'menu' then
        Draw_menu(mainMenu)
    
        elseif mainMenu.game_state == 'how-to-play' then
            Draw_how_to_play(mainMenu)
        elseif mainMenu.game_state == 'paused' then
            Draw_pause(mainMenu)
    
      elseif mainMenu.game_state == 'game' then
        local playerposition = vector2.new(player.body:getPosition())
        DrawPlayer(player)
        love.graphics.setColor(1, 1, 1)
        level1:draw((-playerposition.x + 380) , (-playerposition.y + 620))
        
        
        
        
        
        love.graphics.push()
        love.graphics.translate(-playerposition.x  + 380, -playerposition.y + 620)

            Drawdoor(door, player)
            DrawLevel(level1)
            DrawRepairKits(repairKits)
            DrawEnemy(enemy1)
            DrawAttack(attack, player)
            Drawspikes(spikes)
            Drawkey(key)
        
        love.graphics.pop()
    
        love.graphics.setColor(0.5, 0.5, 0) 
        love.graphics.print("Health:".. player.health, 10, 10, 0, 1.5, 1.5)
        love.graphics.setColor(1, 1, 1) 
        love.graphics.print("SSM Gauge: "..player.SSM, 10, 28, 0, 1.5, 1.5)
        love.graphics.print("SSM Gauge Timer: "..math.floor(player.SSMtimer), 10, 45, 0, 1.5, 1.5)
        love.graphics.setDefaultFilter("nearest")
    
        if player.died == true then
            love.graphics.setColor(1, 1, 1) 
            love.graphics.print("Game Over", 500, 300, 0, 1.5, 1.5)
        end
    
        if player.canopendoor == true then
            love.graphics.print("Key Colected", 1000, 20, 0, 1.5, 1.5)
        end
    
    end
end


function love.update(dt)

    LoadGame(mainMenu, player, level1, repairKits, enemy1, attack, spikes, key, door, dt)   
    DestroyGame(mainMenu, player, level1, repairKits, enemy1, attack, spikes, key, door)
    UpdateMenu(mainMenu)

if mainMenu.game_state == 'game' then 
    if player.died ==  false then
    World:update(dt)
    level1:update(dt)
    UpdatePlayer(player, dt)
    UpdateEnemy(enemy1, dt)
    UpdateAttack(attack, player, dt)
    UpdateSSM(player, attack)
   
    -- Update All Repair Kits
    for i = 1, #repairKits, 1 do
        if CanDestroyRepairKit(repairKits[i]) then
            DestroyRepairKitBody(repairKits[i])
            --repairKits[i] = nil
            --table.remove(repairKits, i)
        end
    end

    for i = 1, #enemy1, 1 do
        if CanDestroyEnemy(enemy1[i]) and enemy1[i].health <= 0 then
            DestroyEnemyBody(enemy1[i], player)
            --enemy1[i] = nil
            --table.remove(enemy1, i)
        end
    end
    for i = 1, #key, 1 do
        if CanDestroykey(key[i]) then
            DestroykeyBody(key[i])
        end
    end
end


    

    local playerposition = vector2.new(player.body:getPosition())
    if player.restart == true then
        player.died = false
        player.health = 10
        playerposition.x = -1000 
        playerposition.y = 40
        player.SSM = 0 
    end

    if player.died == true then
        player.body:setLinearVelocity(0, 0)
    end
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

    --collision key
    
    if (IsPlayerCollidingWithkey(a, b)) then
		--io.write ("\n"..a:getUserData().." colliding with "..b:getUserData().."\n")

		local keyFixture
		if a:getUserData().tag == "key" then
			keyFixture = a 
		else keyFixture = b end
		
		local key = FindkeyFromBody(keyFixture)
		
		Key_contact(a, b, collision, key, player)

	end

    --collision with spikes

    SpikeAttack(a, b, collision, player)
    
    -- collision of enemy
    
    if IsPlayerCollidingWithEnemy(a, b) then
        AttackPlayer(a, b, collision, enemy1, player)
    end

    BeginContactEnemy(a, b, collision)


    BeginContactdoor(a, b, collision, door, player, key)

    BeginContactPlayer(a, b, collision, player)
end

function EndContact(fixtureA, fixtureB, contact)
    if (fixtureA:getUserData().tag == "player" and 
       fixtureB:getUserData().tag == "platform") or 
       (fixtureA:getUserData().tag == "platform" and 
       fixtureB:getUserData().tag == "player") then
        player.onground = false
        player.damaged = false
        player.collisionnormal = vector2.new(0, 0)
    end
end

function love.keyreleased(key)
    if mainMenu.game_state == "game" then
    
    KeyReleasedPlayer(key, player)
    AttackReellease(key, attack, player)
    if key == 'r' then
        player.restart = false
    end
    end
end


function love.keypressed(key)


    if mainMenu.game_state == 'menu' then
        Menu_keypressed(key, mainMenu)
        
    
      elseif mainMenu.game_state == 'how-to-play' then
        How_to_play_keypressed(key, mainMenu)
    
      elseif  mainMenu.game_state == 'game' then
        Game_keypressed(key, mainMenu)
        if key == 'f' then
            StartAttack(attack, player)
        end
        KeyPressedSSM(key, player, attack)
        if key == "r" and player.died == true then
            player.restart = true
        end
    
      elseif  mainMenu.game_state == 'paused' then
        Pause_keypressed(key, mainMenu)
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

--key

function IsPlayerCollidingWithkey(bodyA, bodyB)

return (bodyA:getUserData().tag == "key" and bodyB:getUserData().tag == "player") or (bodyA:getUserData().tag == "player" and bodyB:getUserData().tag == "key")

end

function FindkeyFromBody(Fixture)

for i = 1, #key, 1 do
    
    if key[i] ~= nil and key[i].fixture == Fixture then
        return key[i]
    end

end

return nil

end

function FinddestroyedenemyFromBody()

    for i = 1, #key, 1 do
        
        if enemy1[i].body == nil then
            return key[i]
        end
    
    end
    
    return nil
    
    end