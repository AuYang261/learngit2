package.cpath = package.cpath .. ";..\\?.dll"

Operators = require("libraries.operators")

function love.load()
    Back = love.graphics.newImage("imag/logo.jpeg")
    Win = love.graphics.newImage("imag/win.jpg")
    Huaji = love.graphics.newImage("imag/huaji.jpg")
    Diameter = 30 * 3 ^ 0.5
    Long = 60
    FirstX = 540 - 2 * Diameter
    FirstY = 150
    flagkey = 0
    flagmouse = 0
    flagpressmouse = 0
    Num = 0
    win = 0
end

function hexagon(x, y, data)
    love.graphics.setColor(50 / 255, 128 / 255, 64 / 255)
    love.graphics.polygon(
        "fill",
        x - Diameter,
        y - 30,
        x,
        y - 60,
        x + Diameter,
        y - 30,
        x + Diameter,
        y + 30,
        x,
        y + 60,
        x - Diameter,
        y + 30
    )
    love.graphics.setLineWidth(5)
    love.graphics.setLineStyle("smooth")
    love.graphics.setColor(1, 1, 0.1)
    love.graphics.polygon(
        "line",
        x - 30 * 3 ^ 0.5,
        y - 30,
        x,
        y - 60,
        x + 30 * 3 ^ 0.5,
        y - 30,
        x + 30 * 3 ^ 0.5,
        y + 30,
        x,
        y + 60,
        x - 30 * 3 ^ 0.5,
        y + 30
    )
    love.graphics.setColor(192 / 255, 192 / 255, 192 / 255)
    if data > 0 then
        if data < 10 then
            love.graphics.print(data, x - 10, y - 23, 0, 3, 3)
        elseif data >= 10 and data < 100 then
            love.graphics.print(data, x - 23, y - 23, 0, 3, 3)
        elseif data >= 100 and data < 1000 then
            love.graphics.print(data, x - 33, y - 23, 0, 3, 3)
        else
            love.graphics.print(data, x - 50, y - 23, 0, 3, 3)
        end
    end
end

function Recta(x, y, ch)
    love.graphics.setColor(1, 1, 0.5)
    love.graphics.rectangle("fill", x, y, 50, 50)
    love.graphics.setColor(1, 0.5, 0.25)
    love.graphics.setLineWidth(5)
    love.graphics.rectangle("line", x, y, 50, 50)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print(ch, x + 20, y + 20)
end
function love.update(dt)
end

function PressKey()
    if flagkey == 0 and win == 0 then
        if love.keyboard.isDown("q") then
            Operators.Move(1)
            Num = Num + 1
        end
        if love.keyboard.isDown("e") then
            Operators.Move(2)
            Num = Num + 1
        end
        if love.keyboard.isDown("a") then
            Operators.Move(3)
            Num = Num + 1
        end
        if love.keyboard.isDown("d") then
            Operators.Move(4)
            Num = Num + 1
        -- love.graphics.print(1)
        end
        if love.keyboard.isDown("z") then
            Operators.Move(5)
            Num = Num + 1
        end
        if love.keyboard.isDown("c") then
            Operators.Move(6)
            Num = Num + 1
        end
        flagkey = 1
    end
    if not love.keyboard.isDown("q", "e", "a", "d", "z", "c") then
        flagkey = 0
    end
end

function PressMouse()
    if love.mouse.isDown(1) and flagpressmouse == 0 and win == 0 then
        local x = love.mouse.getX()
        local y = love.mouse.getY()
        if x > 900 and x < 950 then
            if y > 300 and y < 350 then
                Operators.Move(1)
                Num = Num + 1
            end
            if y > 350 and y < 400 then
                Operators.Move(3)
                Num = Num + 1
            end
            if y > 400 and y < 450 then
                Operators.Move(5)
                Num = Num + 1
            end
        end
        if x > 950 and x < 1000 then
            if y > 300 and y < 350 then
                Operators.Move(2)
                Num = Num + 1
            end
            if y > 350 and y < 400 then
                Operators.Move(4)
                Num = Num + 1
            end
            if y > 400 and y < 450 then
                Operators.Move(6)
                Num = Num + 1
            end
        end
        flagpressmouse = 1
    end
    if not love.mouse.isDown(1) then
        flagpressmouse = 0
    end
end

