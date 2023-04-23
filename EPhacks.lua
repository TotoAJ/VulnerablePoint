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
local coroutine_1 = coroutine.create(infAmmo)
coroutine.resume(coroutine_1)

function playerEsp()
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

function npcEsp()
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

function loopWalk()
	local RunService = game:GetService("RunService")

	RunService.Heartbeat:Connect(function()
		if enabled[4] <= 0 then return end
		game:GetService("Players").LocalPlayer.Character:WaitForChild('Humanoid').WalkSpeed = enabled[4]
	end)
end

local coroutine_1 = coroutine.create(infAmmo)
local coroutine_2 = coroutine.create(playerEsp)
local coroutine_3 = coroutine.create(npcEsp)
local coroutine_4 = coroutine.create(loopWalk)

for i,v in pairs(enabled) do
	if v then
		if i == 1 then
			pcall(coroutine.resume(coroutine_1))
		end
		if i == 2 then
			pcall(coroutine.resume(coroutine_2))
		end
		if i == 3 then
			pcall(coroutine.resume(coroutine_3))
		end
		if i == 4 then
			pcall(coroutine.resume(coroutine_4))
		end
	end
end
