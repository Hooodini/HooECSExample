function love.load()	

	-- Load libs
	HooECS = require "lib.HooECS"
	HooECS.initialize({
        globals = true,
        debug = true
    })

    -- Load components
    Physics = require "components.physicsComponent"

    -- Load systems
    PhysicsRenderingSystem = require("systems.physicsRenderingSystem")

    -- Creating core engine object  
    gameEngine = Engine()
    gameEngine:addSystem(PhysicsRenderingSystem())

    -- Globals setup
    world = love.physics.newWorld(0, 10 * 32)

    -- Create entity
    object = Entity()
    local body = love.physics.newBody(world, 100, 100)
    local shape = love.physics.newCircleShape(32)
    object:add(Physics(body, shape))

    gameEngine:addEntity(object)
end

function love.update(dt)
    world:update(dt)
    gameEngine:update(dt)
end

function love.draw()
    gameEngine:draw()
end