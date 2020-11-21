require "movements" 
require "actions" 
require "inventory" 

local height = 3
local width = 3



move.forward()

-- [[ Helper Functions ]] --
function mineBlock()
    local blockToMine = inspect.front()

    if blockToMine ~= nil then
        dig.forward()
    end
end