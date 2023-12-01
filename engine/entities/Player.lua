_G.love = require('love')
local vec2 = require("modules.russet.vec2")

function Player()
    return {
        w = 10,
        h = 10,
        pos = vec2(10, 10),
        dir = vec2(0, 0),
        speed = vec2(0, 0),
        max_speed = 5.0 * 60,
        acceleration = vec2(5, 5),
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
                if self.speed:length() > self.max_speed then
                    self.speed:normalize()
                    self.speed = self.speed * self.max_speed
                end
            else
                self.speed = vec2(0, 0)
            end

            self.pos = self.pos + self.speed * love.timer.getDelta()
        end,
        update = function(self)
            self:move()
        end
    }
end

return Player
