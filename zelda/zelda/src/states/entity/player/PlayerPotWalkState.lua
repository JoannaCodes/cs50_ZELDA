PlayerPotWalkState = Class{__includes = EntityWalkState}

function PlayerPotWalkState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    self.player.offsetY = 5
    self.player.offsetX = 7
end

function PlayerPotWalkState:update()

end

function PlayerPotWalkState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end