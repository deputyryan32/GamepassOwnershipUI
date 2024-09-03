local player = game.Players.LocalPlayer
local badgeService = game:GetService("BadgeService")
local badgeId = 2143363195 -- Put your badge ID here
local maxRetries = 3 -- Maximum number of retries for game pass check

-- Function to display a message to the player
local function displayMessage(message)
    local messageGui = Instance.new("ScreenGui")
    local textLabel = Instance.new("TextLabel")

    messageGui.Name = "GamepassMessage"
    messageGui.Parent = player:WaitForChild("PlayerGui")

    textLabel.Size = UDim2.new(0, 300, 0, 50)
    textLabel.Position = UDim2.new(0.5, -150, 0.5, -25)
    textLabel.Text = message
    textLabel.Parent = messageGui

    -- Remove the message after 5 seconds
    wait(5)
    messageGui:Destroy()
end

-- Function to check if the player owns the game pass
local function checkGamepassOwnership(retries)
    retries = retries or 0
    local success, ownsGamepass = pcall(function()
        return badgeService:UserHasBadgeAsync(player.UserId, badgeId)
    end)

    if success then
        if ownsGamepass then
            script.Parent.Visible = true
            displayMessage("You own the game pass!")
        else
            script.Parent:Destroy()
        end
        print("Game pass check successful: " .. tostring(ownsGamepass))
    else
        warn("Failed to check game pass ownership. Attempt: " .. (retries + 1))
        if retries < maxRetries then
            wait(2) -- Wait for 2 seconds before retrying
            checkGamepassOwnership(retries + 1)
        else
            warn("Max retries reached. Could not verify game pass ownership.")
        end
    end
end

-- Call the function to check game pass ownership
checkGamepassOwnership()
