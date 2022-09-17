
-- Functions
local function Import_Files()
    -- Check for folder.
    if isfolder("Atomicmoondog") then
        -- If there is a folder then remove it to update it to current version.
        delfolder("Atomicmoondog")
        Import_Files()
        return
    end

    -- Make the folders.
    makefolder("Atomicmoondog")
    makefolder("Atomicmoondog/main")
    makefolder("Atomicmoondog/main")

    -- Make the files.
    writefile("Atomicmoondog/main/Util.lua", game:HttpGetAsync("https://raw.githubusercontent.com/Atomicmoondog/Hub/main/Util.lua"))
    writefile("Atomicmoondog/main/UI.lua", game:HttpGetAsync("https://raw.githubusercontent.com/Atomicmoondog/Hub1/main/UI.lua"))
    writefile("Atomicmoondog/main/ACB.lua", game:HttpGetAsync("https://raw.githubusercontent.com/Atomicmoondog/Hub2/main/ACB.lua"))
    writefile("Atomicmoondog/main/Runtime.lua", game:HttpGetAsync("https://raw.githubusercontent.com/Atomicmoondog/Source2/main/Runtime.lua"))
end

local function Init()
    Import_Files()

    repeat
        task.wait()
    until isfile("Atomicmoondog/main/Runtime.lua")

    local Runtime = loadstring(readfile("Atomicmoondog/main/Runtime.lua"))()
    Runtime.Init()
end

-- Main
Init()
