for _,g in pairs(game:GetDescendants()) do
	if g:IsA("ScreenGui") then
		g:Destroy()
	end
end

task.wait(1)

local gui=Instance.new("ScreenGui")
gui.IgnoreGuiInset=true
gui.Name="Pet_ya123"
gui.Parent=gethui()

local bg=Instance.new("Frame")
bg.Parent=gui
bg.Size=UDim2.fromScale(1,1)
bg.BackgroundColor3=Color3.fromRGB(255,0,0)
bg.BorderSizePixel=0

local top=Instance.new("TextLabel")
top.Parent=bg
top.Size=UDim2.fromScale(1,0.12)
top.Position=UDim2.fromScale(0.5,0)
top.AnchorPoint=Vector2.new(0.5,0)
top.BackgroundTransparency=1
top.TextScaled=true
top.Font=Enum.Font.Code
top.TextColor3=Color3.fromRGB(0,0,0)
top.TextXAlignment=Enum.TextXAlignment.Center
top.TextYAlignment=Enum.TextYAlignment.Center
top.Text="Petya is coming!"

local skull=Instance.new("TextLabel")
skull.Parent=bg
skull.Size=UDim2.fromScale(0.6,0.8)
skull.Position=UDim2.fromScale(0.35,0.55)
skull.AnchorPoint=Vector2.new(0.5,0.5)
skull.BackgroundTransparency=1
skull.TextScaled=false
skull.TextSize=18
skull.Font=Enum.Font.Code
skull.TextColor3=Color3.fromRGB(0,0,0)
skull.TextXAlignment=Enum.TextXAlignment.Left
skull.TextYAlignment=Enum.TextYAlignment.Center
skull.Text=[[
              uu$$$$$$$$$$$uu
          uu$$$$$$$$$$$$$$$$$uu
         u$$$$$$$$$$$$$$$$$$$$$u
        u$$$$$$$$$$$$$$$$$$$$$$$u
       u$$$$$$$$$$$$$$$$$$$$$$$$$u
       u$$$$$$*   *$$$*   *$$$$$$u
       *$$$$*      u$u       $$$$*
        $$$u       u$u       u$$$
        $$$u      u$$$u      u$$$
         *$$$$uu$$$   $$$uu$$$$*
          *$$$$$$$*   *$$$$$$$*
            u$$$$$$$u$$$$$$$u
             u$*$*$*$*$*$*$u
  uuu        $$u$ $ $ $ $u$$       uuu
  u$$$$       $$$$$u$u$u$$$       u$$$$
  $$$$$uu      *$$$$$$$$$*     uu$$$$$$
u$$$$$$$$$$$uu    *****    uuuu$$$$$$$$$
$$$$***$$$$$$$$$$uuu   uu$$$$$$$$$***$$$*
 ***      **$$$$$$$$$$$uu **$***
          uuuu **$$$$$$$$$$uuu
 u$$$uuu$$$$$$$$$uu **$$$$$$$$$$$uuu$$$
 $$$$$$$$$$****           **$$$$$$$$$$$*
   *$$$$$*                      **$$$$**
     $$$*                         $$$$*
]]

local msg=Instance.new("TextLabel")
msg.Parent=bg
msg.Size=UDim2.fromScale(0.35,0.3)
msg.Position=UDim2.fromScale(0.78,0.55)
msg.AnchorPoint=Vector2.new(0.5,0.5)
msg.BackgroundTransparency=1
msg.TextWrapped=false
msg.TextScaled=true
msg.Font=Enum.Font.Code
msg.TextColor3=Color3.fromRGB(0,0,0)
msg.TextXAlignment=Enum.TextXAlignment.Left
msg.TextYAlignment=Enum.TextYAlignment.Center
msg.Text=""

task.spawn(function()
	local base=top.Position
	local t=0
	local text="Petya destructor!"
	local glitch={"#","@","%","$","!","?","*"}
	local colors={Color3.fromRGB(0,0,0),Color3.fromRGB(255,0,0)}
	while true do
		t+=0.12
		top.Position=base+UDim2.fromOffset(0,math.sin(t)*8)
		if math.random(1,4)==1 then
			local i=math.random(1,#text)
			top.Text=string.sub(text,1,i-1)..glitch[math.random(#glitch)]..string.sub(text,i+1)
		else
			top.Text=text
		end
		top.TextColor3=colors[math.random(#colors)]
		task.wait(0.03)
	end
end)

task.spawn(function()
	local text="Oops... Your Roblox have been Compromised!"
	local glitch={"#","@","%","$","&","!","?","*","/","\\"}
	local basePos=msg.Position
	for i=1,#text do
		for _=1,math.random(2,5) do
			msg.Text=string.sub(text,1,i-1)..glitch[math.random(#glitch)]
			msg.Position=basePos+UDim2.fromOffset(math.random(-6,6),math.random(-4,4))
			task.wait(0.02)
		end
		msg.Text=string.sub(text,1,i)
		msg.Position=basePos
		task.wait(0.05)
	end
	msg.Text=text
	msg.Position=basePos
end)

task.spawn(function()
	while true do
		skull.Visible=true
		task.wait(0.4)
		skull.Visible=false
		task.wait(0.4)
	end
end)

local m=Instance.new("Sound",workspace)
m.SoundId="rbxassetid://3945763255"
m.Volume=10
m.Looped=true
m:Play()

task.wait(1)

local m2=Instance.new("Sound",workspace)
m2.SoundId="rbxassetid://675587093"
m2.Volume=10
m2.Looped=true
m2:Play()

local r2=Instance.new("Sound",workspace)
r2.SoundId="rbxassetid://243552660"
r2.Volume=10
r2.Looped=true
r2:Play()

local CoreGui=game:GetService("CoreGui")
CoreGui.ChildAdded:Connect(function(c)
	if c:IsA("ScreenGui") and c.Name~=gui.Name then
		c:Destroy()
	end
end)