function Lord()
    local x = love.mouse.getX() - FirstX
    local y = love.mouse.getY() - FirstY
    if y > -Long / 2 and y < Long / 2 then
        if x > -Diameter and x < 5 * Diameter then
            unit = (math.floor((x + 3 * Diameter) / 2 / Diameter))
        -- love.graphics.print(math.floor((x + 3 * Diameter) / 2 / Diameter))
        end
    end
    if y > Long and y < 2 * Long then
        if x > -2 * Diameter and x < 6 * Diameter then
            unit = (3 + math.floor((x + 4 * Diameter) / 2 / Diameter))
        -- love.graphics.print(
        --     3 + math.floor((x + 4 * Diameter) / 2 / Diameter)
        -- )
        end
    end
    if y > 2.5 * Long and y < 3.5 * Long then
        if x > -3 * Diameter and x < 7 * Diameter then
            unit = (7 + math.floor((x + 5 * Diameter) / 2 / Diameter))
        -- love.graphics.print(
        --     7 + math.floor((x + 5 * Diameter) / 2 / Diameter)
        -- )
        end
    end
    if y > 4 * Long and y < 5 * Long then
        if x > -2 * Diameter and x < 6 * Diameter then
            unit = (12 + math.floor((x + 4 * Diameter) / 2 / Diameter))
        -- love.graphics.print(
        --     12 + math.floor((x + 4 * Diameter) / 2 / Diameter)
        -- )
        end
    end
    if y > 5.5 * Long and y < 6.5 * Long then
        if x > -Diameter and x < 5 * Diameter then
            unit = (16 + math.floor((x + 3 * Diameter) / 2 / Diameter))
        -- love.graphics.print(
        --     16 + math.floor((x + 3 * Diameter) / 2 / Diameter)
        -- )
        end
    end
    if love.mouse.isDown(1) and flagmouse == 0 and win == 0 then
        Operators.increase(unit)
        flagmouse = 1
    end
    if love.mouse.isDown(2) then
        Operators.del(unit)
    end
    if not (love.mouse.isDown(1) or love.mouse.isDown(2)) then
        flagmouse = 0
    end
end

function love.draw()
    if love.keyboard.isDown("lctrl") then
        Lord()
    end
    love.graphics.setColor(1, 1, 1, 0.3)
    love.graphics.draw(Back, 28, -60, 0, 1, 0.8)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(Huaji, 1000, 30, 0, 1, 1)
    love.graphics.print("<Developed by AuYang>", 930, 0)
    hexagon(FirstX, FirstY, Operators.GetData(1))
    hexagon(FirstX + Diameter * 2, FirstY, Operators.GetData(2))
    hexagon(FirstX + Diameter * 4, FirstY, Operators.GetData(3))
    hexagon(FirstX - Diameter, FirstY + 60 * 1.5, Operators.GetData(4))
    hexagon(FirstX + Diameter, FirstY + 60 * 1.5, Operators.GetData(5))
    hexagon(FirstX + Diameter * 3, FirstY + 60 * 1.5, Operators.GetData(6))
    hexagon(FirstX + Diameter * 5, FirstY + 60 * 1.5, Operators.GetData(7))
    hexagon(FirstX - Diameter * 2, FirstY + 60 * 3, Operators.GetData(8))
    hexagon(FirstX, FirstY + 60 * 3, Operators.GetData(9))
    hexagon(FirstX + Diameter * 2, FirstY + 60 * 3, Operators.GetData(10))
    hexagon(FirstX + Diameter * 4, FirstY + 60 * 3, Operators.GetData(11))
    hexagon(FirstX + Diameter * 6, FirstY + 60 * 3, Operators.GetData(12))
    hexagon(FirstX - Diameter, FirstY + 60 * 4.5, Operators.GetData(13))
    hexagon(FirstX + Diameter, FirstY + 60 * 4.5, Operators.GetData(14))
    hexagon(FirstX + Diameter * 3, FirstY + 60 * 4.5, Operators.GetData(15))
    hexagon(FirstX + Diameter * 5, FirstY + 60 * 4.5, Operators.GetData(16))
    hexagon(FirstX, FirstY + 60 * 6, Operators.GetData(17))
    hexagon(FirstX + Diameter * 2, FirstY + 60 * 6, Operators.GetData(18))
    hexagon(FirstX + Diameter * 4, FirstY + 60 * 6, Operators.GetData(19))
    Recta(900, 300, "Q")
    Recta(950, 300, "E")
    Recta(900, 350, "A")
    Recta(950, 350, "D")
    Recta(900, 400, "Z")
    Recta(950, 400, "C")
    PressKey()
    PressMouse()
    love.graphics.setColor(1, 1, 0.95)
    love.graphics.print("You have crossed", 0, 0, 0, 2, 2)
    love.graphics.print("steps", 270, 0, 0, 2, 2)
    love.graphics.print(Num, 220, 0, 0, 2, 2)
    love.graphics.print(
        "Tips:press 'q','e','a','d','z','c' to move.",
        0,
        50,
        0,
        2,
        2
    )
    if Operators.IsWin() == 1 then
        love.graphics.setColor(1, 0.75, 1)
        love.graphics.draw(Win, 290, 193.5)
        love.graphics.setColor(1, 1, 1)
        love.graphics.print(
            'You seem to be NB?!\nPress "Enter" to restart!',
            400,
            0,
            0,
            2,
            2
        )
        win = 1
    end
    if love.keyboard.isDown("return") and win == 1 then
        win = 0
        Num = 0
        for i = 1, 20 do
            Operators.del(i)
        end
    end
end
