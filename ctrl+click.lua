local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local UserInputService = game:GetService("UserInputService")

local ctrlDown = false

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
        ctrlDown = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
        ctrlDown = false
    end
end)

mouse.Button1Down:Connect(function()
    if ctrlDown and mouse.Target then
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0, 3, 0))
            -- Thông báo teleport
            game.StarterGui:SetCore("SendNotification", {
                Title = "Ctrl+Click TP";
                Text = "Teleport đã được bật!";
                Duration = 2;
            })
        end
    end
end)
