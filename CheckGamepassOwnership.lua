local player = game.Players.LocalPlayer
local badgeService = game:GetService("BadgeService")
local badgeId = 123456789 -- Put your badge ID here

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
