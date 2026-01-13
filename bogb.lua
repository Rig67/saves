local player = game.Players.LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game.Players.LocalPlayer
local function ban(time)
	local k = string.lower(time)
	if k == "30m" then
		for _, v in ipairs(game.Players:GetPlayers()) do
			rs.BanRequest:FireServer(v.Name, "Ban30Min")
		end
	elseif k == "1h" then
		for _, v in ipairs(game.Players:GetPlayers()) do
			rs.BanRequest:FireServer(v.Name, "Ban1Hour")
		end
	elseif k == "5m" then
		for _, v in ipairs(game.Players:GetPlayers()) do
			rs.BanRequest:FireServer(v.Name, "Ban5Min")
		end
	elseif k == "15m" then
		for _, v in ipairs(game.Players:GetPlayers()) do
			rs.BanRequest:FireServer(v.Name, "Ban15Min")
		end
	end
end

player.Chatted:Connect(function(message)
	local msg = string.lower(message)
	if msg == ".ban30m" then
		ban("30m")
	elseif msg == ".ban1h" then
		ban("1h")
	elseif msg == ".ban5m" then
		ban("5m")
	elseif msg == ".ban15m" then
		ban("15m")
	end
end)

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Lib/main/source.lua"))()
local window = library:Window("Rig's gui")

window:Toggle("Infinite money?!", false, function(bool)
	local LocalPlayer = game.Players.LocalPlayer
	Toggleds = bool
	local function GetRoot(Target)
		if not Target then
			Target = LocalPlayer
		end
		return Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart")
	end
	local MoneyPart = nil
	for _, Part in workspace.Decoration:GetChildren() do
		if Part.Name == "Part" and Part:FindFirstChild("Script") then
			MoneyPart = Part
			break
		end
	end
	if not MoneyPart then
		return
	end
	MoneyPart.Size = Vector3.new(10, 10, 10)
	MoneyPart.CanCollide = false
	MoneyPart.Transparency = 1
	if Toggleds then
		while Toggleds do
			local Root = GetRoot()
			if not Root then
				task.wait(0)
			else
				MoneyPart.CFrame = Root.CFrame
				task.wait(0)
				MoneyPart.CFrame = CFrame.new(0, 1000, 0)
				task.wait(0)
			end
		end
	else
		MoneyPart.CFrame = CFrame.new(0, 1000, 0)
	end
end)
local plr = game.Players.LocalPlayer
window:Toggle("Auto teleport", false, function(bool)
	loops = bool
	task.spawn(function()
		while loops do
			plr.Character.HumanoidRootPart.CFrame = CFrame.new(0, 2, 0)
			task.wait(0.4)
		end
	end)
end)

local root
local plr = game.Players.LocalPlayer
local function setupRoot()
	local char = plr.Character or plr.CharacterAdded:Wait()
	root = char:WaitForChild("HumanoidRootPart")
end

setupRoot()

plr.CharacterAdded:Connect(function()
	setupRoot()
end)

local RunService = game:GetService("RunService")
local AntiWarpConn
local Old
window:Toggle("AntiWarp", false, function(bool)
	gogo2 = bool
	if gogo2 then
		if AntiWarpConn then
			AntiWarpConn:Disconnect()
		end
		AntiWarpConn = RunService.Stepped:Connect(function()
			local Char = LocalPlayer.Character
			if not Char then
				return
			end
			local Root = Char:FindFirstChild("HumanoidRootPart")
			if not Root then
				return
			end
			if not Old then
				Old = Root.CFrame
				return
			end
			local Distance = (Root.Position - Old.Position).Magnitude
			if Distance >= 15 then
				Root.CFrame = Old
				Old = nil
			else
				Old = Root.CFrame
			end
		end)
	else
		if AntiWarpConn then
			AntiWarpConn:Disconnect()
			AntiWarpConn = nil
		end
		Old = nil
	end
end)
window:Toggle("Auto button", false, function(bool)
	Toggled = bool
	local ButtonFolder = workspace.ButtonsMoney
	local function GetRoot(Target)
		if not Target then
			Target = LocalPlayer
		end
		return Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart")
	end
	if Toggled then
		repeat
			task.wait()
		until GetRoot()
		local Root = GetRoot()
		if not Root then
			return
		end
		local Old = Root.CFrame
		repeat
			Root = GetRoot()
			if not Root then
				return
			end
			Root.CFrame = CFrame.new(0, 2070, -103)
			task.wait()
		until ButtonFolder.Button4:FindFirstChild("Main")
		local Triggers = {}
		for _, Button in ButtonFolder:GetChildren() do
			local Part = Button:FindFirstChild("Main")
			if Part then
				Part.CanCollide = false
				table.insert(Triggers, Part)
			end
		end
		while Toggled do
			Root = GetRoot()
			if not Root then
				break
			end
			for _, Button in Triggers do
				Button.CFrame = Root.CFrame
			end
			task.wait()
			for _, Button in Triggers do
				Button.CFrame = CFrame.new(0, 9e9, 0)
			end
			task.wait()
		end
		if Root then
			Root.CFrame = Old
		end
	end
end)
local BuyChest = ReplicatedStorage.Chest_BuyWithMoney
local Chests = workspace.ActiveChests

local AutoChestConn

