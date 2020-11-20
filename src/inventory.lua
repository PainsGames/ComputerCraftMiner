-- [[ Inventory ]] --
-- A set of functions to make the simplistic
-- inventory actions of turtles a little less intensive.

-- [[ Public Api ]] --

inventory = {
    findSlotsWithItem = findInventorySlotsWithItem,
    isSlotFull = isInventorySlotFull
}

-- [[ Helper Functions ]] --

-- Item tags are in the expected format of "mod:item" so
--  minecraft sand is "minecraft:sand"
-- @return an array of indexs of slots containing the target items.
local function findInventorySlotsWithItem(itemTag)
    
    local slots = {}

    for i=1,16 do
        local item = turtle.getItemDetail(i)
        if item.name == itemTag then
            slots[#slots + 1] = i
        end
    end

    return slots
end

local function isInventorySlotFull(slotNumber)
    local inventorySlotData = turtle.getItemDetail(slotNumber, true)
    local isFull = false

    if not inventorySlotData == nil then
        isFull = inventorySlotData.count >= inventorySlotData.maxCount
    end

    return isFull
end