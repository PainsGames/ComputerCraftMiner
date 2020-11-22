require "movements" 
require "actions" 
require "inventory" 

height = 3
width = 3

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
            move.up()
        end
    end

    move.down(height)
    return true
end

-- [[ Main ]] --
for i=1,width do
    if not mineColumn(height) then
        return
    end
    move.left()
end
move.right(width)
