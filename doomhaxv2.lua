-- Gui to Lua
-- Version: 3.2

-- Services:

local UserInputSevice = game:GetService("UserInputService")

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local label = Instance.new("TextLabel")
local getweapons = Instance.new("TextButton")
local destroydoors = Instance.new("TextButton")
local arrestall = Instance.new("TextButton")
local buffedweapons = Instance.new("TextButton")
local loadsimplespy = Instance.new("TextButton")
local loaddex = Instance.new("TextButton")

--Properties:

ScreenGui.Name = "DoomHaxV2GUI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

main.Name = "main"
main.Parent = ScreenGui
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.270718217, 0, 0.327771187, 0)
main.Size = UDim2.new(0, 310, 0, 190)
main.Active = true
main.Draggable = true

label.Name = "label"
label.Parent = main
label.AnchorPoint = Vector2.new(0.5, 0.5)
label.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
label.BorderColor3 = Color3.fromRGB(255, 255, 255)
label.Position = UDim2.new(0.499322802, 0, 0.10067749, 0)
label.Size = UDim2.new(0, 311, 0, 40)
label.Font = Enum.Font.GothamBold
label.Text = "DoomHax V2   |   Made by TotoAJ#9284"
label.TextColor3 = Color3.fromRGB(180, 255, 190)
label.TextSize = 15.000
label.TextStrokeColor3 = Color3.fromRGB(99, 99, 99)

getweapons.Name = "getweapons"
getweapons.Parent = main
getweapons.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
getweapons.BorderColor3 = Color3.fromRGB(255, 255, 255)
getweapons.Position = UDim2.new(-0.0032258064, 0, 0.205263153, 0)
getweapons.Size = UDim2.new(0, 155, 0, 50)
getweapons.Font = Enum.Font.Ubuntu
getweapons.Text = "Get Weapons"
getweapons.TextColor3 = Color3.fromRGB(255, 255, 255)
getweapons.TextSize = 20.000
getweapons.MouseButton1Down:connect(function()
	local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP
	local A_2 = game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP
	local A_3 = game:GetService("Workspace")["Prison_ITEMS"].giver["M9"].ITEMPICKUP
	
	local Event = game:GetService("Workspace").Remote.ItemHandler
	Event:InvokeServer(A_1)
	Event:InvokeServer(A_2)
	Event:InvokeServer(A_3)
	
	local args1 = {
		[1] = workspace.Prison_ITEMS.single:WaitForChild("Key card").ITEMPICKUP
	}
	Event:InvokeServer(unpack(args1))
end)

destroydoors.Name = "destroydoors"
destroydoors.Parent = main
destroydoors.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
destroydoors.BorderColor3 = Color3.fromRGB(255, 255, 255)
destroydoors.Position = UDim2.new(0.5, 0, 0.204473689, 0)
destroydoors.Size = UDim2.new(0, 155, 0, 50)
destroydoors.Font = Enum.Font.Ubuntu
destroydoors.Text = "Destroy Doors"
destroydoors.TextColor3 = Color3.fromRGB(255, 255, 255)
destroydoors.TextSize = 20.000
destroydoors.MouseButton1Down:connect(function()
    game.Workspace.Doors:Destroy()
	game.Workspace.Prison_Cellblock.doors:Destroy()
end)

arrestall.Name = "arrestall"
arrestall.Parent = main
arrestall.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
arrestall.BorderColor3 = Color3.fromRGB(255, 255, 255)
arrestall.Position = UDim2.new(-0.00300000003, 0, 0.469999999, 0)
arrestall.Size = UDim2.new(0, 155, 0, 50)
arrestall.Font = Enum.Font.Ubuntu
arrestall.Text = "Arrest All"
arrestall.TextColor3 = Color3.fromRGB(255, 255, 255)
arrestall.TextSize = 20.000
arrestall.MouseButton1Down:connect(function()
	wait(0.1)
	local Player = game.Players.LocalPlayer
	for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
		if v.Name ~= Player.Name then
			local i = 5
			repeat
				wait()
				i = i-1
				Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
				game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
			until i == 0
		end
	end
    game.Players.LocalPlayer.Character.ClientInputHandler.Disabled = true
    game.Players.LocalPlayer.CharacterAdded:connect(function()
        game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)
        game.Players.LocalPlayer.Character.ClientInputHandler.Disabled = true
    end)
end)

buffedweapons.Name = "buffedweapons"
buffedweapons.Parent = main
buffedweapons.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
buffedweapons.BorderColor3 = Color3.fromRGB(255, 255, 255)
buffedweapons.Position = UDim2.new(0.5, 0, 0.469999999, 0)
buffedweapons.Size = UDim2.new(0, 155, 0, 50)
buffedweapons.Font = Enum.Font.Ubuntu
buffedweapons.Text = "Buffed Weapons"
buffedweapons.TextColor3 = Color3.fromRGB(255, 255, 255)
buffedweapons.TextSize = 20.000
buffedweapons.MouseButton1Down:connect(function()
    local plr = game.Players.localPlayer
 
    local gun1 = plr.Backpack["AK-47"].GunStates
    local gun2 = plr.Backpack["Remington 870"].GunStates
	local gun3 = plr.Backpack["M9"].GunStates
 
	a = require(gun1)
	b = require(gun2)
	c = require(gun3)
	b.AutoFire = true
	c.AutoFire = true
	a.Bullets = 25
	b.Bullets = 25
	c.Bullets = 25
end)

loadsimplespy.Name = "loadsimplespy"
loadsimplespy.Parent = main
loadsimplespy.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
loadsimplespy.BorderColor3 = Color3.fromRGB(255, 255, 255)
loadsimplespy.Position = UDim2.new(-0.00300000003, 0, 0.733157873, 0)
loadsimplespy.Size = UDim2.new(0, 155, 0, 50)
loadsimplespy.Font = Enum.Font.Ubuntu
loadsimplespy.Text = "Load Simple Spy"
loadsimplespy.TextColor3 = Color3.fromRGB(255, 255, 255)
loadsimplespy.TextSize = 20.000
loadsimplespy.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
end)

loaddex.Name = "loaddex"
loaddex.Parent = main
loaddex.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
loaddex.BorderColor3 = Color3.fromRGB(255, 255, 255)
loaddex.Position = UDim2.new(0.5, 0, 0.73299998, 0)
loaddex.Size = UDim2.new(0, 155, 0, 50)
loaddex.Font = Enum.Font.Ubuntu
loaddex.Text = "Load Dark Dex"
loaddex.TextColor3 = Color3.fromRGB(255, 255, 255)
loaddex.TextSize = 20.000
loaddex.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://gist.githubusercontent.com/DinosaurXxX/b757fe011e7e600c0873f967fe427dc2/raw/ee5324771f017073fc30e640323ac2a9b3bfc550/dark%2520dex%2520v4"))()
end)

UserInputSevice.InputBegan:Connect(function(InputKey)
	if InputKey.KeyCode == Enum.KeyCode.F8 then
		ScreenGui:Destroy()
	end
end)
