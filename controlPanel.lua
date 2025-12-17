local sizeX, sizeY = term.getSize()

local backColor = colors.black
local textColor = colors.white
local buttonBackColor = colors.purple
local buttonTextColor = colors.pink
local activeButtonBackColor = colors.pink
local activeButtonTextColor = colors.purple


local buttons = {
    {pos = 2, textLength, text = "test button", reciever = 1, message = "press", toggle = false},
    {pos = 4, textLength, text = "toggle button", reciever = 2, message = "toggle", toggle = true, active = false},
    {pos = 6, textLength, text = "active button", reciever = 6, message = "toggle", toggle = true, active = true}
}



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

local function checkClickPos(x, y)
    for key, value in pairs(buttons) do
        if y == value.pos and x >= 2 and x <= value.textLength + 1 then
            value.active = not value.active
        end
    end
end



-- define textLength
for key, value in pairs(buttons) do
    value.textLength = string.len(value.text)
end

-- main
while true do
    clear()

    for key, value in pairs(buttons) do
        drawButton(value.pos, value.text, value.active)
    end

    os.sleep(1)
end
