PlayerPotLiftState = Class{__includes = BaseState}

function PlayerPotLiftState:enter(params)
    self.entity.offsetY = 5
    self.entity.offsetX = 0
end

function PlayerPotLiftState:update(dt)
    local direction = self.entity.direction

    if direction == 'left' then
        self.entity:changeAnimation('lift-pot-left')
    elseif direction == 'right' then
        self.entity:changeAnimation('lift-pot-right')
    elseif direction == 'up' then
        self.entity:changeAnimation('lift-pot-up')
    elseif direction == 'down' then
        self.entity:changeAnimation('lift-pot-down')
    else
        self.entity:changeState('idle')
    end
end