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

local function getItemCount(slot)
    return turtle.getItemCount(slot)
end

-- [[ Functions ]] --

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
        local item = getItemDetails(i)

        if item == nil then
            canFitBlock = true
            break 
        elseif item.name == itemName then
            canFitBlock = not isInventorySlotFull(i)
        end
    end

    return canFitBlock
end

local function isInventoryFull()

    for i=1,inventorySpaces do
        local count = getItemCount(i)

        if count == 0 then
            return false
        end
    end

    return true
end


-- [[ Public Api ]] --

inventory = {
    findSlotsWithItem = findInventorySlotsWithItem,
    isSlotFull = isInventorySlotFull,
    canFitItem = canInventoryFitItem,
    isInventoryFull = isInventoryFull,
}