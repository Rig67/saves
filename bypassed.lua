local sounds = {
    {"espresso macchiato", 133101411205559},
    {"furry tik tok sound", 72075853222295},
    {"chinise song", 134713831368801},
    {"chicken dih", 132734127940213},
    {"idk what to say w", 117035648141045},
    {"krabs meme", 113460632982556},
    {"snickers meme", 87702011064488},
    {"snickers v2", 95414645600785},
    {"slave loud meme", 118240228297368},
    {"meow meow", 93196133444345},
    {"chill af music", 137155874195108},
    {"viral song", 75918642767991},
    {"neyga song", 94625860335523},
    {"alvin hitler", 105518265476544},
    {"hitler speech", 122325391756999},
    {"again idk", 127877705375546},
    {"ishoot so far", 117499468703291},
    {"quiet", 109024895932241},
    {"quiet alt", 93184625436134},
    {"funny pitch", 114730045175047},
    {"asgore new song | pitch 0.2", 133952144902631, 0.2},
    {"chipmunk beat dick | pitch 0.17", 72241143781220, 0.17},
    {"italian brainrot", 137774485302251},
    {"idk fire", 122721621515336},
    {"n word fire spam", 84013056797620},
    {"pilipinos", 7732207884},
    {"can you hear me", 4769589095},
    {"mincraft ransom", 107042626686342},
    {"funi musiek", 137925923193604},
    {"crying goblin", 82299572312177},
    {"yapping royale", 128801234616968},
    {"quagmire", 9369228943340},
    {"tante bokep", 9087024260},
    {"Arabic thingy", 9108676586},
    {"kerosene", 17647322226},
    {"Vietnam thingy", 4699831936},
    {"mente ma funk", 98337901681441},
    {"feipo ye feipo", 74856563303589},
    {"thailand fire beat", 107283741377032},
    {"nigger nigger", 88325934407038},
    {"jet 2 holiday", 92424176775385},
    {"loud alarm", 100573500376225},
    {"nicah", 8848794078},
    {"like a nigger", 2305098011},
    {"dry metal", 348401846},
    {"loud dog laugh", 8449305114},
    {"laughing louding", 8255804165},
    {"lalala lala", 17338568573},
    {"crazy laugh", 17488592217},
    {"back to the lobby", 85435166429333},
    {"one pound fish", 91301048841024},
    {"fortinayt babaji", 9104349607},
    {"earrape", 9086666231},
    {"Sari roti", 9075261161},
    {"nigga in my balls", 15898533857},
    {"Bad happening funk", 70661591361974},
    {"spooky funk", 100828050594137},
    {"mr prayut", 2466157206},
    {"yaa lew", 101665290190164},
    {"nigga spam", 101339975265065},
    {"chinese niga", 8491769438},
    {"tor monitor", 70633665224310},
    {"dirty shoe funk", 105262186169300},
    {"angry men", 7334239757},
    {"nigga ney nye", 14366097861},
    {"idk", 17106076207}, 
    {"another Arabic", 7127692762},
    {"uhhh", 78503803116382},
    {"some earrape", 16519552583},
    {"another earrape..", 18703028431},
    {"chinese shit", 128815249670543},
    {"nigga ney ney earrape", 14366097861},
    {"earrape 69", 75170658014810},
    {"anotha earrap", 94236269998280},
   {"chines",131261455908170}
}

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = gethui()
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 450)
frame.Position = UDim2.new(0, 50, 0, 50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = gui
frame.Active = true

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
title.TextColor3 = Color3.new(1,1,1)
title.Text = "Bypassed Audios"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.Parent = frame

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 1, -70)
scrollingFrame.Position = UDim2.new(0, 0, 0, 30)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #sounds * 35)
scrollingFrame.ScrollBarThickness = 6
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.Parent = frame

local uiList = Instance.new("UIListLayout")
uiList.Parent = scrollingFrame
uiList.Padding = UDim.new(0, 4)

local currentSound

for _, data in ipairs(sounds) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.SourceSansItalic
    btn.TextSize = 18
    btn.Text = data[1]
    btn.Parent = scrollingFrame
    Instance.new("UICorner",btn)
    btn.MouseButton1Click:Connect(function()
        if setclipboard then
            if data[3] then
                setclipboard(tostring(data[2]) .. " | pitch " .. tostring(data[3]))
            else
                setclipboard(tostring(data[2]))
            end
        end
        if currentSound then
            currentSound:Stop()
            currentSound:Destroy()
            currentSound = nil
        end
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. data[2]
        sound.Volume = 1
        if data[3] then
            sound.PlaybackSpeed = data[3]
        end
        sound.Parent = workspace
        sound:Play()
        currentSound = sound
        sound.Ended:Connect(function()
            if sound == currentSound then
                currentSound = nil
            end
            sound:Destroy()
        end)
    end)
end

local stopBtn = Instance.new("TextButton")
stopBtn.Size = UDim2.new(1, -20, 0, 30)
stopBtn.Position = UDim2.new(0, 10, 1, -35)
stopBtn.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
stopBtn.TextColor3 = Color3.new(1,1,1)
stopBtn.Font = Enum.Font.SourceSansItalic
stopBtn.TextSize = 18
stopBtn.Text = "Stop Audio"
stopBtn.Parent = frame
Instance.new("UICorner",stopBtn)
stopBtn.MouseButton1Click:Connect(function()
    if currentSound then
        currentSound:Stop()
        currentSound:Destroy()
        currentSound = nil
    end
end)
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

local frame = frame

local dragging, dragInput, dragStart, startPos
local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function update(input)
    local delta = input.Position - dragStart
    local newPos = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
    TS:Create(frame, tweenInfo, {Position = newPos}):Play()
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
