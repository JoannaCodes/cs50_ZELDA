-- SPECIFICATION: Pot as weapon

PlayerPotWalkState = Class{__includes = EntityWalkState}

function PlayerPotWalkState:init(player, dungeon)
    self.entity = player
    self.dungeon = dungeon

end

function PlayerPotWalkState:update(dt)
    if love.keyboard.isDown('left') then
        self.entity.direction = 'left'
        self.entity:changeAnimation('walk-pot-left')
    elseif love.keyboard.isDown('right') then
        self.entity.direction = 'right'
        self.entity:changeAnimation('walk-pot-right')
    elseif love.keyboard.isDown('up') then
        self.entity.direction = 'up'
        self.entity:changeAnimation('walk-pot-up')
    elseif love.keyboard.isDown('down') then
        self.entity.direction = 'down'
        self.entity:changeAnimation('walk-pot-down')
    else
        self.entity:changeState('pot-idle')
    end

    if love.keyboard.wasPressed('space') then
        self.entity:changeState('idle')
    end

    EntityWalkState.update(self, dt)
end