function Createspikes(world, x, y, width, height)
    local spikes = {}
    spikes.body = love.physics.newBody(world, x, y, "static")
    spikes.shape = love.physics.newRectangleShape(width, height)
    spikes.fixture = love.physics.newFixture(spikes.body, spikes.shape, 1)
    spikes.tag = "spikes"
    spikes.fixture:setUserData(spikes)
    return spikes
end

function Drawspikes(spikes)
    love.graphics.setColor(1, 0, 1)
    for i = 1, #spikes, 1 do
        love.graphics.polygon("fill", spikes[i].body:getWorldPoints(spikes[i].shape:getPoints()))
    end
end

function SpikeAttack(fixtureA, fixtureB, contact, player)
    if (fixtureA:getUserData().tag == "player" and fixtureB:getUserData().tag == "spikes") or (fixtureA:getUserData().tag == "spikes" and fixtureB:getUserData().tag == "player") then
        local normal = vector2.new(contact:getNormal())
        if normal.y == 1 then
            player.health = player.health - 1
            local dashforce = vector2.new(0, -2500)
            player.body:applyLinearImpulse(dashforce.x, dashforce.y)
        end
    end
end