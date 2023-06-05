require "player"
require "repair_kit"
require "platform"
require "enemies"
require "vector2"
require "spikes"
require "key"
require "door"
require "Gaim"
require "ui"
require "generator"

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
local ui
local generator

function love.load() 
    mainMenu = LoadMAINMenu()
        
    World = love.physics.newWorld(0,0)
    World:setCallbacks(BeginContact, EndContact)
    level1 = sti("assets/Level/Level1.lua", {"box2d"})
    level1 :box2d_init(World)
    
    player = Player_load(World, 400, 700)


    attack = LoadAttack(World, player)

    generator = Creategenerator(World, 7552, 608, 128, 64)

    ui = LoadUI()





    door = {}
    door[1] = Createdoor(World, 4704, 576, 64, 128)
    


    repairKits = {}
    repairKits[1] = Createkit(World, 0, 0, 64, 64)
    repairKits[2] = Createkit(World, 0, 0, 64, 64)
    repairKits[3] = Createkit(World, 0, 0, 64, 64)
    repairKits[4] = Createkit(World, 0, 0, 64, 64)
    
    enemy1 = {}
    enemy1[1] = Load_enemy(World, 0, 0)
    enemy1[2] = Load_enemy(World, 0, 0)
    enemy1[3] = Load_enemy(World, 0, 0)
    enemy1[4] = Load_enemy(World, 0, 0)
    enemy1[5] = Load_enemy(World, 0, 0)
    enemy1[6] = Load_enemy(World, 0, 0)
    enemy1[7] = Load_enemy(World, 0, 0)
    enemy1[8] = Load_enemy(World, 0, 0)
    enemy1[9] = Load_enemy(World, 0, 0)
    enemy1[10] = Load_enemy(World, 0, 0)
    enemy1[11] = Load_enemy(World, 0, 0)
    

    
    spikes = {}
    --5696, 1344
    spikes[1] = Createspikes(World, 2336, 1952, 64, 64)
    spikes[2] = Createspikes(World, 2400, 1952, 64, 64)
    spikes[3] = Createspikes(World, 2464, 1952, 64, 64)
    spikes[4] = Createspikes(World, 2528, 1952, 64, 64)
    spikes[5] = Createspikes(World, 2592, 1952, 64, 64)
    spikes[6] = Createspikes(World, 5728, 1376, 64, 64)
    spikes[7] = Createspikes(World, 5792, 1376, 64, 64)
    spikes[8] = Createspikes(World, 5856, 1376, 64, 64)
    spikes[9] = Createspikes(World, 5920, 1376, 64, 64)
    spikes[10] = Createspikes(World, 5984, 1376, 64, 64)
    spikes[11] = Createspikes(World, 6048, 1376, 64, 64)
    spikes[12] = Createspikes(World, 6112, 1376, 64, 64)
    spikes[13] = Createspikes(World, 6176, 1376, 64, 64)
    spikes[14] = Createspikes(World, 6240, 1376, 64, 64)
    spikes[15] = Createspikes(World, 6304, 1376, 64, 64)
    spikes[16] = Createspikes(World, 6368, 1376, 64, 64)
    spikes[17] = Createspikes(World, 6432, 1376, 64, 64)
    spikes[18] = Createspikes(World, 6496, 1376, 64, 64)
    spikes[19] = Createspikes(World, 6560, 1376, 64, 64)


    
    key = {}
    key[1] = Createkey(World, 5280, 2016, 64, 64) 

    


end

function love.draw()
    
    
    if mainMenu.game_state == 'menu' then
        Draw_menu(mainMenu)
    
        elseif mainMenu.game_state == 'how-to-play' then
            Draw_how_to_play(mainMenu)
        elseif mainMenu.game_state == 'paused' then
            Draw_pause(mainMenu)
        elseif mainMenu.game_state == "lose" then
            DrawLose(mainMenu)
        elseif mainMenu.game_state == "win" then
            DrawWin(mainMenu)
    
      elseif mainMenu.game_state == 'game' then
        
        love.graphics.draw(mainMenu.gameback)
        local playerposition = vector2.new(player.body:getPosition())
        DrawPlayer(player)
        love.graphics.setColor(1, 1, 1)
        level1:draw((-playerposition.x + 380) , (-playerposition.y + 620))
        
        
        
        
        
        love.graphics.push()
        love.graphics.translate(-playerposition.x  + 380, -playerposition.y + 620)

            Drawdoor(door)
            DrawLevel(level1)
            DrawRepairKits(repairKits)
            DrawEnemy(enemy1)
            DrawAttack(attack, player)
            Drawspikes(spikes)
            Drawkey(key)
            DrawGenerator(generator)
        
        love.graphics.pop()
        DrawUI(player, ui)

    
    end
end


function love.update(dt)

    LoadGame(mainMenu, player, level1, repairKits, enemy1, attack, spikes, key, door, dt)   
    DestroyGame(mainMenu, player, level1, repairKits, enemy1, attack, spikes, key, door)
    UpdateMenu(mainMenu, dt)

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
    for i = 1, #door, 1 do
        if CanDestroydoor(door[i], player) then
            DestroydoorBody(door[i], player)
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
    if player.died == true then
        mainMenu.game_state = "lose"
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

     --collision door
    
    if (IsPlayerCollidingWithdoor(a, b)) then
       --io.write ("\n"..a:getUserData().." colliding with "..b:getUserData().."\n")
    
        local doorFixture
        if a:getUserData().tag == "key" then
            doorFixture = a 
        else doorFixture = b end
            
        local door = FinddoorFromBody(doorFixture)
            
        Door_contact(a, b, collision, door, player)
    
    end

    --collision with spikes

    SpikeAttack(a, b, collision, player)
    
    -- collision of enemy
    
    if IsPlayerCollidingWithEnemy(a, b) then
        AttackPlayer(a, b, collision, enemy1, player)
    end

    --BeginContactEnemy(a, b, collision)


    BeginContactGenerator(a, b, mainMenu)
end

function EndContact(fixtureA, fixtureB, contact)
    if (fixtureA:getUserData().tag == "player" and 
       fixtureB:getUserData().tag == "enemy") or 
       (fixtureA:getUserData().tag == "enemy" and 
       fixtureB:getUserData().tag == "player") then
        player.damaged = false
        player.timer = 0
    end
    if (fixtureA:getUserData().tag == "player" and 
       fixtureB:getUserData().tag == "door") or 
       (fixtureA:getUserData().tag == "door" and 
       fixtureB:getUserData().tag == "player") then
        player.contactdoor = false
        io.write("yes")
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
    
      elseif  mainMenu.game_state == 'paused' then
        Pause_keypressed(key, mainMenu)
    
    elseif  mainMenu.game_state == 'lose' then
        Lose_keypressed(key, mainMenu)
    elseif  mainMenu.game_state == 'win' then
        Win_keypressed(key, mainMenu)
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

--door

function IsPlayerCollidingWithdoor(bodyA, bodyB)

    return (bodyA:getUserData().tag == "door" and bodyB:getUserData().tag == "player") or (bodyA:getUserData().tag == "player" and bodyB:getUserData().tag == "door")
    
end
    
function FinddoorFromBody(Fixture)
    
    for i = 1, #door, 1 do
        
        if door[i] ~= nil and door[i].fixture == Fixture then
            return door[i]
        end
    
    end
    
    return nil
    
end