local bridge = peripheral.find("meBridge")
local monitor = peripheral.find("monitor")

local monXSize, monYSize = monitor.getSize()

local textColor = colors.purple
local backgroundColor = colors.black

local color1 = colors.green
local color2 = colors.yellow
local color3 = colors.red


-- monitor utils
local function clearMonitor()
    monitor.setTextColor(textColor)
    monitor.setBackgroundColor(backgroundColor)
    monitor.clear()
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




-- main loop
while true do
    local usedItem = bridge.getUsedItemStorage()
    local totalItem = bridge.getTotalItemStorage()
    local availableItem = bridge.getAvailableItemStorage()

    local usedFluid = bridge.getUsedFluidStorage()
    local totalFluid = bridge.getTotalFluidStorage()
    local availableFluid = bridge.getAvailableFluidStorage()


    clearMonitor()
    drawCenteredText(1, "ME System Status")
    drawLeftText(3, "Item Storage:")
    drawLeftText(4, "Available:")
        drawLeftText(6, "Fluid Storage:")
    drawLeftText(7, "Available:")

    calcPercentage(usedItem, totalItem)
    drawRightText(3, tostring(usedItem) .. "/" .. tostring(totalItem))
    drawRightText(4, tostring(availableItem))

    calcPercentage(usedFluid, totalFluid)
    drawRightText(6, tostring(usedFluid) .. "/" .. tostring(totalFluid))
    drawRightText(7, tostring(availableFluid))
    os.sleep(3)
end
