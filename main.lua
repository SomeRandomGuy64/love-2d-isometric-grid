_G.love = require "love"

function love.load()
    _G.tilesheet = love.graphics.newImage('src/tilesets/tilesheet.png')
    tilesheet:setFilter("nearest", "nearest")
    _G.tileWidth = 32
    _G.tileHeight = 32
    _G.tiles = fromImageToQuads(tilesheet, tileWidth, tileHeight)
    _G.tileSize = 3
    _G.mapX, _G.mapY = 200, 100
    _G.map = {
        {3, 3, 3, 3, 3, 3, 3},
        {3, 3, 3, 3, 3, 3, 3},
        {3, 3, 1, 3, 1, 3, 3},
        {3, 3, 1, 4, 1, 3, 3},
        {3, 3, 1, 3, 1, 3, 3},
        {3, 3, 3, 3, 3, 3, 3},
        {3, 3, 3, 3, 3, 3, 3}
    }
end

function love.update(dt)

end

function love.draw()
    for i = 1, #map do
        for j = 1, #map[i] do
            if map[i][j] ~= 0 then
                local x = mapX + (j * (tileWidth * tileSize / 2)) - (i * (tileWidth * tileSize / 2))

                local y = mapY + (i * (tileHeight * tileSize / 4)) + (j * (tileHeight * tileSize / 4))

                love.graphics.draw(tilesheet, tiles[map[i][j]], x + 300, y, 0, tileSize)
            end
        end
    end
end

function fromImageToQuads(tilesheet, tileWidth, tileHeight)
    local tiles = {}
    local imageWidth = tilesheet:getWidth()
    local imageHeight = tilesheet:getHeight()
    for i = 0, imageHeight - 1, tileHeight do
        for j = 0, imageWidth - 1, tileWidth do
            table.insert(tiles, love.graphics.newQuad(i, j, tileWidth, tileHeight, imageWidth, imageHeight))
        end
    end
    return tiles
end