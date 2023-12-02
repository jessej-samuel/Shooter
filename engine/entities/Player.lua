_G.love = require('love')
local vec2 = require("modules.russet.vec2")
local Bullet = require('engine.entities.Bullet')

function Player()
    return {
        w = 10,
        h = 10,
        pos = vec2(10, 10),
        dir = vec2(0, 0),
        speed = vec2(0, 0),
        max_spd_when_firing = 60,
        max_speed = 5.0 * 60,
        normal_max_speed = 5.0 * 60,
        acceleration = vec2(10, 10),
        decel = vec2(10, 10),
        bullets = {},
        bullet_count = 0,
        firerate = 0.2,
        firerate_timer = 0,
        moving = false,
        draw = function(self)
            love.graphics.circle('fill', self.pos.x, self.pos.y, self.w)
            for i = 1, #self.bullets do
                self.bullets[i]:draw()
            end
        end,
        move = function(self, dt)
            self.moving = false
            -- event handling
            if love.keyboard.isDown("a") then
                self.moving = true
                self.dir.x = -1
            elseif love.keyboard.isDown("d") then
                self.moving = true
                self.dir.x = 1
            else
                self.dir.x = 0
            end

            if love.keyboard.isDown("w") then
                self.moving = true
                self.dir.y = -1
            elseif love.keyboard.isDown("s") then
                self.moving = true
                self.dir.y = 1
            else
                self.dir.y = 0
            end

            if self.moving then
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
        shoot = function(self, target)
            self.bullets[#self.bullets + 1] = Bullet(self.pos, target)
        end,
        -- makes all changes to values
        update = function(self, dt)

            if love.mouse.isDown(1) then
                local mx, my = love.mouse.getPosition()
                if self.firerate_timer == 0 then
                    self:shoot(vec2(mx, my))
                    self.firerate_timer = self.firerate
                end
                self.firerate_timer = math.max(0, self.firerate_timer - dt)
                self.max_speed = self.max_spd_when_firing
            else
                self.max_speed = self.normal_max_speed
            end
            self:move(dt)

            for i, v in ipairs(self.bullets) do
                -- remove bullet if it's dead
                if v then
                    v:update(dt)
                end
            end

            for i = 1, #self.bullets do
                if self.bullets[i].dead then
                    self.bullets.remove(i)
                end
            end

        end
    }
end

return Player
