-- [[ Movements ]] --
-- A set of functions to make the simplistic
-- movement of turtles a little less intensive.

-- [[ Moving the turtle ]] --
local function moveForward(steps)
    loopAction(turtle.forward, steps)
end

local function moveBack(steps)
    loopAction(turtle.back, steps)
end

local function moveRight(steps)
    turtle.turnRight()
    loopAction(turtle.forward, steps)
    turtle.turnLeft()
end

local function moveLeft(steps)
    turtle.turnLeft()
    loopAction(turtle.forward, steps)
    turtle.turnRight()
end

local function moveUp(steps)
    loopAction(turtle.up, steps)
end

local function moveDown(steps)
    loopAction(turtle.down, steps)
end

-- [[ Turning the turtle ]] --

local function turnRight(steps)
    loopAction(turtle.turnRight, steps)
end

local function turnLeft(steps)
    loopAction(turtle.turnLeft, steps)
end

local function turnAround(steps)
    local repeatSteps = steps or 1
    loopAction(turtle.turnRight, repeatSteps * 2)
end

-- [[ Helper local functions ]] --

local function loopAction(action, numberOfExecutions)
    local repeatSteps = numberOfExecutions or 1

    for i=1,repeatSteps do
        action()
    end
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