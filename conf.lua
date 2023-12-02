_G.SCREEN_DIMENSIONS = {
    w = 1280,
    h = 720
}

function love.conf(t)
    t.window.width = SCREEN_DIMENSIONS.w
    t.window.height = SCREEN_DIMENSIONS.h
    t.modules.joystick = false
    t.identity = 'data/saves'
    t.externalStorage = true
    t.window.fullscreen = true
    t.console = true
end
