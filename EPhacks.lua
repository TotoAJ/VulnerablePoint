-- Made by TotoAJ

local enabled = {}
enabled["routine_1"] = true -- Infinite Ammo
enabled["routine_2"] = true -- Player ESP
enabled["routine_3"] = true -- NPC ESP
enabled["routine_4"] = 30 -- LoopWalk (Set to 0 for false)

function routine_1()
	local RunService = game:GetService("RunService")

	RunService.Heartbeat:Connect(function()
		for i,v in pairs(game.Players.LocalPlayer.Status.Ammo:GetChildren()) do
			v.Value = 200
		end
	end)
end

function routine_2()
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local highlight = Instance.new("Highlight")
	highlight.Name = "Highlight"
	highlight.FillColor = Color3.fromRGB(85, 255, 255)
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255)

	for i,v in pairs(Players:GetChildren()) do
		repeat wait() until v:FindFirstChild("Character") ~= nil
		if v.Character:FindFirstChild("HumanoidRootPart") ~= nil and not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
			local highlightClone = highlight:Clone()
			highlightClone.Adornee = v.Character
			highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
			highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		end
	end

	Players.ChildAdded:Connect(function(player) 
		repeat wait() until player:FindFirstChild("Character") ~= nil
		if player.Character:FindFirstChild("HumanoidRootPart") ~= nil and not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
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
			repeat wait() until v:FindFirstChild("Character") ~= nil
			if v.Character:FindFirstChild("HumanoidRootPart") ~= nil and not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
				local highlightClone = highlight:Clone()
				highlightClone.Adornee = v.Character
				highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
				highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				wait()
			end
		end
	end)
end

function routine_3()
	local Actors = workspace.Level.Actors
	local RunService = game:GetService("RunService")
	local highlight = Instance.new("Highlight")
	highlight.Name = "Highlight"
	highlight.FillColor = Color3.fromRGB(85, 255, 255)
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255)

	for i,v in pairs(Actors:GetChildren()) do
		repeat wait() until v:FindFirstChild("Character") ~= nil
		if v.Character:FindFirstChild("HumanoidRootPart") ~= nil and not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
			local highlightClone = highlight:Clone()
			highlightClone.Adornee = v.Character
			highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
			highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		end
	end

	Actors.ChildAdded:Connect(function(player) 
		repeat wait() until player:FindFirstChild("Character") ~= nil
		if player.Character:FindFirstChild("HumanoidRootPart") ~= nil and not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
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
			repeat wait() until v:FindFirstChild("Character") ~= nil
			if v.Character:FindFirstChild("HumanoidRootPart") ~= nil and not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
				local highlightClone = highlight:Clone()
				highlightClone.Adornee = v.Character
				highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
				highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				wait()
			end
		end
	end)
end

function routine_4()
	local RunService = game:GetService("RunService")

	RunService.Heartbeat:Connect(function()
		if enabled["routine_4"] <= 0 then return end
		game:GetService("Players").LocalPlayer.Character:WaitForChild('Humanoid').WalkSpeed = enabled["routine_4"]
	end)
end

for i,v in pairs(enabled) do
	if v then loadstring("pcall(coroutine.wrap("..i.."))")() end
end
