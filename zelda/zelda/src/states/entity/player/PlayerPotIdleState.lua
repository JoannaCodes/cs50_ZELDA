PlayerPotIdleState = Class{__includes = BaseState}

function PlayerPotIdleState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    self.player.offsetX = 5
    self.player.offsetY = 7

    local direction = self.player.direction
        if direction == 'left' then
            self.player:changeAnimation('idle-pot-lift-left')
        elseif direction == 'right' then
            self.player:changeAnimation('idle-pot-lift-right')
        elseif direction == 'up' then
            self.player:changeAnimation('idle-pot-lift-up')
        elseif direction == 'down' then
            self.player:changeAnimation('idle-pot-lift-down')
        end
end


function PlayerPotIdleState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
        love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.player:changeState('pot-walk')
    end
end

function PlayerPotIdleState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end