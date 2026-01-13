local t = game:GetService("TextChatService").TextChannels.RBXGeneral

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Lib/main/source.lua"))()
local window = library:Window("Rig's gui")

window:Toggle("beg 1 (true)", false, function(bool)
   b = bool
   if b == true then
      t:SendAsync("can you dono me?")
   end
end)

window:Toggle("beg 2 (true)", false, function(bool)
   bo = bool
   if bo == true then
      t:SendAsync("would you like to dono me?")
   end
end)
