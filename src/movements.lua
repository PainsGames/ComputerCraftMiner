-- [[ Movements ]] --
-- A set of functions to make the simplistic
-- movement of turtles a little less intensive.

-- [[ Helper local functions ]] --

local function loopAction(action, numberOfExecutions)
    local repeatSteps = numberOfExecutions or 1

    for i=1,repeatSteps do
        action()
    end
end

local function executeCallback(callback, param)
    if callback ~= nil then
        callback(param)
    end
end


-- [[ Moving the turtle ]] --

-- Move the turtle forward 'x' times
-- param: steps - the number of times to move
-- param? callback - a function that will be called after the movement
--                      is executed. Useful for updating movement trackers.
local function moveForward(steps, callback)
    loopAction(turtle.forward, steps)
    executeCallback(callback, steps)
end

local function moveBack(steps, callback)
    loopAction(turtle.back, steps)
    executeCallback(callback, steps)
end

local function moveRight(steps, callback)
    turtle.turnRight()
    loopAction(turtle.forward, steps)
    turtle.turnLeft()
    executeCallback(callback, steps)
end

local function moveLeft(steps, callback)
    turtle.turnLeft()
    loopAction(turtle.forward, steps)
    turtle.turnRight()
    executeCallback(callback, steps)
end

local function moveUp(steps, callback)
    loopAction(turtle.up, steps)
    executeCallback(callback, steps)
end

local function moveDown(steps, callback)
    loopAction(turtle.down, steps)
    executeCallback(callback, steps)
end

-- [[ Turning the turtle ]] --

local function turnRight(steps, callback)
    loopAction(turtle.turnRight, steps)
    executeCallback(callback, steps)
end

local function turnLeft(steps, callback)
    loopAction(turtle.turnLeft, steps)
    executeCallback(callback, steps)
end

local function turnAround(steps, callback)
    local repeatSteps = steps or 1
    loopAction(turtle.turnRight, repeatSteps * 2)
    executeCallback(callback, steps)
end

-- [[ Public Api ]] --

move = {
    forward = moveForward,
    back    = moveBack,
    left    = moveLeft,
    right   = moveRight,
    up      = moveUp,
    down    = moveDown 
}

turn = {
    left = turnLeft,
    right = turnRight,
    around = turnAround
}