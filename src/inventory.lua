-- [[ Inventory ]] --
-- A set of functions to make the simplistic
-- inventory actions of turtles a little less intensive.

-- [[ Helper Functions ]] --

-- Item tags are in the expected format of "mod:item" so
--  minecraft sand is "minecraft:sand"
-- @return an array of indexs of slots containing the target items.

local inventorySpaces = 16

local function getItemDetails(slot)
    return turtle.getItemDetail(slot)
end

local function getAllItemDetails(slot)
    return turtle.getItemDetail(slot, true)
end

local function findInventorySlotsWithItem(itemName)
    
    local slots = {}

    for i=1,inventorySpaces do
        local item = turtle.getItemDetail(i)
        if item ~= nil and item.name == itemName then
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

local function getEmptySlots() 

    local isThereAnEmptySlot = false

    for i=1,inventorySpaces do
        if getItemDetails(i) == nil then
            isThereAnEmptySlot = true
            break
        end
    end

    return isThereAnEmptySlot
end

local function canInventoryFitItem(itemName)

    local canFitBlock = false
    
    for i=1,inventorySpaces do
        local item = isInventorySlotFull(i)

        if item == nil then
            canFitBlock = true
            break
        else
            canFitBlock = canInventoryFitItem(itemName)
        end
    end

    return canFitBlock
end

-- [[ Public Api ]] --

inventory = {
    findSlotsWithItem = findInventorySlotsWithItem,
    isSlotFull = isInventorySlotFull,
    canFitItem = canInventoryFitItem
}