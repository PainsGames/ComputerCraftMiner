--[[ Functions ]]--

-- Fetch a github resource from this repository
-- filePath - the repository-level path to the file to grab
function getGithubResource(filePath, fileName)
    print("Pulling resource: " .. fileName)
    local githubPreface = "https://raw.githubusercontent.com/PainsGames/ComputerCraftMiner/main/"
    local fileUrl = githubPreface .. filePath .. "/" .. fileName
    local outputFilePath = getToolDirectory() .. "/" .. fileName
    getWebResourceToFile(fileUrl, outputFilePath)
end

function getWebResourceToFile(url, outputFileName)
    local request = http.get(url, {["Cache-Control"] = "no-cache"})
    local requestContent = request.readAll()
    request.close()

    local file = fs.open(outputFileName, "w")
    file.write(requestContent)
    file.close()
end

function setupToolsDirectory()
    if not fs.exists(getToolDirectory()) then
        fs.makeDir(getToolDirectory())
    end
end

function getToolDirectory()
    return "/tools"
end

--[[ MAIN ]]--

-- Make sure that the following var always matches the file name.
local thisFilePath = "update.lua"

-- First, update the update script....
getGithubResource("src", thisFilePath)

setupToolsDirectory()

-- Update the following files. 
getGithubResource("src", "movements.lua")
getGithubResource("src", "actions.lua")
getGithubResource("src", "inventory.lua")
getGithubResource("src", "tunnel.lua")