love = require('love')
local vec2 = require("modules/vector")


function Bullet(player, target)
    return {
        x = player.x,
        y = player.y,
		dir = {
			x = 0,
			y = 0
		},
		rotation = 0,
		speed = 20,
        target = target
    }
end
