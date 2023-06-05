function Creategenerator(world, x, y, width, height)
    local generator = {}
    generator.body = love.physics.newBody(world, x, y, "static")
    generator.shape = love.physics.newRectangleShape(width, height)
    generator.fixture = love.physics.newFixture(generator.body, generator.shape, 1)
    generator.tag = "generator"
    generator.fixture:setUserData(generator)
    generator.fixture:setSensor(false)
    generator.sprite = love.graphics.newImage("assets/.png/GeneratorSprite.png")
    return generator
end

function BeginContactGenerator(fixtureA, fixtureB, mainMenu)
    if (fixtureA:getUserData().tag == "player" and fixtureB:getUserData().tag == "generator") or (fixtureA:getUserData().tag == "generator" and fixtureB:getUserData().tag == "player") then
        mainMenu.game_state = 'win'
    end
end

function DrawGenerator(generator)
    local generatorlocation = vector2.new(generator.body:getPosition())
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(generator.sprite, generatorlocation.x - 64, generatorlocation.y - 32)
end