-- Made by TotoAJ

local enabled = {
	true, -- Infinite Ammo
	true, -- Player ESP
	true -- NPC ESP
}

function infAmmo()
	local RunService = game:GetService("RunService")

	RunService.Heartbeat:Connect(function()
		for i,v in pairs(game.Players.LocalPlayer.Status.Ammo:GetChildren()) do
			v.Value = 200
		end
	end)
end

function playerEsp()
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local highlight = Instance.new("Highlight")
	highlight.Name = "Highlight"
	highlight.FillColor = Color3.fromRGB(85, 255, 255)
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255)

	for i,v in pairs(Players:GetChildren()) do
		repeat wait() until v.Character
		if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
			local highlightClone = highlight:Clone()
			highlightClone.Adornee = v.Character
			highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
			highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		end
	end

	Players.ChildAdded:Connect(function(player) 
		repeat wait() until player.Character
		if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
			local highlightClone = highlight:Clone()
			highlightClone.Adornee = player.Character
			highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
			highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		end
	end)

	Players.ChildRemoved:Connect(function(playerRemoved)
		if playerRemoved:FindFirstChild("HumanoidRootPart") then
			playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
		end
	end)

	RunService.Heartbeat:Connect(function()
		for i,v in pairs(Players:GetChildren()) do
			repeat wait() until v.Character
			if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
				local highlightClone = highlight:Clone()
				highlightClone.Adornee = v.Character
				highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
				highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				task.wait()
			end
		end
	end)
end

function npcEsp()
	local Actors = workspace.Level.Actors
	local RunService = game:GetService("RunService")
	local highlight = Instance.new("Highlight")
	highlight.Name = "Highlight"
	highlight.FillColor = Color3.fromRGB(85, 255, 255)
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255)

	for i,v in pairs(Actors:GetChildren()) do
		repeat wait() until v.Character
		if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
			local highlightClone = highlight:Clone()
			highlightClone.Adornee = v.Character
			highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
			highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		end
	end

	Actors.ChildAdded:Connect(function(player) 
		repeat wait() until player.Character
		if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
			local highlightClone = highlight:Clone()
			highlightClone.Adornee = player.Character
			highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
			highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		end
	end)

	Actors.ChildRemoved:Connect(function(playerRemoved)
		if playerRemoved:FindFirstChild("HumanoidRootPart") then
			playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
		end
	end)

	RunService.Heartbeat:Connect(function()
		for i,v in pairs(Actors:GetChildren()) do
			repeat wait() until v.Character
			if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
				local highlightClone = highlight:Clone()
				highlightClone.Adornee = v.Character
				highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
				highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				task.wait()
			end
		end
	end)
end

for i,v in pairs(enabled) do
	if v then
		if i == 1 then
			infAmmo()
		end
		if i == 2 then
			playerEsp()
		end
		if i == 3 then
			npcEsp()
		end
	end
end
