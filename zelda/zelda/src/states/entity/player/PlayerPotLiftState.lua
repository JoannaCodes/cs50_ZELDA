PlayerPotLiftState = Class{__includes = BaseState}

function PlayerPotLiftState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    self.player.offsetY = 5
    self.player.offsetX = 7

    self.player:changeAnimation('lift-pot-' .. self.player.direction)
end


function PlayerPotLiftState:update(dt)

    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeState('idle')
    end

    -- for walking while pot is carried
    --[[for k, object in pairs(self.dungeon.currentRoom.objects) do
        if self.player:collides(object) and object.solid then
            self.player.potLift = true
            self.player:changeState()
        end
    end]]

end

function PlayerPotLiftState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end