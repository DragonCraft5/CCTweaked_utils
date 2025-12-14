local bridge = peripheral.find("meBridge")

local Items = {
    {"minecraft:gunpowder", 64},
    {"mekanism:alloy_infused", 32},
    {"mekanism:basic_control_circuit", 16},
    {"mekanism:ingot_steel", 32},
    {"ae2:logic_processor", 16},
    {"ae2:calculation_processor", 32},
    {"minecraft:sand", 64}
}

local cpuNames = {
    "Clyde",
    "Dave",
    "Jeff",
    "Bill"
}

local function getfreeCpu()
    for key, value in pairs(bridge.getCraftingCPUs()) do
        if not value.isBusy then
            return cpuNames[key]
        elseif key == #cpuNames then
            return false
        end
    end
end

local function craft(item, amount, cpuName)
    if not cpuName then
        return false
    elseif bridge.isItemCrafting({name = item}) then
        print("already getting crafted")
        return false
    elseif bridge.isItemCraftable({name = item}) then
        print("not craftable")
        return false
    else
        bridge.craftItem({name = item, count = amount}, cpuName)
        print(item .. " is getting crafted by " .. cpuName)
    end
end



--main loop
while true do
    os.run({}, "/rom/programs/clear.lua")
    for key, value in pairs(Items) do
        print(value[1])
        local amount = bridge.getItem({name = value[1]}).amount
        if amount < value[2] then
            print("in System: " .. amount .. " craft")
            print("to craft: " .. value[2] - amount)
            craft(value[1], math.ceil((value[2] - amount)), getfreeCpu())
        else
            print("in System: " .. amount .. " no craft")
        end
    end
    os.sleep(3)
end
