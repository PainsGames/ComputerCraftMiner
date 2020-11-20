-- [[ Movements ]] --
-- A set of functions to make the simplistic
-- movement of turtles a little less intensive.


-- [[ Moving the turtle ]] --
function moveForward(steps)
    loopAction(turtle.forward, steps)
end

function moveBack(steps)
    loopAction(turtle.back, steps)
end

function moveRight(steps)
    turtle.turnRight()
    loopAction(turtle.forward, steps)
    turtle.turnLeft()
end

function moveLeft(steps)
    turtle.turnLeft()
    loopAction(turtle.forward, steps)
    turtle.turnRight()
end

function moveUp(steps)
    loopAction(turtle.up, steps)
end

function moveDown(steps)
    loopAction(turtle.up, steps)
end

-- [[ Turning the turtle ]] --

function turnRight(steps)
    loopAction(turtle.turnRight, steps)
end

function turnLeft(steps)
    loopAction(turtle.turnLeft, steps)
end

function turnAround(steps)
    local repeatSteps = steps or 1
    loopAction(turtle.turnRight, repeatSteps * 2)
end

-- [[ Helper Functions ]] --

function loopAction(action, numberOfExecutions)
    local repeatSteps = numberOfExecutions or 1

    for i=1,loopCount do
        action()
    end
end