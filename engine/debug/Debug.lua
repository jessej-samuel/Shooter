_G.love = require('love')

function Debug()
    return {
        draw = function(self, data)
            for i, v in ipairs(data) do
                love.graphics.print(data[i], SCREEN_DIMENSIONS.w - 40, 0 + i * 20)
            end
        end
    }
end

return Debug
