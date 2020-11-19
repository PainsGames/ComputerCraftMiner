-- Make sure that the following var always matches the file name.
local thisFilePath = "src/update.lua"

-- First, update the update script....
getGithubResource(thisFilePath)

setupToolsDirectory()



--[[ Functions ]]--

-- Fetch a github resource from this repository
-- filePath - the repository-level path to the file to grab
function getGithubResource(filePath)
    local githubPreface = "https://raw.githubusercontent.com/PainsGames/ComputerCraftMiner/main/"
    getWebResourceToFile(githubPreface .. filePath)
end

function getWebResourceToFile(url, outputFileName)
    local request = http.get(url)
    local requestContent = request.readAll()
    request.close()

    local file = fs.open(outputFileName)
    file.write(requestContent)
    file.close()
end

function setupToolsDirectory()
    local directoryName = "/tools"
    if not fs.exists(directoryName) then
        fs.makeDir(directoryName)
    end
end