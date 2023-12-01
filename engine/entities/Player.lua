_G.love = require('love')
local vec2 = require("modules/vector")

function Player()
    return {
        w = 10,
        h = 10,
        pos = vec2(10, 10),
        dir = vec2(0, 0),
        speed = vec2(0, 0),
        max_speed = 5,
        acceleration = vec2(0.15, 0.15),
        draw = function(self)
            love.graphics.circle('fill', self.pos.x, self.pos.y, self.w)
        end,
        move = function(self)
            moving = false
            -- event handling
            if love.keyboard.isDown("a") then
                moving = true
                self.dir.x = -1
            elseif love.keyboard.isDown("d") then
                moving = true
                self.dir.x = 1
            else
                self.dir.x = 0
            end

            if love.keyboard.isDown("w") then
                moving = true
                self.dir.y = -1
            elseif love.keyboard.isDown("s") then
                moving = true
                self.dir.y = 1
            else
                self.dir.y = 0
            end

            if moving then
                self.speed = self.speed + self.acceleration * self.dir
                if self.speed:getmag() > self.max_speed then
                    self.speed:setmag(self.max_speed)
                end
            else
                self.speed = vec2(0, 0)
            end

            self.pos = self.pos + self.speed

            -- Set limits on the player
        end,
        update = function(self)
            self:move()
        end
    }
end

return Player
