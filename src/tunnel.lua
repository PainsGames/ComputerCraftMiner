require "movements" 
require "actions" 
require "inventory" 

height = 3
width = 3
depth = 2

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

-- [[ Main ]] --

for i=1,depth do
    if not mineSlice(height, width) then
        return
    end

    if i ~= depth then
        move.front()
    end
end

move.back(depth - 1) -- TODO: replace this with the internal mapper 
return true