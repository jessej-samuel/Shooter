_G.love = require('love')
_G.Player = require('/engine/entities/Player')
_G.Debug = require('/engine/debug/Debug')
local vec2 = require('modules.russet.vec2')
local Tilemap = require('engine.utils.Tilemap')

Game = {}

function Game.load()
    player = Player()
    debugger = Debug()
    tilemap = Tilemap(vec2(64,64), 32)
    return Game
end

function Game.update(dt)
    player:update(dt)
end

function Game.draw()
    tilemap:draw()
    player:draw()
    debugger:draw({'fps', love.timer.getFPS(), 'pos ', player.pos, 'spd ', player.speed, 'acc', player.acceleration,
                   'bullets', #player.bullets})
    
    
    love.graphics.rectangle('line', 1, 1, SCREEN_DIMENSIONS.w -2, SCREEN_DIMENSIONS.h -2)
end

return Game
