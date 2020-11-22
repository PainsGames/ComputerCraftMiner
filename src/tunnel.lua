require "movements" 
require "actions" 
require "inventory" 

height = 3
width = 3

-- [[ Helper Functions ]] --

local function mineBlock()
    local isBlockPresent, blockToMine = inspect.front()

    if isBlockPresent and inventory.canFitItem(blockToMine.name) then
        dig.forward()
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

local function mineColumn(height)
    for i=0,height do
        Local isBlockPresent, blockToMine = inspect.front()
        if not canMineBlock(isBlockPresent, blockToMine) then
            print("Stopping due to full inventory.")
            break
        else
            mineBlock()
            move.up()
        end
    end

    move.down(height)
end

-- [[ Main ]] --
for i=0,width do
    for j=0,height do
        move.up()
    end
    move.down(height)
    move.left()
end
move.right(3)
