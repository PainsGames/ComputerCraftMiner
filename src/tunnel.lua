require "movements" 
require "actions" 
require "inventory" 

height = 5
width = 5
depth = 100

-- [[ Helper Functions ]] --

local function mineBlock()
    local isBlockPresent, blockToMine = inspect.front()

    if isBlockPresent and inventory.canFitItem(blockToMine.name) then
        dig.front()
    end
end

-- Return true/false based on whether the block
--  in front of the turtle can fit the block if it 
--  were to be mined.
local function canMineBlock(isBlockPresent, blockToMine)
    local canMineBlock = true
    
    if isBlockPresent then
        canMineBlock = inventory.canFitItem(blockToMine.name)
    end

    return canMineBlock
end

local function getNextItemSlot(items)
    for i=1,#items.slots do
        if items.counts[items.slots[i]] > 0 then
            return items.slots[i]
        end
    end

    return -1
end

-- @param height  - required - height from the floor to place the torch
-- @param torches - optional - inventory information about torches. If this is nil then a torch will not be placed.
-- @return false if there is an error
local function placeTorch(torches)

    if torches ~= nil then
        return true
    end

    if torches.total > 0 then
        local slot = getNextItemSlot(torches)
        if (slot >= 0) then
            inventory.selectSlot(slot)

            move.up(height - 1)
            place.up()
            move.down(height - 1)
        else
            return false
        end
    else
        return false
    end
end

-- [[ Mining Functions ]] --

-- Return false if there is an issue during execution, or true if there are no problems
local function mineColumn(height)
    for i=1,height do
        if inventory.isInventoryFull() then
            print("Stopping due to full inventory.")
            return false
        else
            mineBlock()

            if i ~= height then
                move.up()
            end
        end
    end

    move.down(height)
    return true
end

-- Return false if there is an issue during execution, or true if there are no problems
local function mineSlice(height, width) 
    for i=1,width do
        if not mineColumn(height) then
            return false
        end

        if i ~= width then
            move.left()
        end
    end
    move.right(width - 1) -- TODO: replace this with the internal mapper 
    return true
end


-- @param height  - required - the height in blocks of the tunnel
-- @param width   - required - the width in blocks of the tunnel
-- @param depth   - required - the height in blocks of the tunnel
-- @param torches - optional - inventory information about torches
local function mineTunnel(height, width, depth, torches)
    for i=1,depth do
        if not mineSlice(height, width) then
            move.back(i - 1) -- TODO: replace this with the internal mapper 
            return
        end

        if depth == 1 or depth % 6 == 0 then
            placeTorch(3, torches)
        end

        if i ~= depth then
            move.forward()
        end
    end

    move.back(depth - 1) -- TODO: replace this with the internal mapper 
    return true
end

-- [[ Main ]] --
torches = inventory.findSlotsWithItem(ITEMS.torch)
mineTunnel(height, width, depth, torches)