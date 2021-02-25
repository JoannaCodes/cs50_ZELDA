-- SPECIFICATION: Pot as weapon

PlayerPotThrowState = Class{__includes = BaseState}

function PlayerPotThrowState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    self.projectile = nil
end

function PlayerPotThrowState:update(dt)
    if self.projectile == nil then
        self.player.carriesPot.projecting = true
        self.projectile = Projectile(self.player.carriesPot, TILE_SIZE * 4, self.player.direction)
    end

    self.projectile:update(dt)

    if self.projectile.complete then
        self.player.carriesPot.projecting = false
        self.player.carriesPot = nil
        self.player:changeState('idle')
    end
end

function PlayerPotThrowState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end