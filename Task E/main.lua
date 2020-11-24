function love.load()
    picture = love.graphics.newImage("picture/tower.png")
    r = 1
    x = 0
    y = -360
    alpha = 1
    enter = 1
    flag = 0
end

function love.update(dt)
    t = dt
end

function love.wheelmoved(dx, dy)
    wheel = dy
end

function love.draw()
    if love.keyboard.isDown("lctrl") then
        if wheel == nil then
            wheel = 0
        end
        if wheel < 0 then
            r = r * 0.9
            wheel = 0
        end
        if wheel > 0 then
            r = r * 1.1
            wheel = 0
        end
    end
    if love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl") then
        if love.mouse.isDown(1) then
            if flag == 0 then
                -- love.graphics.print(1)
                OriX = love.mouse.getX()
                OriY = love.mouse.getY()
                flag = 1
            else
                MoveX = LastMoveX + love.mouse.getX() - OriX
                MoveY = LastMoveY + love.mouse.getY() - OriY
            end
        else
            LastMoveX = MoveX
            LastMoveY = MoveY
            flag = 0
        end
    end
    if MoveX == nil then
        MoveX = 0
    end
    if MoveY == nil then
        MoveY = 0
    end
    time = love.timer.getTime()
    t = time % 1 - time % 0.1
    if not (t1 == t - t % 0.1) then
        red = love.math.random(0, 255) / 255
        green = love.math.random(0, 255) / 255
        blue = love.math.random(0, 255) / 255
    end
    t1 = t - t % 0.1
    if love.keyboard.isDown("return") and enter == 1 then
        enter = 0
        if alpha == 1 then
            alpha = 0.2
        else
            alpha = 1
        end
    elseif not love.keyboard.isDown("return") then
        enter = 1
    end
    love.graphics.setColor(red, green, blue, alpha)
    love.graphics.setLineWidth(5)
    love.graphics.rectangle(
        "line",
        x + MoveX - 100 * r - (r - 1) * picture:getWidth() / 2,
        y + MoveY - 50 * r - (r - 1) * picture:getHeight() / 2,
        (picture:getWidth() + 100 * 2) * r,
        (picture:getHeight() + 50 * 2) * r
    )
    love.graphics.draw(
        picture,
        x + MoveX + picture:getWidth() / 2,
        y + MoveY + picture:getHeight() / 2,
        0,
        r,
        r,
        picture:getWidth() / 2,
        picture:getHeight() / 2
    )
end
