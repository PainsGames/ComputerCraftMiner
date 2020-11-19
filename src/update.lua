fs.makeDir("/pain-in-the")


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