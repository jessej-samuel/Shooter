_G.love = require('love')

function Debug()

    return {
        draw = function(self, data)
            love.graphics.setColor(1, 0, 0)
            for i, v in ipairs(data) do
                love.graphics.print(tostring(data[i]), SCREEN_DIMENSIONS.w - 35, 0 + i * 20)
            end
            love.graphics.setColor(1, 1, 1)
        end
    }
end

return Debug
