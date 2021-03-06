-- [[ Actions ]] --
-- A set of functions to make the simplistic
-- actions of turtles a little less intensive.

require "movements"


-- [[ Helper Functions ]] --
local function doActionFront(action) 
    return action()
end

local function doActionLeft(action) 
    turnLeft()
    local actionResult = action()
    turnRight()
    return actionResult
end

local function doActionRight(action) 
    turnRight()
    local actionResult = action()
    turnLeft()
    return actionResult
end

local function doActionBack(action) 
    turnAround()
    local actionResult = action()
    turnAround()
    return actionResult
end

-- [[ Inspection ]] --
local function inspectFront() 
    return doActionFront(turtle.inspect)
end

local function inspectRight() 
    return doActionRight(turtle.inspect)
end

local function inspectLeft() 
    doActionLeft(turtle.inspect)
end

local function inspectBack() 
    doActionBack(turtle.inspect)
end

local function inspectDown()
    return turtle.inspectDown()
end

local function inspectUp()
    return turtle.inspectUp()
end

-- [[ Dig ]] --
local function digFront() 
    return doActionFront(turtle.dig)
end

local function digRight() 
    return doActionRight(turtle.dig)
end

local function digLeft() 
    doActionLeft(turtle.dig)
end

local function digBack() 
    doActionBack(turtle.dig)
end

local function digDown()
    return turtle.digDown()
end

local function digUp()
    return turtle.digUp()
end


-- [[ Place ]] --
local function placeFront() 
    return doActionFront(turtle.place)
end

local function placeRight() 
    return doActionRight(turtle.place)
end

local function placeLeft() 
    doActionLeft(turtle.place)
end

local function placeBack() 
    doActionBack(turtle.place)
end

local function placeDown()
    return turtle.placeDown()
end

local function placeUp()
    return turtle.placeUp()
end

-- [[ Public Api ]] --

inspect = {
    front = inspectFront,
    right = inspectRight,
    left  = inspectLeft,
    back  = inspectBack,
    down  = inspectDown,
    up    = inspectUp
}

dig = {
    front = digFront,
    right = digRight,
    left  = digLeft,
    back  = digBack,
    down  = digDown,
    up    = digUp
}

place = {
    front = placeFront,
    right = placeRight,
    left  = placeLeft,
    back  = placeBack,
    down  = placeDown,
    up    = placeUp
}