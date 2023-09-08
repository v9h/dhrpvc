-- edit your values accordingly -- 
local Remotes = {
    game:GetService("ReplicatedStorage").GiveBox,
    game:GetService("ReplicatedStorage").GiveCat
}

for _, v in pairs(Remotes) do
    for i = 1, 30 do
        task.spawn(function()
            for x = 1, 60 do
                task.spawn(v.FireServer, v)
            end
        end)
    end
end

if not getgenv().Dropping then
    getgenv().Dropping = true

    spawn(function()
        while true do
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v:ClearAllChildren()
                    v.Parent = game.Players.LocalPlayer.Character
                    v.Parent = workspace
                end
            end
            task.wait()
        end
    end)
end
