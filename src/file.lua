-- [[ File ]] --
-- A set of functions to sinmplify the file api.

-- [[ File ]] --

local function writeContentToFile(content, filename)
    local file = fs.open(filename, "w")
    file.write(content)
    file.close()
end

local function readContentFromFile(content, filename)
    local file = fs.open(filename, "r")
    local content = file.readAll(content)
    file.close()
    return content
end

-- [[ Public Api ]] --

file = {
    -- Write to File will overwrite existing files
    writeToFile = writeToFile,
    readFromFile = readContentFromFile,
}

