-- Made by TotoAJ

local enabled = {
	infinite_ammo = true,
	npc_esp = true,
	loop_walk = 25 --(Set to 0 for false)
}

function infinite_ammo()
	while wait(1) do
		for i, v in pairs(game.Players.LocalPlayer.Status.Ammo:GetChildren()) do
			if v.Cap.Value == 0 then v.Cap.Value = 8 end
			v.Value = v.Cap.Value
		end
	end
end

function npc_esp()
	local Actors = workspace.Level.Actors
	local highlight = Instance.new("Highlight")
	highlight.Name = "Highlight"
	highlight.FillColor = Color3.fromRGB(85, 255, 255)
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255)

	for i, v in pairs(Actors:GetChildren()) do
		repeat
			wait()
		until v:FindFirstChild("Character") ~= nil
		if
			v.Character:FindFirstChild("HumanoidRootPart") ~= nil and
			not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight")
		then
			local highlightClone = highlight:Clone()
			highlightClone.Adornee = v.Character
			highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
			highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		end
	end

	Actors.ChildAdded:Connect(
		function(player)
			repeat
				wait()
			until player:FindFirstChild("Character") ~= nil
			if
				player.Character:FindFirstChild("HumanoidRootPart") ~= nil and
				not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight")
			then
				local highlightClone = highlight:Clone()
				highlightClone.Adornee = player.Character
				highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
				highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			end
		end
	)

	Actors.ChildRemoved:Connect(
		function(playerRemoved)
			if
				playerRemoved:FindFirstChild("Character") ~= nil and
				playerRemoved.Character:FindFirstChild("HumanoidRootPart") ~= nil and
				playerRemoved:FindFirstChild("HumanoidRootPart") and
				playerRemoved.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") ~= nil
			then
				playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
			end
		end
	)

	while wait(1) do
		for i, v in pairs(Actors:GetChildren()) do
			repeat
				wait(0.5)
			until v:FindFirstChild("Character") ~= nil
			if
				v.Character:FindFirstChild("HumanoidRootPart") ~= nil and
				not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight")
			then
				local highlightClone = highlight:Clone()
				highlightClone.Adornee = v.Character
				highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
				highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			end
		end
	end
end

function loop_walk()
	while wait(0.1) do
		if enabled["loop_walk"] > 0 then
			game:GetService("Players").LocalPlayer:WaitForChild("Character"):WaitForChild("Humanoid").WalkSpeed =
				enabled["loop_walk"]
		end
	end
end

if enabled["infinite_ammo"] then
	pcall(coroutine.wrap(infinite_ammo))
end

if enabled["npc_esp"] then
	pcall(coroutine.wrap(npc_esp))
end

if enabled["loop_walk"] then
	pcall(coroutine.wrap(loop_walk))
end
