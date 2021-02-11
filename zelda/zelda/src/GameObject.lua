--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameObject = Class{}

function GameObject:init(def, x, y)
    
    -- string identifying this object type
    self.type = def.type

    self.texture = def.texture
    self.frame = def.frame or 1

    -- whether it acts as an obstacle or not
    self.solid = def.solid

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height

    -- default empty collision callback
    self.onCollide = function() end

    -- consuming objects
    self.consumable = def.consumable or false
    self.onConsume = def.onConsume
end

function GameObject:update(dt)

end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
    -- takes place when self.frame is not defined in the game_object.lua
    local frame
    if self.states == nil then
        frame = self.frame
    else
        frame = self.states[self.state].frame
    end

    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][frame], self.x + adjacentOffsetX, self.y + adjacentOffsetY)
end