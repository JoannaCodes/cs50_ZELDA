-- SPECIFICATION: Pot as weapon

PlayerPotLiftState = Class{__includes = BaseState}

function PlayerPotLiftState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    self.player:changeAnimation('lift-pot-' .. self.player.direction)

    self.pot = nil
end


function PlayerPotLiftState:update(dt)
    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0

        local PotDistanceToPlayer = 0

        for k, object in pairs(self.dungeon.currentRoom.objects) do
            if object.type == 'pot' then
                if self.pot == nil then
                    self.pot = object
                else
                    PotDistanceToPlayer = math.abs(self.player.x - self.pot.x) + math.abs(self.player.y - self.pot.y)

                    if (math.abs(self.player.x - object.x) + math.abs(self.player.y - object.y)) < PotDistanceToPlayer then
                        self.pot = object
                        PotDistanceToPlayer = math.abs(self.player.x - self.pot.x) + math.abs(self.player.y - self.pot.y)
                    end
                end
            end
        end

        if PotDistanceToPlayer < 30 then
            self.player.carriesPot = self.pot

            self.player:changeState('pot-idle')

            self.player.carriesPot.x = math.floor(self.player.x)
            self.player.carriesPot.y = math.floor(self.player.y - (self.player.height / 2))
        else
            self.player:changeState('idle')
        end
    end
end

function PlayerPotLiftState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end