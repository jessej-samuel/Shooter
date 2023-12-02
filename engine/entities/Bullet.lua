love = require('love')
local vec2 = require("modules/vector")

function Bullet(pos, target)
    return {
        pos = pos,
        rotation = 0,
        speed = 1800,
        dead = false,
        dir = (target - pos):normalized(),
        target = target,
        draw = function(self)
            love.graphics.circle('line', self.pos.x, self.pos.y, 1)
        end,
        move = function(self, dt)
            self.pos = self.pos + self.dir * self.speed * dt
        end,
        update = function(self, dt)
            -- moves bullet
            self:move(dt)
            -- checks collisions
            -- set life  
        end
    }
end

return Bullet
