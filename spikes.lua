function Createspikes(world, x, y, width, height)
    local spikes = {}
    spikes.body = love.physics.newBody(world, x, y, "static")
    spikes.shape = love.physics.newRectangleShape(width, height)
    spikes.fixture = love.physics.newFixture(spikes.body, spikes.shape, 1)
    spikes.tag = "spikes"
    spikes.fixture:setUserData(spikes)
    spikes.sprite = love.graphics.newImage("assets/.png/Spike.png")
    return spikes
end

function Drawspikes(spikes)
    love.graphics.setColor(1, 1, 1)
    for i = 1, #spikes, 1 do
        local spikesposition = vector2.new(spikes[i].body:getPosition())
        love.graphics.draw(spikes[i].sprite, spikesposition.x - 32, spikesposition.y - 32)
    end
end

function SpikeAttack(fixtureA, fixtureB, contact, player)
    if (fixtureA:getUserData().tag == "player" and fixtureB:getUserData().tag == "spikes") or (fixtureA:getUserData().tag == "spikes" and fixtureB:getUserData().tag == "player") then
        local normal = vector2.new(contact:getNormal())
        if normal.y == 1 then
            player.health = player.health - 1
            love.audio.play(player.damagedsound)
            local spikeforce = vector2.new(0, -2000)
            player.body:setLinearVelocity(0, 0)
            player.spikedamage = true
            player.body:applyLinearImpulse(spikeforce.x, spikeforce.y)
        end
    end
end