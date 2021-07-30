local inputService = game:GetService("UserInputService")
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:wait()
 
local sprinting = false

inputService.InputBegan:Connect(function (key)
	if key.KeyCode == Enum.KeyCode.LeftShift or key.KeyCode == Enum.KeyCode.RightShift then
		running = true
		if char.Humanoid then
			char.Humanoid.WalkSpeed = 64
		end
	end
end)

inputService.InputEnded:Connect(function (key)
	if key.KeyCode == Enum.KeyCode.LeftShift or key.KeyCode == Enum.KeyCode.RightShift then
		running = false
		if char.Humanoid then
			char.Humanoid.WalkSpeed = 16
		end
	end
end)