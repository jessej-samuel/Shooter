_G.love = require('love')

function Player()
    return {
        x = 0 + 10,
        y = 0 + 10,
        w = 10,
        h = 10,
        dir = {
            x = 0,
            y = 0
        },
        speed = 0,
        max_speed = 3,
        acceleration = 0.1,
        draw = function(self)
            love.graphics.circle('fill', self.x, self.y, self.w)
        end,
        update = function(self)
            -- event handling
            if love.keyboard.isDown("a") then
                self.dir.x = -1
            elseif love.keyboard.isDown("d") then
                self.dir.x = 1
            else
                self.dir.x = 0
            end
            
            if love.keyboard.isDown("w") then
                self.dir.y = -1
            elseif love.keyboard.isDown("s") then
                self.dir.y = 1
            else
                self.dir.y = 0
            end

            self.speed = self.speed + self.acceleration -- acclerate
            if self.speed > self.max_speed then -- speed limit
                self.speed = self.max_speed
            end
            self.x = self.x + self.dir.x * (self.speed / 0.7142857143)
            self.y = self.y + self.dir.y * (self.speed / 0.7142857143)

            -- Set limits on the player
        end
    }
end

return Player
