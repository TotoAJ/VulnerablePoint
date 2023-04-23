-- Made by TotoAJ

local enabled = {
	true, -- Infinite Ammo
	true, -- Player ESP
	true, -- NPC ESP
	40 -- LoopWalk (Set to 0 for false)
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
		repeat wait() until v.Character ~= nil
		if v.Character ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
			local highlightClone = highlight:Clone()
			highlightClone.Adornee = v.Character
			highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
			highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		end
	end

	Players.ChildAdded:Connect(function(player) 
		repeat wait() until player.Character ~= nil
		if player.Character ~= nil and player.Character:FindFirstChild("HumanoidRootPart") ~= nil and not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
			local highlightClone = highlight:Clone()
			highlightClone.Adornee = player.Character
			highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
			highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		end
	end)

	Players.ChildRemoved:Connect(function(playerRemoved)
		if playerRemoved.Character ~= nil and playerRemoved.Character:FindFirstChild("HumanoidRootPart") ~= nil and playerRemoved:FindFirstChild("HumanoidRootPart") and playerRemoved.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") ~= nil then
			playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
		end
	end)

	RunService.Heartbeat:Connect(function()
		for i,v in pairs(Players:GetChildren()) do
			repeat wait() until v.Character ~= nil
			if v.Character ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
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
		repeat wait() until v.Character ~= nil
		if (not v.Name) == 'NPC0' and v.Character ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
			local highlightClone = highlight:Clone()
			highlightClone.Adornee = v.Character
			highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
			highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		end
	end

	Actors.ChildAdded:Connect(function(player) 
		repeat wait() until player.Character ~= nil
		if (not player.Name) == 'NPC0' and player.Character ~= nil and player.Character:FindFirstChild("HumanoidRootPart") ~= nil and not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
			local highlightClone = highlight:Clone()
			highlightClone.Adornee = player.Character
			highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
			highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		end
	end)

	Actors.ChildRemoved:Connect(function(playerRemoved)
		if playerRemoved.Character ~= nil and playerRemoved.Character:FindFirstChild("HumanoidRootPart") ~= nil and playerRemoved:FindFirstChild("HumanoidRootPart") and playerRemoved.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") ~= nil then
			playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
		end
	end)

	RunService.Heartbeat:Connect(function()
		for i,v in pairs(Actors:GetChildren()) do
			repeat wait() until v.Character  ~= nil
			if (not v.Name) == 'NPC0' and v.Character ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
				local highlightClone = highlight:Clone()
				highlightClone.Adornee = v.Character
				highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
				highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				task.wait()
			end
		end
	end)
end

function loopWalk(speed)
	local RunService = game:GetService("RunService")

	RunService.Heartbeat:Connect(function()
		game:GetService("Players").LocalPlayer.Character:WaitForChild('Humanoid').WalkSpeed = speed
	end)
end

for i,v in pairs(enabled) do
	if v then
		if i == 1 then
			pcall(infAmmo)
		end
		if i == 2 then
			pcall(playerEsp)
		end
		if i == 3 then
			pcall(npcEsp)
		end
		if i == 4 and v > 0 then
			pcall(loopWalk, v)
		end
	end
end
