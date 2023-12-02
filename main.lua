_G.love = require('love')
_G.Player = require('/engine/entities/Player')
_G.Debug = require('/engine/debug/Debug')
_G.Game = require('/engine/Game')

function love.load()
    game = Game.load()
    local screenX = SCREEN_DIMENSIONS.w
    local screenY = SCREEN_DIMENSIONS.h
    local dimX, dimY = love.graphics.getDimensions()
    _G.SCALE = math.min(dimX / screenX, dimY / screenY)
end

function love.update(dt)
    game.update(dt)
end

function love.draw()
    love.graphics.scale(_G.SCALE)
    game.draw()
end
