local npctobring = '' -- Enter the NPC name that you want to bring, it's the name you see when you hover your cursor over them (Ryan Ross: Ryan, Base Commander: SC Commander)
local player = game.Players.LocalPlayer
local actors = game.Workspace.Level.Actors
local myTable = {}
for word in string.gmatch(tostring(player.Character.HumanoidRootPart.CFrame), '([^,]+)') do
    table.insert(myTable, word)
end
local cframepos = CFrame.new(myTable[1], myTable[2], myTable[3])

for i,v in pairs(actors:GetChildren()) do
    if v.Character.Interact.ObjectName.value == npctobring then
        wait(2)
        while true do
            wait()
            v.Character:SetPrimaryPartCFrame(cframepos)
        end
        return
    end
end
