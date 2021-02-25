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

-- SPECIFICATION: Heart consuming
    -- consuming objects
    self.consumable = def.consumable or false
    self.onConsume = def.onConsume

-- SPECIFICATION: pot projectile
    self.projecting = false
end

function GameObject:update(dt)

end

function GameObject:collides(target)
    return not (self.x + self.width < target.x or self.x > target.x + target.width or
                self.y + self.height < target.y or self.y > target.y + target.height)
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