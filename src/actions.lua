-- [[ Actions ]] --
-- A set of functions to make the simplistic
-- actions of turtles a little less intensive.

require "movements"

-- [[ Inspection ]] --
function inspectFront() 
    return doActionFront(turtle.inspect)
end

function inspectRight() 
    return doActionRight(turtle.inspect)
end

function inspectLeft() 
    doActionLeft(turtle.inspect)
end

function inspectBack() 
    doActionBack(turtle.inspect)
end

function inspectDown()
    return turtle.inspectDown()
end

function inspectUp()
    return turtle.inspectUp()
end

-- [[ Dig ]] --
function digFront() 
    return doActionFront(turtle.dig)
end

function digRight() 
    return doActionRight(turtle.dig)
end

function digLeft() 
    doActionLeft(turtle.dig)
end

function digBack() 
    doActionBack(turtle.dig)
end

function digDown()
    return turtle.digDown()
end

function digUp()
    return turtle.digUp()
end

-- [[ Helper Functions ]] --
function doActionFront(action) 
    return action()
end

function doActionLeft(action) 
    turnLeft()
    local actionResult = action()
    turnRight()
    return actionResult
end

function doActionRight(action) 
    turnRight()
    local actionResult = action()
    turnLeft()
    return actionResult
end

function doActionBack(action) 
    turnAround()
    local actionResult = action()
    turnAround()
    return actionResult
end