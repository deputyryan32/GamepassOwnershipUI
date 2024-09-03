# CheckGamepassOwnership.lua

This script checks if the local player owns a specific game pass (badge) in Roblox. If the player owns the game pass, it makes a certain UI element visible. If the player does not own the game pass, it destroys that UI element.

## How to Use

1. **Place the Script**: Add the `CheckGamepassOwnership.lua` script to your Roblox project. You can place it in the appropriate location where you want to check the game pass ownership.

2. **Set the Badge ID**: Replace the `badgeId` variable in the script with your specific badge ID. This is the ID of the game pass you want to check.

    ```lua
    local badgeId = 123456789 -- Put your badge ID here
    ```

3. **Attach to UI Element**: Ensure that the script is a child of the UI element you want to control. The script will make this UI element visible or destroy it based on the player's game pass ownership.

4. **Run the Game**: Start your Roblox game. The script will automatically check if the local player owns the specified game pass and update the UI element accordingly.

## Script Overview

Here's a brief overview of the script:

```lua
local player = game.Players.LocalPlayer
local badgeService = game:GetService("BadgeService")
local badgeId = 2143363195 -- Put your badge ID here

-- Function to check if the player owns the game pass
local function checkGamepassOwnership()
    local success, ownsGamepass = pcall(function()
        return badgeService:UserHasBadgeAsync(player.UserId, badgeId)
    end)

    if success then
        if ownsGamepass then
            script.Parent.Visible = true
        else
            script.Parent:Destroy()
        end
    else
        warn("Failed to check game pass ownership")
    end
end

-- Call the function to check game pass ownership
checkGamepassOwnership()
