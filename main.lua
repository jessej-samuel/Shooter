_G.love = require('love')
_G.Player = require('/engine/entities/Player')
_G.Debug = require('/engine/debug/Debug')

function love.load()
    player = Player()
    debugger = Debug()
end

function love.update(dt)
    player:update()
end

function love.draw()
    player:draw()
    debugger:draw({love.timer.getFPS(), player.speed})
end
