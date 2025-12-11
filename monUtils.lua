local monitor = peripheral.find("monitor")

local monXSize, monYSize = monitor.getSize()

local textColor = colors.white
local backgroundColor = colors.black

local color1 = colors.green
local color2 = colors.yellow
local color3 = colors.red


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
    monitor.setTextColor(textColor)
    monitor.setBackgroundColor(backgroundColor)
end
local function drawLeftText(y, text)
    monitor.setCursorPos(1 + 1, y)
    monitor.write(text)
    monitor.setTextColor(textColor)
    monitor.setBackgroundColor(backgroundColor)
end
local function drawRightText(y, text)
    local textLength = string.len(text)
    local x = monXSize - textLength
    monitor.setCursorPos(x, y)
    monitor.write(text)
    monitor.setTextColor(textColor)
    monitor.setBackgroundColor(backgroundColor)
end
local function calcPercentage(num1, num2)
    local percentage = num1 / num2
    if percentage < 0.5 then
        monitor.setTextColor(color1)
    elseif percentage >= 0.5 and percentage < 0.9 then
        monitor.setTextColor(color2)
    else
        monitor.setTextColor(color3)
    end
end
