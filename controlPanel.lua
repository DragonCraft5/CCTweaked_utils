local sizeX, sizeY = term.getSize()

local backColor = colors.black
local textColor = colors.white
local buttonBackColor = colors.purple
local buttonTextColor = colors.pink
local activeButtonBackColor = colors.pink
local activeButtonTextColor = colors.purple


local buttons = {
    {pos = 2, textLength, text = "test button", reciever = 1, message = "press", toggle = false, active = false},
    {pos = 4, textLength, text = "toggle button", reciever = 2, message = "toggle", toggle = true, active = false},
    {pos = 6, textLength, text = "active button", reciever = 6, message = "toggle", toggle = true, active = true}
}




-------------------- Main running funtions --------------------

local modemAPI = require("novsModemApi")
local modem = peripheral.find("modem")

modemAPI.open(modem)




local function buttonFuntions(pressedButton)
    if pressedButton == 1 then
        
    end
end






---------------------------------------------------------------




local function drawButton(pos, text, active)
    if active then
        term.setBackgroundColor(activeButtonBackColor)
        term.setTextColor(activeButtonTextColor)
    else
        term.setBackgroundColor(buttonBackColor)
        term.setTextColor(buttonTextColor)
    end

    term.setCursorPos(2, pos)
    term.write(text)
end

local function clear()
    term.setBackgroundColor(backColor)
    term.setTextColor(textColor)
    term.clear()
end

local function checkClickPos(posArray)
    for key, value in pairs(buttons) do
        if posArray[2] == value.pos and posArray[1] >= 2 and posArray[1] <= value.textLength + 1 then
            if value.toggle then
                value.active = not value.active
            else
                drawButton(value.pos, value.text, true)
                os.sleep(0.2)
            end
        end
    end
end

local function waitForClick()
    event, button, x, y = os.pullEvent("mouse_click")
    if button == 1 then
        return {x, y}
    end
end



-- define textLength
for key, value in pairs(buttons) do
    value.textLength = string.len(value.text)
end

while true do
    clear()

    for key, value in pairs(buttons) do
        drawButton(value.pos, value.text, value.active)
    end

    checkClickPos(waitForClick())
end