window:Toggle("Auto chest", false, function(bool)
	Gogo = bool
	if Gogo then
		for _, Chest in Chests:GetChildren() do
			BuyChest:FireServer(Chest)
		end
		if AutoChestConn then
			AutoChestConn:Disconnect()
		end
		AutoChestConn = Chests.ChildAdded:Connect(function(Chest)
			BuyChest:FireServer(Chest)
		end)
	else
		if AutoChestConn then
			AutoChestConn:Disconnect()
			AutoChestConn = nil
		end
	end
end)
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Holder = PlayerGui.BanTypesGui.Background.Types
local BuyBanNames = {
	"1_Ban5Mins",
	"2_Ban15Mins",
	"3_Ban30Mins",
	"4_Ban1Hour",
	"5_Ban1Day",
	"6_Ban30Day",
	"7_Ban365Day"
}

local function GetStock()
	local Stock = {}

	for _, Name in ipairs(BuyBanNames) do
		local Inst = Holder:FindFirstChild(Name)
		if Inst then
			local Label = Inst.StockFrame.StockFrame2.Stock
			if Label and Label.Text then
				local num = Label.Text:match("%d+")
				num = tonumber(num)

				if num and num > 0 then
					local RealName = Name:sub(3):gsub("Mins", "Min")
					Stock[RealName] = num
				end
			end
		end
	end

	return Stock
end

local ShopBuyBan = ReplicatedStorage.ShopBuyBan
local Restock = ReplicatedStorage.BanStock_UpdateAll
local RestockConn

window:Toggle("Auto buy stock", false, function(bool)
	autobuy = bool

	if autobuy then
		local Stock = GetStock()
		for Name, Amount in pairs(Stock) do
			for _ = 1, Amount do
				ShopBuyBan:FireServer(Name)
			end
		end

		if RestockConn then
			RestockConn:Disconnect()
		end
		RestockConn = Restock.OnClientEvent:Connect(function(NewStock)
			for Name, Amount in pairs(NewStock) do
				for _ = 1, Amount do
					ShopBuyBan:FireServer(Name)
				end
			end
		end)
	else
		if RestockConn then
			RestockConn:Disconnect()
			RestockConn = nil
		end
	end
end)
local UnbanTimes = {
	[300] = "Unban5Min",
	[900] = "Unban15Min",
	[1800] = "Unban30Min",
	[3600] = "Unban1Hour",
	[86400] = "Unban1Day",
	[2592000] = "Unban30Day",
	[31536000] = "Unban365Day"
}

local function GetCategory(Num)
	local ClosestTime = math.huge
	local ClosestCategory = nil

	for Time, Category in pairs(UnbanTimes) do
		if Num <= Time and Time < ClosestTime then
			ClosestTime = Time
			ClosestCategory = Category
		end
	end

	return ClosestCategory
end

local UnbanRequest = ReplicatedStorage.UnbanRequest
local UnbanInventory = LocalPlayer.UnbanInventory
local BuyUnban = ReplicatedStorage.ShopBuyUnban

local function Unban()
	local BanEnd = LocalPlayer:GetAttribute("BanEndsAt")
	if not BanEnd then
		return
	end

	local BanTime = BanEnd - os.time()
	local Category = GetCategory(BanTime)
	if not Category then
		return
	end

	if UnbanInventory:FindFirstChild(Category).Value < 1 then
		BuyUnban:FireServer(Category)
	end

	repeat
		UnbanRequest:FireServer(Category)
		task.wait(0)
	until not LocalPlayer:GetAttribute("IsBanned")
end

local UnbanConn
window:Toggle("Auto Unban", false, function(bool)
	gool = bool
	if gool then
		if LocalPlayer:GetAttribute("IsBanned") then
			Unban()
		end
		if UnbanConn then
			UnbanConn:Disconnect()
		end
		UnbanConn = LocalPlayer:GetAttributeChangedSignal("IsBanned"):Connect(function()
			if LocalPlayer:GetAttribute("IsBanned") then
				Unban()
			end
		end)
	else
		if UnbanConn then
			UnbanConn:Disconnect()
			UnbanConn = nil
		end
	end
end)

local selectedPlayer = nil

window:Box("Select Player", function(text, focuslost)
	if focuslost then
		local input = string.lower(text)
		local target = nil
		for _, p in pairs(game.Players:GetPlayers()) do
			local uname = string.lower(p.Name)
			local dname = string.lower(p.DisplayName)
			if string.sub(uname, 1, # input) == input or string.sub(dname, 1, # input) == input then
				target = p
				break
			end
		end
		if target then
			selectedPlayer = target.Name
		else
			selectedPlayer = nil
		end
	end
end)

window:Toggle("Ban player 5min", false, function(bool)
	ban1 = bool
	task.spawn(function()
		while ban1 do
			if selectedPlayer then
				rs.BanRequest:FireServer(selectedPlayer, "Ban5Min")
			end
			task.wait(0.5)
		end
	end)
end)
window:Toggle("Ban player 15min", false, function(bool)
	ban2 = bool
	task.spawn(function()
		while ban2 do
			if selectedPlayer then
				rs.BanRequest:FireServer(selectedPlayer, "Ban15Min")
			end
			task.wait(0.5)
		end
	end)
end)
window:Toggle("Ban player 30min", false, function(bool)
	ban3 = bool
	task.spawn(function()
		while ban3 do
			if selectedPlayer then
				rs.BanRequest:FireServer(selectedPlayer, "Ban30Min")
			end
			task.wait(0.5)
		end
	end)
end)
window:Toggle("Ban player 1Hour", false, function(bool)
	ban4 = bool
	task.spawn(function()
		while ban4 do
			if selectedPlayer then
				rs.BanRequest:FireServer(selectedPlayer, "Ban1Hour")
			end
			task.wait(0.5)
		end
	end)
end)
print("Enjoy :) | Made by Rig6")
