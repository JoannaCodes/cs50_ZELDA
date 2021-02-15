PlayerPotLiftState = Class{__includes = BaseState}

function PlayerPotLiftState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    self.player.offsetY = 5
    self.player.offsetX = 7

    self.player:changeAnimation('lift-pot-' .. self.player.direction)
end


function PlayerPotLiftState:update(dt)
    for k, object in pairs(self.dungeon.currentRoom.objects) do
        if object.type == 'pot' and self.player:collides(object) then
            object.x = self.player.x - (self.player.width / 2)
            object.y = self.player.y - (self.player.height / 2)
        else
            self.player:changeState('idle')
        end
    end


    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeState('pot-idle')
    end

    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('pot-walk')
    end
end

function PlayerPotLiftState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end