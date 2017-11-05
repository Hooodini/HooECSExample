local Physics = Component.create("Physics")

function Physics:initialize(body, shape)
    self.body = body
    self.shape = shape
    self.fixture = love.physics.newFixture(body, shape)
end

return Physics