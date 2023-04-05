local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

local player_lib = {}

player_lib.MaxDistance = 20

player_lib.Closest = nil

RunService.Heartbeat:Connect(function()
    while HumanoidRootPart do
        for _, v in pairs(Players:GetPlayers()) do
            local vCharacter = v.Character
            local Distance = v:DistanceFromCharacter(HumanoidRootPart.Position)
            if vCharacter and Distance <= MaxDistance then
                player_lib.Closest = vCharacter
            end
        end
    end
end)
