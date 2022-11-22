require "player"
require "repair_kit"
require "platform"
require "enemies"

local STI = require("sti")
local player
local repairKit
local level1
local enemie1

function love.load() 
    World = love.physics.newWorld(0,0)
    World:setCallbacks(BeginContact, EndContact)
    

    
    player = Player_load(World)

    level1 = {}
    level1[1] = CreatePlatform(World, 400, 575, 700, 50)
    level1[2] = CreatePlatform(World, 400, 420, 100, 30)
    level1[3] = CreatePlatform(World, 1200, 575, 600, 50)

    repairKit = {}
    repairKit[1] = Createkit(World, 500, 400, 50, 50)
    repairKit[2] = Createkit(World, 700, 400, 20, 20)

    enemie1 = {}
    enemie1[1] = Load_Enemie1(World, 1200, 350)

end

function love.draw()
    love.graphics.push()
    love.graphics.translate(-player.x + 380, 0)
    
    Player_draw(player)

    DrawLevel(level1)
    DrawRepairKit(repairKit)
    Drawenemie1(enemie1)
    love.graphics.pop()


end


function love.update(dt)
    World:update(dt)
    Player_update(player, dt)
    CheckRemove_Kit(repairKit)
    io.write(player.health)
end

function BeginContact(a, b, collision)
	if Repairkit_contact(a, b, collision, repairKit, player) then return end
    Player_beginContact(a, b, collision, player)
end

function EndContact(a, b, collision)
	Player_endContact(a, b, collision, player)
end

function love.keypressed(key)
    Player_jump(key, player)
    Player_dash(key, player)
end