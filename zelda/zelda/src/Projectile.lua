--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Projectile = Class{}

function Projectile:init(projectile, distance, direction)
    self.projectile = projectile -- object to be thrown
    self.distance = distance -- distance of the projectile
    self.direction = direction -- projectile's position according to whre the player is facing

    --coordinates of object
    self.x = projectile.x
    self.y = projectile.y

    self.complete = false -- completes the projectile (disappearing of pot)
end

function Projectile:update(dt)
    local direction = self.direction

    if direction == 'left' then
        self.projectile.x = self.projectile.x - (PotThrowSpeed * dt)

        if (self.x - self.projectile.x) >= self.distance then
            self.complete = true
        end
    elseif direction == 'right' then
        self.projectile.x = self.projectile.x + (PotThrowSpeed * dt)

        if (self.projectile.x - self.x) >= self.distance then
            self.complete = true
        end
    elseif direction == 'up' then
        self.projectile.y = self.projectile.y - (PotThrowSpeed * dt)

        if (self.y - self.projectile.y) >= self.distance then
            self.complete = true
        end
    elseif direction == 'down' then
        self.projectile.y = self.projectile.y + (PotThrowSpeed * dt)

        if (self.projectile.y - self.y) >= self.distance then
            self.complete = true
        end
    end
end

function Projectile:render()

end