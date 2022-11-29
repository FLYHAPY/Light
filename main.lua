require "player"
require "repair_kit"
require "platform"
require "enemies"
require "vector2"

local STI = require("sti")
local player
local repairKits -- Renamed to plural to make it clear its multiple repair kits (aka an array)
local level1
local enemie1
local attack

function love.load() 
    World = love.physics.newWorld(0,0)
    World:setCallbacks(BeginContact, EndContact)
    

    
    player = Player_load(World)

    level1 = {}
    level1[1] = CreatePlatform(World, 400, 575, 700, 50)
    level1[2] = CreatePlatform(World, 400, 420, 100, 30)
    level1[3] = CreatePlatform(World, 1200, 575, 600, 50)

    repairKits = {}
    repairKits[1] = Createkit(World, 500, 400, 50, 50)
    repairKits[2] = Createkit(World, 700, 400, 20, 20)

    enemie1 = {}
    enemie1[1] = Load_Enemie1(World, 1200, 350)

    attack = LoadAttack(World, player)

end

function love.draw()
    local playerposition = vector2.new(player.body:getPosition())
    love.graphics.push()
    love.graphics.translate(-playerposition.x  + 380, 0)
    
    DrawPlayer(player)

    DrawLevel(level1)
    DrawRepairKits(repairKits)
    Drawenemie1(enemie1)
    DrawAttack(attack)
    love.graphics.pop()


end


function love.update(dt)
    World:update(dt)
    UpdatePlayer(player, dt)
    

    -- Update All Repair Kits
    for i = 1, #repairKits, 1 do
        if CanDestroyRepairKit(repairKits[i]) then
            DestroyRepairKitBody(repairKits[i])
            repairKits[i] = nil
        end
    end

    --io.write(player.health)
end

function BeginContact(a, b, collision)

	-- Do Kit Collision Check And Reaction
	if (IsPlayerCollidingWithRepairKit(a, b)) then
		--io.write ("\n"..a:getUserData().." colliding with "..b:getUserData().."\n")

		local kitFixture
		if a:getUserData() == "kit" then
			kitFixture = a 
		else kitFixture = b end
		
		local repairKit = FindRepairKitFromBody( kitFixture )
		
		if repairKit == nil then
			io.write("\nFailed To Find The Repair Kit! Did you forget to clean up the body/fixutre?") 
			return 
		end
		
		Repairkit_contact(a, b, collision, repairKit, player)

	end

    -- collision of enemy
    
    if IsPlayerCollidingWithEnemy(a, b) then
        AttackPlayer(a, b, collision, enemie1, player)
    end

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
 end


function love.keypressed(key)
    UpdateAttack(key, attack)
end

--repairkit

function IsPlayerCollidingWithRepairKit(bodyA, bodyB)

	return (bodyA:getUserData() == "kit" and bodyB:getUserData().tag == "player") or (bodyA:getUserData().tag == "player" and bodyB:getUserData() == "kit")

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

	return (bodyA:getUserData() == "enemie1" and bodyB:getUserData().tag == "player") or (bodyA:getUserData().tag == "player" and bodyB:getUserData() == "enemie1")

end