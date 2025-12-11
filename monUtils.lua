local monitor = peripheral.find("monitor")
local monXSize, monYSize = monitor.getSize()

local textColor = colors.white
local backgroundColor = colors.black



-- monitor utils
local function clearMonitor()
    monitor.clear()
    monitor.setTextColor(textColor)
    monitor.setBackgroundColor(backgroundColor)
    monitor.setCursorPos(1, 1)
end
local function drawCenteredText(y, text)
    local textLength = string.len(text)
    local x = math.floor((monXSize - textLength) / 2) + 1
    monitor.setCursorPos(x, y)
    monitor.write(text)
end
local function drawLeftText(y, text)
    monitor.setCursorPos(1 + 1, y)
    monitor.write(text)
end
local function drawRightText(y, text)
    local textLength = string.len(text)
    local x = monXSize - textLength
    monitor.setCursorPos(x, y)
    monitor.write(text)
end
