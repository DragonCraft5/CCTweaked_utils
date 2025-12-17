local sizeX, sizeY = term.getSize()

local backColor = colors.black
local textColor = colors.white

local buttons = {
    {pos = 2, text = "test button", reciever = 1, message = "press", toggle = false},
    {pos = 2, text = "toggle button", reciever = 2, message = "toggle", toggle = true, active = false}
}
