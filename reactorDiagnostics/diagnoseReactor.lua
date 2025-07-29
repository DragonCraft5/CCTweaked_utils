local chatBox = peripheral.find("chatBox")

local function sendWarning(warnMessage, warnColor)
    local title = {
        { text = "WARNING", color = "red", bold = true}
    }

    local message = {
        { text = warnMessage, color = warnColor}
    }

    local titleJson = textutils.serializeJSON(title)
    local messageJson = textutils.serialiseJSON(message)

    chatBox.sendFormattedToastToPlayer(messageJson, titleJson, "NOvOx7")
end

while true do

    -- gets all inputs
    local damaged = redstone.getInput("top")
    local highTemp = redstone.getInput("right")
    local lowFuel = redstone.getInput("left")
    local highWaste = redstone.getInput("front")


    -- send warning messages

    if damaged then
        sendWarning("REACTOR DAMAGED", "red")

        elseif highTemp then
            sendWarning("REACTOR HIGH TEMPERATURE", "red")

            elseif lowFuel then
                sendWarning("Reactor has low fuel", "grey")

                elseif highWaste then
                    sendWarning("Reactor waste is full", "grey")
    end 

    os.sleep(5)

end