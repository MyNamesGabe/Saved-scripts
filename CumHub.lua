if game.PlaceId == 286090429 then


local library = loadstring(game:HttpGet("https://paste.ee/r/Gi2w7/0", true))() -- cal the lib
local a = library:NewWindow("Cum","HUB") -- Change to anything
local b = a:NewSection("Local")
local s= a:NewSection(" Visual")
local d= a:NewSection("Aimbot")
local g= a:NewSection(" GunMods")
local e= a:NewSection(" Main")
local ss= a:NewSection(" Settings")



b:Box("Walkspeed",function(a)
   game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPropertyChangedSignal("WalkSpeed"):Connect(function()
setpropvalue(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"), "WalkSpeed", a)
end)
end)

b:Box("JumpPower",function(a)
   game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPropertyChangedSignal("JumpPower"):Connect(function()
setpropvalue(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"), "JumpPower", a)
end)
end)


local infjumpenabled = false

game:GetService("UserInputService").JumpRequest:Connect(function()
	if infjumpenabled then
		game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState("Jumping")
	end
end)

b:Toggle("Infnite Jump",function(a)
    	infjumpenabled = a
end)

b:Button("Invisible ",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/Cesare0328/my-scripts/main/arsenal%20inv.lua'),true))()

end)

b:Button("Fly (F)",function()
repeat wait() 
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
local plr = game.Players.LocalPlayer 
local torso = plr.Character.Head 
local flying = false
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 50 
local speed = 50

function Fly() 
local bg = Instance.new("BodyGyro", torso) 
bg.P = 9e4 
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
bg.cframe = torso.CFrame 
local bv = Instance.new("BodyVelocity", torso) 
bv.velocity = Vector3.new(0,0.1,0) 
bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
repeat wait() 
plr.Character.Humanoid.PlatformStand = true 
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
speed = speed+.50+(speed/maxspeed) 
if speed > maxspeed then 
speed = maxspeed 
end 
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
speed = speed-1 
if speed < 0 then 
speed = 0 
end 
end 
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
else 
bv.velocity = Vector3.new(0,0.1,0) 
end 
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
until not flying 
ctrl = {f = 0, b = 0, l = 0, r = 0} 
lastctrl = {f = 0, b = 0, l = 0, r = 0} 
speed = 50
bg:Destroy() 
bv:Destroy() 
plr.Character.Humanoid.PlatformStand = false 
end 
mouse.KeyDown:connect(function(key) 
if key:lower() == "f" then 
if flying then flying = false 
else 
flying = true 
Fly() 
end 
elseif key:lower() == "w" then 
ctrl.f = 1 
elseif key:lower() == "s" then 
ctrl.b = -1 
elseif key:lower() == "a" then 
ctrl.l = -1 
elseif key:lower() == "d" then 
ctrl.r = 1 
end 
end) 
mouse.KeyUp:connect(function(key) 
if key:lower() == "w" then 
ctrl.f = 0 
elseif key:lower() == "s" then 
ctrl.b = 0 
elseif key:lower() == "a" then 
ctrl.l = 0 
elseif key:lower() == "d" then 
ctrl.r = 0 
end 
end)
Fly()
end)

b:Button("Noclip (B)",function()
wait(0.3)
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Noclip !";
	Text = "Press b to toggle noclip! ";
})
loadstring(game:HttpGet("https://pastebin.com/raw/8MySbHzS", true))()
end)

----esp




local ESPEnabled = false
local DistanceEnabled = true
local TracersEnabled = true

pcall(function()
	
	Camera = game:GetService("Workspace").CurrentCamera
	RunService = game:GetService("RunService")
	camera = workspace.CurrentCamera
	Bottom = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)

	function GetPoint(vector3)
		local vector, onScreen = camera:WorldToScreenPoint(vector3)
		return {Vector2.new(vector.X,vector.Y),onScreen,vector.Z}
	end
	
	function MakeESP(model)
		local CurrentParent = model.Parent
	
		local TopL = Drawing.new("Line")
		local BottomL = Drawing.new("Line")
		local LeftL = Drawing.new("Line")
		local RightL = Drawing.new("Line")
		local Tracer = Drawing.new("Line")
		local Display = Drawing.new("Text")

        coroutine.resume(coroutine.create(function()
			while model.Parent == CurrentParent do
				
				local Distance = (Camera.CFrame.Position - model.HumanoidRootPart.Position).Magnitude
                local GetP = GetPoint(model.Head.Position)
                local headps = model.Head.CFrame
                
				if ESPEnabled and GetP[2] then
					
                    -- Calculate Cords
                    local topright = headps * CFrame.new(3,0.5, 0)
                    local topleft = headps * CFrame.new(-3,0.5, 0)
                    local bottomleft = headps * CFrame.new(-3,-7,0)
                    local bottomright = headps * CFrame.new(3,-7,0)
					topright = GetPoint(topright.p)[1]
					topleft = GetPoint(topleft.p)[1]
					bottomleft = GetPoint(bottomleft.p)[1]
					bottomright = GetPoint(bottomright.p)[1]

                    local teamcolor = game:GetService("Players")[model.Name].TeamColor.Color or Color3.fromRGB(0,0,0)
                    TopL.Color, BottomL.Color, RightL.Color, LeftL.Color = teamcolor, teamcolor, teamcolor, teamcolor
                    TopL.From, BottomL.From, RightL.From, LeftL.From = topleft, bottomleft, topright, topleft
                    TopL.To, BottomL.To, RightL.To, LeftL.To = topright, bottomright, bottomright, bottomleft
					TopL.Visible, BottomL.Visible, RightL.Visible, LeftL.Visible = true, true, true, true
				else
					TopL.Visible, BottomL.Visible, RightL.Visible, LeftL.Visible = false, false, false, false
                end
                
				if ESPEnabled and TracersEnabled and GetP[2] then
					Tracer.Color = game:GetService("Players")[model.Name].TeamColor.Color or Color3.fromRGB(0,0,0)
					Tracer.From = Bottom
					Tracer.To = GetPoint(headps.p)[1]
					Tracer.Thickness = 1.5
					Tracer.Visible = true
				else
					Tracer.Visible = false
                end
                
				if ESPEnabled and DistanceEnabled and GetP[2] then
					Display.Visible = true
					Display.Position = GetPoint(headps.p + Vector3.new(0,0.5,0))[1]
					Display.Center = true
					Display.Text = tostring(math.floor(Distance)).." studs"
				else
					Display.Visible = false
                end
                
				RunService.RenderStepped:Wait()
			end
	
			TopL:Remove()
			BottomL:Remove()
			RightL:Remove()
			LeftL:Remove()
			Tracer:Remove()
			Display:Remove()
        
        end))
    end
    
	for _, Player in next, game:GetService("Players"):GetChildren() do
		if Player.Name ~= game.Players.LocalPlayer.Name then
			MakeESP(Player.Character)
			Player.CharacterAdded:Connect(function()
				delay(0.5, function()
					MakeESP(Player.Character)
				end)
			end)
		end	
	end
	
	game:GetService("Players").PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            delay(0.5, function()
                MakeESP(player.Character)
            end)
		end)
	end)
	
end)


s:Toggle("ESP",function(t)
    ESPEnabled = t
end)

s:Toggle("Tracers",function(t)
    TracersEnabled = t
end)

s:Toggle("Distance Display",function(t)
    DistanceEnabled = t
end)


local txt  = s:Text("Advanced ESP")

s:Button("Username Esp",function()
loadstring(game:HttpGet("https://pastebin.com/raw/nrnX4fQC", true))()

end)

s:Button("Box Esp",function()
    local Holder = Instance.new("Folder", game.CoreGui)
Holder.Name = "ESP"

local UpdateFuncs = {}

local Box = Instance.new("BoxHandleAdornment")
Box.Name = "nilBox"
Box.Size = Vector3.new(4, 7, 4)
Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Box.Transparency = 0.7
Box.ZIndex = 0
Box.AlwaysOnTop = true
Box.Visible = true

local NameTag = Instance.new("BillboardGui")
NameTag.Name = "nilNameTag"
NameTag.Enabled = false
NameTag.Size = UDim2.new(0, 200, 0, 50)
NameTag.AlwaysOnTop = true
NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
local Tag = Instance.new("TextLabel", NameTag)
Tag.Name = "Tag"
Tag.BackgroundTransparency = 1
Tag.Position = UDim2.new(0, -50, 0, 0)
Tag.Size = UDim2.new(0, 300, 0, 20)
Tag.TextSize = 20
Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
Tag.TextStrokeTransparency = 0.4
Tag.Text = "nil"
Tag.Font = Enum.Font.SourceSansBold
Tag.TextScaled = false

local LoadCharacter = function(v)
	repeat wait() until v.Character ~= nil
	v.Character:WaitForChild("Humanoid")
	local vHolder = Holder:FindFirstChild(v.Name)
	vHolder:ClearAllChildren()
	local b = Box:Clone()
	b.Name = v.Name .. "Box"
	b.Adornee = v.Character
	b.Parent = vHolder
	local t = NameTag:Clone()
	t.Name = v.Name .. "NameTag"
	t.Enabled = true
	t.Parent = vHolder
	t.Adornee = v.Character:WaitForChild("Head", 5)
	if not t.Adornee then
		return UnloadCharacter(v)
	end
	t.Tag.Text = v.Name
	b.Color3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	t.Tag.TextColor3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	local UpdateNameTag = function()
		if not pcall(function()
			--v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			local maxh = math.floor(v.Character.Humanoid.MaxHealth)
			local h = math.floor(v.Character.Humanoid.Health)
			t.Tag.Text = v.Name .. "\n" .. ((maxh ~= 0 and tostring(math.floor((h / maxh) * 100))) or "0") .. "%  " .. tostring(h) .. "/" .. tostring(maxh)
		end) then
			UpdateFuncs[v] = nil
		end
	end
	UpdateNameTag()
	UpdateFuncs[v] = UpdateNameTag
end

local UnloadCharacter = function(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
		vHolder:ClearAllChildren()
	end
end

local LoadPlayer = function(v)
	local vHolder = Instance.new("Folder", Holder)
	vHolder.Name = v.Name
	v.CharacterAdded:Connect(function()
		pcall(LoadCharacter, v)
	end)
	v.CharacterRemoving:Connect(function()
		pcall(UnloadCharacter, v)
	end)
	LoadCharacter(v)
end

local UnloadPlayer = function(v)
	UnloadCharacter(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder then
		vHolder:Destroy()
	end
end

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	spawn(function() pcall(LoadPlayer, v) end)
end

game:GetService("Players").PlayerAdded:Connect(function(v)
	pcall(LoadPlayer, v)
end)

game:GetService("Players").PlayerRemoving:Connect(function(v)
	pcall(UnloadPlayer, v)
end)

game.ItemChanged:Connect(function(i, v)
	if i:IsA("Player") and v == "TeamColor" then
		if Holder:FindFirstChild(i.Name) then
			UnloadCharacter(i)
			wait()
			LoadCharacter(i)
		end
	elseif i:IsA("Humanoid") and i.Parent then
		local p = game:GetService("Players"):GetPlayerFromCharacter(i.Parent)
		if p and Holder:FindFirstChild(p.Name) then
			UpdateFuncs[p]()
		end
	end
end)

game:GetService("Players").LocalPlayer.NameDisplayDistance = 0
game:GetService("Players").LocalPlayer.HealthDisplayDistance = 0
    end)





game.Players.PlayerAdded:Connect(function(v)
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Visible = false
    BoxOutline.Color = Color3.new(0,0,0)
    BoxOutline.Thickness = 3
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.new(1,1,1)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    local HealthBarOutline = Drawing.new("Square")
    HealthBarOutline.Thickness = 3
    HealthBarOutline.Filled = false
    HealthBarOutline.Color = Color3.new(0,0,0)
    HealthBarOutline.Transparency = 1
    HealthBarOutline.Visible = false

    local HealthBar = Drawing.new("Square")
    HealthBar.Thickness = 1
    HealthBar.Filled = false
    HealthBar.Transparency = 1
    HealthBar.Visible = false

    function boxesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                if onScreen then
                    BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                    BoxOutline.Visible = true

                    Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                    Box.Visible = true

                    HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                    HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                    HealthBarOutline.Visible = true

                    HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / math.clamp(game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value, 0, game:GetService("Players")[v.Character.Name].NRPBS:WaitForChild("MaxHealth").Value)))
                    HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1/HealthBar.Size.Y))
		    HealthBar.Color = Color3.fromRGB(255 - 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 0)                    
		    HealthBar.Visible = true

                    if v.TeamColor == lplr.TeamColor then
                        --- Our Team
                        BoxOutline.Visible = false
                        Box.Visible = false
                        HealthBarOutline.Visible = false
                        HealthBar.Visible = false
                    else
                        ---Enemy Team
                        BoxOutline.Visible = true
                        Box.Visible = true
                        HealthBarOutline.Visible = true
                        HealthBar.Visible = true
                    end

                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                    HealthBarOutline.Visible = false
                    HealthBar.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false
                HealthBarOutline.Visible = false
                HealthBar.Visible = false
            end
        end)
    end
    coroutine.wrap(boxesp)()
end)





local aimbotsettings = {
    enabled = false,
    freeforall = false,
    radius = 2500,
    wallcheck = true
}

local players = game:GetService("Players")
local client = players.LocalPlayer
local inputservice = game:GetService("UserInputService")
local mouse = client:GetMouse()
local runservice = game:GetService("RunService")
local aim = false

function GetMouse()
    return Vector2.new(mouse.X, mouse.Y)
end

inputservice.InputBegan:Connect(function(key)
    if key.UserInputType == Enum.UserInputType.MouseButton2 then
        aim = true
    end
end)

inputservice.InputEnded:Connect(function(key)
    if key.UserInputType == Enum.UserInputType.MouseButton2 then
        aim = false
    end
end)

function FreeForAll(targetplayer)
    if aimbotsettings.freeforall == false then
        if client.Team == targetplayer.Team then return false
        else return true end
    else return true end
end

function NotObstructing(destination, ignore)
    if aimbotsettings.wallcheck then
        Origin = workspace.CurrentCamera.CFrame.p
        CheckRay = Ray.new(Origin, destination- Origin)
        Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore)
        return Hit == nil
    else
        return true
    end
end

function GetClosestToCuror()
    MousePos = GetMouse()
    Radius = aimbotsettings.radius
    Closest = math.huge
    Target = nil
    for _,v in pairs(game:GetService("Players"):GetPlayers()) do
        if FreeForAll(v) then
            if v.Character:FindFirstChild("Head") and v ~= game.Players.LocalPlayer then
                Point,OnScreen = workspace.CurrentCamera:WorldToViewportPoint(v.Character.Head.Position)
                clientchar = client.Character
                if OnScreen and NotObstructing(v.Character.Head.Position,{clientchar,v.Character}) then
                    Distance = (Vector2.new(Point.X,Point.Y) - MousePos).magnitude
                    if Distance < math.min(Radius,Closest) then
                        Closest = Distance
                        Target = v
                    end
                end
            end
        end
    end
    return Target
end 

runservice.RenderStepped:Connect(function()
    if aimbotsettings.enabled == false or aim == false then return end
    ClosestPlayer = GetClosestToCuror()
    if ClosestPlayer then
        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p,ClosestPlayer.Character.Head.CFrame.p)
    end
end)
   


local txt  = d:Text("Aimbot")
 aimbotsettings.wallcheck = false
d:Toggle("Enable",function(t)
    aimbotsettings.enabled = t
end)

d:Toggle("WallCheck",function(t)

    aimbotsettings.wallcheck = t
end)

d:Toggle("Free For All",function(t)
    aimbotsettings.freeforall = t
end)


g:Toggle("Wallbang",function(Value) --wallbang fix
if toggle5 == false
then toggle5 = true
    
    shared.WB = false
shared.Key = 't'

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(Key)
    if Key == shared.Key then
        shared.WB = not shared.WB
    end
end)

local mt = getrawmetatable(game)
local nc = mt.__namecall

setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    local Arguments = {...}
   
    if Method == 'FindPartOnRayWithIgnoreList' and shared.WB then
        table.insert(Arguments[2], game.GetService(game, 'Workspace').Map)
       
        return nc(self, unpack(Arguments))
    end
   
    return nc(self,...)
end)

    else
        toggle5 = false
        
        shared.WB = true
shared.Key = 't'

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(Key)
    if Key == shared.Key then
        shared.WB = not shared.WB
    end
end)

local mt = getrawmetatable(game)
local nc = mt.__namecall

setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    local Arguments = {...}
   
    if Method == 'FindPartOnRayWithIgnoreList' and shared.WB then
        table.insert(Arguments[2], game.GetService(game, 'Workspace').Map)
       
        return nc(self, unpack(Arguments))
    end
   
    return nc(self,...)
end)

end
end)


local txt  = d:Text("Advanced Aimbot")

d:Button("Coco Z Aimbot",function()
--[[
          _              _               _                    _         _   _         _               _          _        _          _    _       
        /\ \           /\ \             / /\                 /\ \      /\_\/\_\ _    / /\            /\ \       /\ \     /\ \    _ / /\ /\ \      
       /  \ \         /  \ \           / /  \                \ \ \    / / / / //\_\ / /  \          /  \ \      \_\ \    \ \ \  /_/ / //  \ \     
      / /\ \ \       / /\ \ \         / / /\ \               /\ \_\  /\ \/ \ \/ / // / /\ \        / /\ \ \     /\__ \    \ \ \ \___\// /\ \ \    
     / / /\ \ \     / / /\ \ \       / / /\ \ \             / /\/_/ /  \____\__/ // / /\ \ \      / / /\ \ \   / /_ \ \   / / /  \ \ \\/_/\ \ \   
    / / /  \ \_\   / / /  \ \_\     / / /  \ \ \           / / /   / /\/________// / /\ \_\ \    / / /  \ \_\ / / /\ \ \  \ \ \   \_\ \   / / /   
   / / /    \/_/  / / /    \/_/    / / /___/ /\ \         / / /   / / /\/_// / // / /\ \ \___\  / / /   / / // / /  \/_/   \ \ \  / / /  / / /    
  / / /          / / /            / / /_____/ /\ \       / / /   / / /    / / // / /  \ \ \__/ / / /   / / // / /           \ \ \/ / /  / / /  _  
 / / /________  / / /________    / /_________/\ \ \  ___/ / /__ / / /    / / // / /____\_\ \  / / /___/ / // / /             \ \ \/ /  / / /_/\_\ 
/ / /_________\/ / /_________\  / / /_       __\ \_\/\__\/_/___\\/_/    / / // / /__________\/ / /____\/ //_/ /               \ \  /  / /_____/ / 
\/____________/\/____________/  \_\___\     /____/_/\/_________/        \/_/ \/_____________/\/_________/ \_\/                 \_\/   \________/  

CC Aimbot V2 is a new version of the well known CC Aimbot,
CC Aimbot V2 (and it's older brother) is based of FPS GUI, a well known Aimbot
that works on most Games. CC Aimbot V2 brings a new Design, ESP, and Features.

CC Aimbot V2 is fully open-sourced, you can use it's source to make your own project,
but we ask you to credit CC Aimbot V2 / FPS GUI.

Designed by CocoCC

]]--

local CCAimbotV2 = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local BottomFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Page3 = Instance.new("ScrollingFrame")
local C1 = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")
local C2 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Text = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local SwitchFrame = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local SwitchButton = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local SwitchButtonLit = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local SwitchButtonActivator = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local C3 = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local Text_2 = Instance.new("TextLabel")
local UICorner_9 = Instance.new("UICorner")
local SwitchFrame_2 = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")
local SwitchButton_2 = Instance.new("Frame")
local UICorner_11 = Instance.new("UICorner")
local SwitchButtonLit_2 = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local SwitchButtonActivator_2 = Instance.new("TextButton")
local UICorner_13 = Instance.new("UICorner")
local C4 = Instance.new("Frame")
local UICorner_14 = Instance.new("UICorner")
local Text_3 = Instance.new("TextLabel")
local UICorner_15 = Instance.new("UICorner")
local SwitchFrame_3 = Instance.new("Frame")
local UICorner_16 = Instance.new("UICorner")
local SwitchButton_3 = Instance.new("Frame")
local UICorner_17 = Instance.new("UICorner")
local SwitchButtonLit_3 = Instance.new("Frame")
local UICorner_18 = Instance.new("UICorner")
local SwitchButtonActivator_3 = Instance.new("TextButton")
local UICorner_19 = Instance.new("UICorner")
local Page1 = Instance.new("ScrollingFrame")
local C1_2 = Instance.new("TextLabel")
local C2_2 = Instance.new("TextLabel")
local UICorner_20 = Instance.new("UICorner")
local C3_2 = Instance.new("TextLabel")
local UICorner_21 = Instance.new("UICorner")
local C4_2 = Instance.new("TextLabel")
local UICorner_22 = Instance.new("UICorner")
local UIListLayout_2 = Instance.new("UIListLayout")
local Page2 = Instance.new("ScrollingFrame")
local C1_3 = Instance.new("TextLabel")
local C3_3 = Instance.new("TextLabel")
local UICorner_23 = Instance.new("UICorner")
local UIListLayout_3 = Instance.new("UIListLayout")
local C2_3 = Instance.new("Frame")
local UICorner_24 = Instance.new("UICorner")
local Text_4 = Instance.new("TextLabel")
local UICorner_25 = Instance.new("UICorner")
local SwitchFrame_4 = Instance.new("Frame")
local UICorner_26 = Instance.new("UICorner")
local SwitchButton_4 = Instance.new("Frame")
local UICorner_27 = Instance.new("UICorner")
local SwitchButtonLit_4 = Instance.new("Frame")
local UICorner_28 = Instance.new("UICorner")
local SwitchButtonActivator_4 = Instance.new("TextButton")
local UICorner_29 = Instance.new("UICorner")
local Menu = Instance.new("ScrollingFrame")
local C1_4 = Instance.new("TextLabel")
local UIListLayout_4 = Instance.new("UIListLayout")
local C2_4 = Instance.new("Frame")
local UICorner_30 = Instance.new("UICorner")
local Text_5 = Instance.new("TextLabel")
local UICorner_31 = Instance.new("UICorner")
local SwitchFrame_5 = Instance.new("Frame")
local UICorner_32 = Instance.new("UICorner")
local SwitchButtonActivator_5 = Instance.new("TextButton")
local UICorner_33 = Instance.new("UICorner")
local C3_4 = Instance.new("Frame")
local UICorner_34 = Instance.new("UICorner")
local Text_6 = Instance.new("TextLabel")
local UICorner_35 = Instance.new("UICorner")
local SwitchFrame_6 = Instance.new("Frame")
local UICorner_36 = Instance.new("UICorner")
local SwitchButtonActivator_6 = Instance.new("TextButton")
local UICorner_37 = Instance.new("UICorner")
local C4_3 = Instance.new("Frame")
local UICorner_38 = Instance.new("UICorner")
local Text_7 = Instance.new("TextLabel")
local UICorner_39 = Instance.new("UICorner")
local SwitchFrame_7 = Instance.new("Frame")
local UICorner_40 = Instance.new("UICorner")
local SwitchButtonActivator_7 = Instance.new("TextButton")
local UICorner_41 = Instance.new("UICorner")
local TopFrame = Instance.new("Frame")
local UICorner_42 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Minimize = Instance.new("TextButton")
local Menu_2 = Instance.new("TextButton")

CCAimbotV2.Name = "CCAimbotV2"
CCAimbotV2.Parent = game.CoreGui
CCAimbotV2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = CCAimbotV2
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BackgroundTransparency = 1.000
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 195, 0, 160)

BottomFrame.Name = "BottomFrame"
BottomFrame.Parent = MainFrame
BottomFrame.AnchorPoint = Vector2.new(0.5, 0.5)
BottomFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BottomFrame.BorderSizePixel = 0
BottomFrame.ClipsDescendants = true
BottomFrame.Position = UDim2.new(0.5, 0, -1.5, 0)
BottomFrame.Size = UDim2.new(1, 0, 1, 0)

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = BottomFrame

Page3.Name = "Page3"
Page3.Parent = BottomFrame
Page3.Active = true
Page3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Page3.BackgroundTransparency = 1.000
Page3.BorderColor3 = Color3.fromRGB(27, 42, 53)
Page3.BorderSizePixel = 0
Page3.Position = UDim2.new(1.10000002, 0, 0.169, 0)
Page3.Size = UDim2.new(1, 0, 0.829999983, 0)
Page3.CanvasSize = UDim2.new(0, 0, 0.5, 0)
Page3.ScrollBarThickness = 3

C1.Name = "C1"
C1.Parent = Page3
C1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
C1.BackgroundTransparency = 1.000
C1.BorderSizePixel = 0
C1.ClipsDescendants = true
C1.Position = UDim2.new(0.0307692308, 0, 0, 0)
C1.Size = UDim2.new(0, 183, 0, 20)
C1.Font = Enum.Font.GothamBold
C1.Text = "Player"
C1.TextColor3 = Color3.fromRGB(255, 255, 255)
C1.TextScaled = true
C1.TextSize = 14.000
C1.TextWrapped = true
C1.TextXAlignment = Enum.TextXAlignment.Left

UIListLayout.Parent = Page3
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0.0299999993, 0)

C2.Name = "C2"
C2.Parent = Page3
C2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
C2.BorderSizePixel = 0
C2.Position = UDim2.new(0.0307692308, 0, 0.585116267, 0)
C2.Selectable = true
C2.Size = UDim2.new(0, 183, 0, 31)

UICorner_2.CornerRadius = UDim.new(0, 5)
UICorner_2.Parent = C2

Text.Name = "Text"
Text.Parent = C2
Text.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Text.BorderSizePixel = 0
Text.ClipsDescendants = true
Text.Position = UDim2.new(0.322404385, 0, 0, 0)
Text.Size = UDim2.new(0.677595615, 0, 1, 0)
Text.Font = Enum.Font.GothamBold
Text.Text = "Fly"
Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Text.TextSize = 15.000
Text.TextWrapped = true
Text.TextXAlignment = Enum.TextXAlignment.Left

UICorner_3.CornerRadius = UDim.new(0, 5)
UICorner_3.Parent = Text

SwitchFrame.Name = "SwitchFrame"
SwitchFrame.Parent = C2
SwitchFrame.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SwitchFrame.BorderSizePixel = 0
SwitchFrame.Position = UDim2.new(0.150000006, 0, 0.5, 0)
SwitchFrame.Size = UDim2.new(0.248549104, 0, 0.73299998, 0)

UICorner_4.CornerRadius = UDim.new(0, 5)
UICorner_4.Parent = SwitchFrame

SwitchButton.Name = "SwitchButton"
SwitchButton.Parent = SwitchFrame
SwitchButton.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButton.BackgroundColor3 = Color3.fromRGB(255, 71, 71)
SwitchButton.BorderSizePixel = 0
SwitchButton.Position = UDim2.new(0.239999995, 0, 0.5, 0)
SwitchButton.Size = UDim2.new(0.379000008, 0, 0.758000016, 0)

UICorner_5.CornerRadius = UDim.new(0, 5)
UICorner_5.Parent = SwitchButton

SwitchButtonLit.Name = "SwitchButtonLit"
SwitchButtonLit.Parent = SwitchButton
SwitchButtonLit.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButtonLit.BackgroundColor3 = Color3.fromRGB(101, 255, 90)
SwitchButtonLit.BackgroundTransparency = 1.000
SwitchButtonLit.BorderColor3 = Color3.fromRGB(27, 42, 53)
SwitchButtonLit.BorderSizePixel = 0
SwitchButtonLit.Position = UDim2.new(0.5, 0, 0.5, 0)
SwitchButtonLit.Size = UDim2.new(1, 0, 1, 0)

UICorner_6.CornerRadius = UDim.new(0, 5)
UICorner_6.Parent = SwitchButtonLit

SwitchButtonActivator.Name = "SwitchButtonActivator"
SwitchButtonActivator.Parent = SwitchFrame
SwitchButtonActivator.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButtonActivator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SwitchButtonActivator.BackgroundTransparency = 1.000
SwitchButtonActivator.BorderSizePixel = 0
SwitchButtonActivator.Position = UDim2.new(0.5, 0, 0.5, 0)
SwitchButtonActivator.Size = UDim2.new(1, 0, 1, 0)
SwitchButtonActivator.Font = Enum.Font.Gotham
SwitchButtonActivator.Text = ""
SwitchButtonActivator.TextColor3 = Color3.fromRGB(255, 255, 255)
SwitchButtonActivator.TextSize = 12.000

UICorner_7.CornerRadius = UDim.new(0, 5)
UICorner_7.Parent = SwitchButtonActivator

C3.Name = "C3"
C3.Parent = Page3
C3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
C3.BorderSizePixel = 0
C3.Position = UDim2.new(0.0307692308, 0, 0.585116267, 0)
C3.Selectable = true
C3.Size = UDim2.new(0, 183, 0, 31)

UICorner_8.CornerRadius = UDim.new(0, 5)
UICorner_8.Parent = C3

Text_2.Name = "Text"
Text_2.Parent = C3
Text_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Text_2.BorderSizePixel = 0
Text_2.ClipsDescendants = true
Text_2.Position = UDim2.new(0.322404385, 0, 0, 0)
Text_2.Size = UDim2.new(0.677595615, 0, 1, 0)
Text_2.Font = Enum.Font.GothamBold
Text_2.Text = "Noclip"
Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_2.TextSize = 15.000
Text_2.TextWrapped = true
Text_2.TextXAlignment = Enum.TextXAlignment.Left

UICorner_9.CornerRadius = UDim.new(0, 5)
UICorner_9.Parent = Text_2

SwitchFrame_2.Name = "SwitchFrame"
SwitchFrame_2.Parent = C3
SwitchFrame_2.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchFrame_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SwitchFrame_2.BorderSizePixel = 0
SwitchFrame_2.Position = UDim2.new(0.150000006, 0, 0.5, 0)
SwitchFrame_2.Size = UDim2.new(0.248549104, 0, 0.73299998, 0)

UICorner_10.CornerRadius = UDim.new(0, 5)
UICorner_10.Parent = SwitchFrame_2

SwitchButton_2.Name = "SwitchButton"
SwitchButton_2.Parent = SwitchFrame_2
SwitchButton_2.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButton_2.BackgroundColor3 = Color3.fromRGB(255, 71, 71)
SwitchButton_2.BorderSizePixel = 0
SwitchButton_2.Position = UDim2.new(0.239999995, 0, 0.5, 0)
SwitchButton_2.Size = UDim2.new(0.379000008, 0, 0.758000016, 0)

UICorner_11.CornerRadius = UDim.new(0, 5)
UICorner_11.Parent = SwitchButton_2

SwitchButtonLit_2.Name = "SwitchButtonLit"
SwitchButtonLit_2.Parent = SwitchButton_2
SwitchButtonLit_2.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButtonLit_2.BackgroundColor3 = Color3.fromRGB(101, 255, 90)
SwitchButtonLit_2.BackgroundTransparency = 1.000
SwitchButtonLit_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
SwitchButtonLit_2.BorderSizePixel = 0
SwitchButtonLit_2.Position = UDim2.new(0.5, 0, 0.5, 0)
SwitchButtonLit_2.Size = UDim2.new(1, 0, 1, 0)

UICorner_12.CornerRadius = UDim.new(0, 5)
UICorner_12.Parent = SwitchButtonLit_2

SwitchButtonActivator_2.Name = "SwitchButtonActivator"
SwitchButtonActivator_2.Parent = SwitchFrame_2
SwitchButtonActivator_2.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButtonActivator_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SwitchButtonActivator_2.BackgroundTransparency = 1.000
SwitchButtonActivator_2.BorderSizePixel = 0
SwitchButtonActivator_2.Position = UDim2.new(0.5, 0, 0.5, 0)
SwitchButtonActivator_2.Size = UDim2.new(1, 0, 1, 0)
SwitchButtonActivator_2.Font = Enum.Font.Gotham
SwitchButtonActivator_2.Text = ""
SwitchButtonActivator_2.TextColor3 = Color3.fromRGB(255, 255, 255)
SwitchButtonActivator_2.TextSize = 12.000

UICorner_13.CornerRadius = UDim.new(0, 5)
UICorner_13.Parent = SwitchButtonActivator_2

C4.Name = "C4"
C4.Parent = Page3
C4.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
C4.BorderSizePixel = 0
C4.Position = UDim2.new(0.0307692308, 0, 0.585116267, 0)
C4.Selectable = true
C4.Size = UDim2.new(0, 183, 0, 31)

UICorner_14.CornerRadius = UDim.new(0, 5)
UICorner_14.Parent = C4

Text_3.Name = "Text"
Text_3.Parent = C4
Text_3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Text_3.BorderSizePixel = 0
Text_3.ClipsDescendants = true
Text_3.Position = UDim2.new(0.322404385, 0, 0, 0)
Text_3.Size = UDim2.new(0.677595615, 0, 1, 0)
Text_3.Font = Enum.Font.GothamBold
Text_3.Text = "Infinite Jump"
Text_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_3.TextSize = 15.000
Text_3.TextWrapped = true
Text_3.TextXAlignment = Enum.TextXAlignment.Left

UICorner_15.CornerRadius = UDim.new(0, 5)
UICorner_15.Parent = Text_3

SwitchFrame_3.Name = "SwitchFrame"
SwitchFrame_3.Parent = C4
SwitchFrame_3.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchFrame_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SwitchFrame_3.BorderSizePixel = 0
SwitchFrame_3.Position = UDim2.new(0.150000006, 0, 0.5, 0)
SwitchFrame_3.Size = UDim2.new(0.248549104, 0, 0.73299998, 0)

UICorner_16.CornerRadius = UDim.new(0, 5)
UICorner_16.Parent = SwitchFrame_3

SwitchButton_3.Name = "SwitchButton"
SwitchButton_3.Parent = SwitchFrame_3
SwitchButton_3.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButton_3.BackgroundColor3 = Color3.fromRGB(255, 71, 71)
SwitchButton_3.BorderSizePixel = 0
SwitchButton_3.Position = UDim2.new(0.239999995, 0, 0.5, 0)
SwitchButton_3.Size = UDim2.new(0.379000008, 0, 0.758000016, 0)

UICorner_17.CornerRadius = UDim.new(0, 5)
UICorner_17.Parent = SwitchButton_3

SwitchButtonLit_3.Name = "SwitchButtonLit"
SwitchButtonLit_3.Parent = SwitchButton_3
SwitchButtonLit_3.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButtonLit_3.BackgroundColor3 = Color3.fromRGB(101, 255, 90)
SwitchButtonLit_3.BackgroundTransparency = 1.000
SwitchButtonLit_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
SwitchButtonLit_3.BorderSizePixel = 0
SwitchButtonLit_3.Position = UDim2.new(0.5, 0, 0.5, 0)
SwitchButtonLit_3.Size = UDim2.new(1, 0, 1, 0)

UICorner_18.CornerRadius = UDim.new(0, 5)
UICorner_18.Parent = SwitchButtonLit_3

SwitchButtonActivator_3.Name = "SwitchButtonActivator"
SwitchButtonActivator_3.Parent = SwitchFrame_3
SwitchButtonActivator_3.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButtonActivator_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SwitchButtonActivator_3.BackgroundTransparency = 1.000
SwitchButtonActivator_3.BorderSizePixel = 0
SwitchButtonActivator_3.Position = UDim2.new(0.5, 0, 0.5, 0)
SwitchButtonActivator_3.Size = UDim2.new(1, 0, 1, 0)
SwitchButtonActivator_3.Font = Enum.Font.Gotham
SwitchButtonActivator_3.Text = ""
SwitchButtonActivator_3.TextColor3 = Color3.fromRGB(255, 255, 255)
SwitchButtonActivator_3.TextSize = 12.000

UICorner_19.CornerRadius = UDim.new(0, 5)
UICorner_19.Parent = SwitchButtonActivator_3

Page1.Name = "Page1"
Page1.Parent = BottomFrame
Page1.Active = true
Page1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Page1.BackgroundTransparency = 1.000
Page1.BorderColor3 = Color3.fromRGB(27, 42, 53)
Page1.BorderSizePixel = 0
Page1.Position = UDim2.new(0, 0, 0.169, 0)
Page1.Size = UDim2.new(1, 0, 0.829999983, 0)
Page1.CanvasSize = UDim2.new(0, 0, 0.5, 0)
Page1.ScrollBarThickness = 3

C1_2.Name = "C1"
C1_2.Parent = Page1
C1_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
C1_2.BackgroundTransparency = 1.000
C1_2.BorderSizePixel = 0
C1_2.ClipsDescendants = true
C1_2.Position = UDim2.new(0.0307692308, 0, 0, 0)
C1_2.Size = UDim2.new(0, 183, 0, 20)
C1_2.Font = Enum.Font.GothamBold
C1_2.Text = "Aimbot"
C1_2.TextColor3 = Color3.fromRGB(255, 255, 255)
C1_2.TextScaled = true
C1_2.TextSize = 14.000
C1_2.TextWrapped = true
C1_2.TextXAlignment = Enum.TextXAlignment.Left

C2_2.Name = "C2"
C2_2.Parent = Page1
C2_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
C2_2.BorderSizePixel = 0
C2_2.ClipsDescendants = true
C2_2.Position = UDim2.new(0.0307692308, 0, 0, 0)
C2_2.Size = UDim2.new(0, 183, 0, 20)
C2_2.Font = Enum.Font.GothamBold
C2_2.Text = "Press E to Lock into Someone"
C2_2.TextColor3 = Color3.fromRGB(255, 255, 255)
C2_2.TextSize = 12.000
C2_2.TextWrapped = true
C2_2.TextXAlignment = Enum.TextXAlignment.Left

UICorner_20.CornerRadius = UDim.new(0, 5)
UICorner_20.Parent = C2_2

C3_2.Name = "C3"
C3_2.Parent = Page1
C3_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
C3_2.BorderSizePixel = 0
C3_2.ClipsDescendants = true
C3_2.Position = UDim2.new(0.0307692308, 0, 0, 0)
C3_2.Size = UDim2.new(0, 183, 0, 20)
C3_2.Font = Enum.Font.GothamBold
C3_2.Text = "Press O to toggle Team-Check"
C3_2.TextColor3 = Color3.fromRGB(255, 255, 255)
C3_2.TextSize = 12.000
C3_2.TextWrapped = true
C3_2.TextXAlignment = Enum.TextXAlignment.Left

UICorner_21.CornerRadius = UDim.new(0, 5)
UICorner_21.Parent = C3_2

C4_2.Name = "C4"
C4_2.Parent = Page1
C4_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
C4_2.BorderSizePixel = 0
C4_2.ClipsDescendants = true
C4_2.Position = UDim2.new(0.0307692308, 0, 0, 0)
C4_2.Size = UDim2.new(0, 183, 0, 20)
C4_2.Font = Enum.Font.GothamBold
C4_2.Text = "Team-Check : true"
C4_2.TextColor3 = Color3.fromRGB(255, 255, 255)
C4_2.TextSize = 12.000
C4_2.TextWrapped = true

UICorner_22.CornerRadius = UDim.new(0, 5)
UICorner_22.Parent = C4_2

UIListLayout_2.Parent = Page1
UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_2.Padding = UDim.new(0.0399999991, 0)

Page2.Name = "Page2"
Page2.Parent = BottomFrame
Page2.Active = true
Page2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Page2.BackgroundTransparency = 1.000
Page2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Page2.BorderSizePixel = 0
Page2.Position = UDim2.new(1.10000002, 0, 0.169, 0)
Page2.Size = UDim2.new(1, 0, 0.829999983, 0)
Page2.CanvasSize = UDim2.new(0, 0, 0.5, 0)
Page2.ScrollBarThickness = 3

C1_3.Name = "C1"
C1_3.Parent = Page2
C1_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
C1_3.BackgroundTransparency = 1.000
C1_3.BorderSizePixel = 0
C1_3.ClipsDescendants = true
C1_3.Position = UDim2.new(0.0307692308, 0, 0, 0)
C1_3.Size = UDim2.new(0, 183, 0, 20)
C1_3.Font = Enum.Font.GothamBold
C1_3.Text = "Visuals"
C1_3.TextColor3 = Color3.fromRGB(255, 255, 255)
C1_3.TextScaled = true
C1_3.TextSize = 14.000
C1_3.TextWrapped = true
C1_3.TextXAlignment = Enum.TextXAlignment.Left

C3_3.Name = "C3"
C3_3.Parent = Page2
C3_3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
C3_3.BorderSizePixel = 0
C3_3.ClipsDescendants = true
C3_3.Position = UDim2.new(0.0307692308, 0, 0, 0)
C3_3.Size = UDim2.new(0, 183, 0, 20)
C3_3.Font = Enum.Font.GothamBold
C3_3.Text = "Press T to Refresh ESP"
C3_3.TextColor3 = Color3.fromRGB(255, 255, 255)
C3_3.TextSize = 12.000
C3_3.TextWrapped = true
C3_3.TextXAlignment = Enum.TextXAlignment.Left

UICorner_23.CornerRadius = UDim.new(0, 5)
UICorner_23.Parent = C3_3

UIListLayout_3.Parent = Page2
UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_3.Padding = UDim.new(0.0399999991, 0)

C2_3.Name = "C2"
C2_3.Parent = Page2
C2_3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
C2_3.BorderSizePixel = 0
C2_3.Position = UDim2.new(0.0307692308, 0, 0.585116267, 0)
C2_3.Selectable = true
C2_3.Size = UDim2.new(0, 183, 0, 31)

UICorner_24.CornerRadius = UDim.new(0, 5)
UICorner_24.Parent = C2_3

Text_4.Name = "Text"
Text_4.Parent = C2_3
Text_4.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Text_4.BorderSizePixel = 0
Text_4.ClipsDescendants = true
Text_4.Position = UDim2.new(0.322404385, 0, 0, 0)
Text_4.Size = UDim2.new(0.677595615, 0, 1, 0)
Text_4.Font = Enum.Font.GothamBold
Text_4.Text = "ESP"
Text_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_4.TextSize = 15.000
Text_4.TextWrapped = true
Text_4.TextXAlignment = Enum.TextXAlignment.Left

UICorner_25.CornerRadius = UDim.new(0, 5)
UICorner_25.Parent = Text_4

SwitchFrame_4.Name = "SwitchFrame"
SwitchFrame_4.Parent = C2_3
SwitchFrame_4.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchFrame_4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SwitchFrame_4.BorderSizePixel = 0
SwitchFrame_4.Position = UDim2.new(0.150000006, 0, 0.5, 0)
SwitchFrame_4.Size = UDim2.new(0.248549104, 0, 0.73299998, 0)

UICorner_26.CornerRadius = UDim.new(0, 5)
UICorner_26.Parent = SwitchFrame_4

SwitchButton_4.Name = "SwitchButton"
SwitchButton_4.Parent = SwitchFrame_4
SwitchButton_4.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButton_4.BackgroundColor3 = Color3.fromRGB(255, 71, 71)
SwitchButton_4.BorderSizePixel = 0
SwitchButton_4.Position = UDim2.new(0.239999995, 0, 0.5, 0)
SwitchButton_4.Size = UDim2.new(0.379000008, 0, 0.758000016, 0)

UICorner_27.CornerRadius = UDim.new(0, 5)
UICorner_27.Parent = SwitchButton_4

SwitchButtonLit_4.Name = "SwitchButtonLit"
SwitchButtonLit_4.Parent = SwitchButton_4
SwitchButtonLit_4.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButtonLit_4.BackgroundColor3 = Color3.fromRGB(101, 255, 90)
SwitchButtonLit_4.BackgroundTransparency = 1.000
SwitchButtonLit_4.BorderColor3 = Color3.fromRGB(27, 42, 53)
SwitchButtonLit_4.BorderSizePixel = 0
SwitchButtonLit_4.Position = UDim2.new(0.5, 0, 0.5, 0)
SwitchButtonLit_4.Size = UDim2.new(1, 0, 1, 0)

UICorner_28.CornerRadius = UDim.new(0, 5)
UICorner_28.Parent = SwitchButtonLit_4

SwitchButtonActivator_4.Name = "SwitchButtonActivator"
SwitchButtonActivator_4.Parent = SwitchFrame_4
SwitchButtonActivator_4.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButtonActivator_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SwitchButtonActivator_4.BackgroundTransparency = 1.000
SwitchButtonActivator_4.BorderSizePixel = 0
SwitchButtonActivator_4.Position = UDim2.new(0.5, 0, 0.5, 0)
SwitchButtonActivator_4.Size = UDim2.new(1, 0, 1, 0)
SwitchButtonActivator_4.Font = Enum.Font.Gotham
SwitchButtonActivator_4.Text = ""
SwitchButtonActivator_4.TextColor3 = Color3.fromRGB(255, 255, 255)
SwitchButtonActivator_4.TextSize = 12.000

UICorner_29.CornerRadius = UDim.new(0, 5)
UICorner_29.Parent = SwitchButtonActivator_4

Menu.Name = "Menu"
Menu.Parent = BottomFrame
Menu.Active = true
Menu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Menu.BackgroundTransparency = 1.000
Menu.BorderColor3 = Color3.fromRGB(27, 42, 53)
Menu.BorderSizePixel = 0
Menu.Position = UDim2.new(1.10000002, 0, 0.169, 0)
Menu.Size = UDim2.new(1, 0, 0.829999983, 0)
Menu.CanvasSize = UDim2.new(0, 0, 0.5, 0)
Menu.ScrollBarThickness = 3

C1_4.Name = "C1"
C1_4.Parent = Menu
C1_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
C1_4.BackgroundTransparency = 1.000
C1_4.BorderSizePixel = 0
C1_4.ClipsDescendants = true
C1_4.Position = UDim2.new(0.0307692308, 0, 0, 0)
C1_4.Size = UDim2.new(0, 183, 0, 20)
C1_4.Font = Enum.Font.GothamBold
C1_4.Text = "Menu"
C1_4.TextColor3 = Color3.fromRGB(255, 255, 255)
C1_4.TextScaled = true
C1_4.TextSize = 14.000
C1_4.TextWrapped = true
C1_4.TextXAlignment = Enum.TextXAlignment.Left

UIListLayout_4.Parent = Menu
UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_4.Padding = UDim.new(0.0299999993, 0)

C2_4.Name = "C2"
C2_4.Parent = Menu
C2_4.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
C2_4.BorderSizePixel = 0
C2_4.Position = UDim2.new(0, 0, 0.607706606, 0)
C2_4.Selectable = true
C2_4.Size = UDim2.new(0, 183, 0, 31)

UICorner_30.CornerRadius = UDim.new(0, 5)
UICorner_30.Parent = C2_4

Text_5.Name = "Text"
Text_5.Parent = C2_4
Text_5.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Text_5.BorderSizePixel = 0
Text_5.ClipsDescendants = true
Text_5.Position = UDim2.new(0.191256836, 0, 0, 0)
Text_5.Size = UDim2.new(0.808743179, 0, 1, 0)
Text_5.Font = Enum.Font.GothamBold
Text_5.Text = "Aimbot"
Text_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_5.TextSize = 15.000
Text_5.TextWrapped = true
Text_5.TextXAlignment = Enum.TextXAlignment.Left

UICorner_31.CornerRadius = UDim.new(0, 5)
UICorner_31.Parent = Text_5

SwitchFrame_5.Name = "SwitchFrame"
SwitchFrame_5.Parent = C2_4
SwitchFrame_5.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchFrame_5.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SwitchFrame_5.BorderSizePixel = 0
SwitchFrame_5.Position = UDim2.new(0.0879999995, 0, 0.5, 0)
SwitchFrame_5.Size = UDim2.new(0.125, 0, 0.73299998, 0)

UICorner_32.CornerRadius = UDim.new(0, 5)
UICorner_32.Parent = SwitchFrame_5

SwitchButtonActivator_5.Name = "SwitchButtonActivator"
SwitchButtonActivator_5.Parent = SwitchFrame_5
SwitchButtonActivator_5.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButtonActivator_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SwitchButtonActivator_5.BackgroundTransparency = 1.000
SwitchButtonActivator_5.BorderSizePixel = 0
SwitchButtonActivator_5.Position = UDim2.new(0.5, 0, 0.5, 0)
SwitchButtonActivator_5.Size = UDim2.new(1, 0, 1, 0)
SwitchButtonActivator_5.Font = Enum.Font.Gotham
SwitchButtonActivator_5.Text = "<"
SwitchButtonActivator_5.TextColor3 = Color3.fromRGB(255, 255, 255)
SwitchButtonActivator_5.TextSize = 14.000

UICorner_33.CornerRadius = UDim.new(0, 5)
UICorner_33.Parent = SwitchButtonActivator_5

C3_4.Name = "C3"
C3_4.Parent = Menu
C3_4.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
C3_4.BorderSizePixel = 0
C3_4.Position = UDim2.new(0, 0, 0.607706606, 0)
C3_4.Selectable = true
C3_4.Size = UDim2.new(0, 183, 0, 31)

UICorner_34.CornerRadius = UDim.new(0, 5)
UICorner_34.Parent = C3_4

Text_6.Name = "Text"
Text_6.Parent = C3_4
Text_6.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Text_6.BorderSizePixel = 0
Text_6.ClipsDescendants = true
Text_6.Position = UDim2.new(0.191256836, 0, 0, 0)
Text_6.Size = UDim2.new(0.808743179, 0, 1, 0)
Text_6.Font = Enum.Font.GothamBold
Text_6.Text = "Visuals"
Text_6.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_6.TextSize = 15.000
Text_6.TextWrapped = true
Text_6.TextXAlignment = Enum.TextXAlignment.Left

UICorner_35.CornerRadius = UDim.new(0, 5)
UICorner_35.Parent = Text_6

SwitchFrame_6.Name = "SwitchFrame"
SwitchFrame_6.Parent = C3_4
SwitchFrame_6.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchFrame_6.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SwitchFrame_6.BorderSizePixel = 0
SwitchFrame_6.Position = UDim2.new(0.0879999995, 0, 0.5, 0)
SwitchFrame_6.Size = UDim2.new(0.125, 0, 0.73299998, 0)

UICorner_36.CornerRadius = UDim.new(0, 5)
UICorner_36.Parent = SwitchFrame_6

SwitchButtonActivator_6.Name = "SwitchButtonActivator"
SwitchButtonActivator_6.Parent = SwitchFrame_6
SwitchButtonActivator_6.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButtonActivator_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SwitchButtonActivator_6.BackgroundTransparency = 1.000
SwitchButtonActivator_6.BorderSizePixel = 0
SwitchButtonActivator_6.Position = UDim2.new(0.5, 0, 0.5, 0)
SwitchButtonActivator_6.Size = UDim2.new(1, 0, 1, 0)
SwitchButtonActivator_6.Font = Enum.Font.Gotham
SwitchButtonActivator_6.Text = "<"
SwitchButtonActivator_6.TextColor3 = Color3.fromRGB(255, 255, 255)
SwitchButtonActivator_6.TextSize = 14.000

UICorner_37.CornerRadius = UDim.new(0, 5)
UICorner_37.Parent = SwitchButtonActivator_6

C4_3.Name = "C4"
C4_3.Parent = Menu
C4_3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
C4_3.BorderSizePixel = 0
C4_3.Position = UDim2.new(0, 0, 0.607706606, 0)
C4_3.Selectable = true
C4_3.Size = UDim2.new(0, 183, 0, 31)

UICorner_38.CornerRadius = UDim.new(0, 5)
UICorner_38.Parent = C4_3

Text_7.Name = "Text"
Text_7.Parent = C4_3
Text_7.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Text_7.BorderSizePixel = 0
Text_7.ClipsDescendants = true
Text_7.Position = UDim2.new(0.191256836, 0, 0, 0)
Text_7.Size = UDim2.new(0.808743179, 0, 1, 0)
Text_7.Font = Enum.Font.GothamBold
Text_7.Text = "Player"
Text_7.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_7.TextSize = 15.000
Text_7.TextWrapped = true
Text_7.TextXAlignment = Enum.TextXAlignment.Left

UICorner_39.CornerRadius = UDim.new(0, 5)
UICorner_39.Parent = Text_7

SwitchFrame_7.Name = "SwitchFrame"
SwitchFrame_7.Parent = C4_3
SwitchFrame_7.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchFrame_7.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SwitchFrame_7.BorderSizePixel = 0
SwitchFrame_7.Position = UDim2.new(0.0879999995, 0, 0.5, 0)
SwitchFrame_7.Size = UDim2.new(0.125, 0, 0.73299998, 0)

UICorner_40.CornerRadius = UDim.new(0, 5)
UICorner_40.Parent = SwitchFrame_7

SwitchButtonActivator_7.Name = "SwitchButtonActivator"
SwitchButtonActivator_7.Parent = SwitchFrame_7
SwitchButtonActivator_7.AnchorPoint = Vector2.new(0.5, 0.5)
SwitchButtonActivator_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SwitchButtonActivator_7.BackgroundTransparency = 1.000
SwitchButtonActivator_7.BorderSizePixel = 0
SwitchButtonActivator_7.Position = UDim2.new(0.5, 0, 0.5, 0)
SwitchButtonActivator_7.Size = UDim2.new(1, 0, 1, 0)
SwitchButtonActivator_7.Font = Enum.Font.Gotham
SwitchButtonActivator_7.Text = "<"
SwitchButtonActivator_7.TextColor3 = Color3.fromRGB(255, 255, 255)
SwitchButtonActivator_7.TextSize = 14.000

UICorner_41.CornerRadius = UDim.new(0, 5)
UICorner_41.Parent = SwitchButtonActivator_7

TopFrame.Name = "TopFrame"
TopFrame.Parent = MainFrame
TopFrame.AnchorPoint = Vector2.new(0.5, 0)
TopFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TopFrame.BorderSizePixel = 0
TopFrame.ClipsDescendants = true
TopFrame.Size = UDim2.new(0, 0, 0, 25)

UICorner_42.CornerRadius = UDim.new(0, 5)
UICorner_42.Parent = TopFrame

Title.Name = "Title"
Title.Parent = TopFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.ClipsDescendants = true
Title.Position = UDim2.new(0.0350000001, 0, 0, 0)
Title.Size = UDim2.new(0.430769295, 0, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "CC Aimbot"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14.000
Title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

Minimize.Name = "Minimize"
Minimize.Parent = TopFrame
Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Minimize.BackgroundTransparency = 1.000
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.902564108, 0, 0, 0)
Minimize.Size = UDim2.new(-0.0307692308, 25, 1, 0)
Minimize.Selected = true
Minimize.Font = Enum.Font.Gotham
Minimize.Text = "-"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextScaled = true
Minimize.TextSize = 14.000
Minimize.TextWrapped = true

Menu_2.Name = "Menu"
Menu_2.Parent = TopFrame
Menu_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Menu_2.BackgroundTransparency = 1.000
Menu_2.BorderSizePixel = 0
Menu_2.Position = UDim2.new(0.805128217, 0, 0, 0)
Menu_2.Size = UDim2.new(-0.0307692308, 25, 1, 0)
Menu_2.Selected = true
Menu_2.Font = Enum.Font.GothamBold
Menu_2.Text = "v"
Menu_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Menu_2.TextSize = 14.000
Menu_2.TextWrapped = true

local function DIPONU_fake_script() -- SwitchFrame.SwitchButtonSystem 
	local script = Instance.new('LocalScript', SwitchFrame)

	flying = false
	lplayer = game.Players.LocalPlayer
	speedget = 1
	speedfly = 1
	Mouse = lplayer:GetMouse()
	-- Switches --
	local TweenService = game:GetService("TweenService")
	local time = 0.5 --this will tell you how much it would take for the tween to finish
	-- ColorFade --
	local SwitchButtonFade = TweenService:Create(script.Parent.SwitchButton, TweenInfo.new(time), {BackgroundTransparency = 0})
	local SwitchButtonFadeOut = TweenService:Create(script.Parent.SwitchButton, TweenInfo.new(time), {BackgroundTransparency = 1})
	local SwitchButtonLitFade = TweenService:Create(script.Parent.SwitchButton.SwitchButtonLit, TweenInfo.new(time), {BackgroundTransparency = 0})
	local SwitchButtonLitFadeOut = TweenService:Create(script.Parent.SwitchButton.SwitchButtonLit, TweenInfo.new(time), {BackgroundTransparency = 1})
	
	local Toggle = false
	
	script.Parent.SwitchButtonActivator.MouseButton1Click:connect(function()
		if flying == false then
			flying = true
			script.Parent.SwitchButton:TweenPosition(UDim2.new(0.775,0,0.5,0), "Out", "Quad", 0.5, true)
			SwitchButtonFadeOut:Play()
			SwitchButtonLitFade:Play()
			repeat wait() until lplayer and lplayer.Character and lplayer.Character:FindFirstChild('HumanoidRootPart') and lplayer.Character:FindFirstChild('Humanoid')
			repeat wait() until Mouse
	
			local T = lplayer.Character.HumanoidRootPart
			local CONTROL = {F = 0, B = 0, L = 0, R = 0}
			local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
			local SPEED = speedget
	
			local function fly()
				flying = true
				local BG = Instance.new('BodyGyro', T)
				local BV = Instance.new('BodyVelocity', T)
				BG.P = 9e4
				BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
				BG.cframe = T.CFrame
				BV.velocity = Vector3.new(0, 0.1, 0)
				BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
				spawn(function()
					repeat wait()
						lplayer.Character.Humanoid.PlatformStand = true
						if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
							SPEED = 50
						elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
							SPEED = 0
						end
						if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
							BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
							lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
						elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
							BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
						else
							BV.velocity = Vector3.new(0, 0.1, 0)
						end
						BG.cframe = workspace.CurrentCamera.CoordinateFrame
					until not flying
					CONTROL = {F = 0, B = 0, L = 0, R = 0}
					lCONTROL = {F = 0, B = 0, L = 0, R = 0}
					SPEED = 0
					BG:destroy()
					BV:destroy()
					lplayer.Character.Humanoid.PlatformStand = false
				end)
			end
			Mouse.KeyDown:connect(function(KEY)
				if KEY:lower() == 'w' then
					CONTROL.F = speedfly
				elseif KEY:lower() == 's' then
					CONTROL.B = -speedfly
				elseif KEY:lower() == 'a' then
					CONTROL.L = -speedfly 
				elseif KEY:lower() == 'd' then 
					CONTROL.R = speedfly
				end
			end)
			Mouse.KeyUp:connect(function(KEY)
				if KEY:lower() == 'w' then
					CONTROL.F = 0
				elseif KEY:lower() == 's' then
					CONTROL.B = 0
				elseif KEY:lower() == 'a' then
					CONTROL.L = 0
				elseif KEY:lower() == 'd' then
					CONTROL.R = 0
				end
			end)
			fly()
		else
			flying = false
			script.Parent.SwitchButton:TweenPosition(UDim2.new(0.24,0,0.5,0), "Out", "Quad", 0.5, true)
			SwitchButtonFade:Play()
			SwitchButtonLitFadeOut:Play()
			flying = false
			lplayer.Character.Humanoid.PlatformStand = false
		end
	end)
	
	
end
coroutine.wrap(DIPONU_fake_script)()
local function NBGZM_fake_script() -- SwitchFrame_2.SwitchButtonSystem 
	local script = Instance.new('LocalScript', SwitchFrame_2)

	local Gun = game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value);
	local Crit = math.random() > .6 and true or false;
	script.Parent.SwitchButtonActivator.MouseButton1Click:connect(function()
		for i,v in pairs(game.Players:GetPlayers()) do
			if v and v.Character and v.Character:FindFirstChild("Head") then
				local Distance = (game.Players.LocalPlayer.Character.Head.Position - v.Character.Head.Position).magnitude
				for i  = 1,10 do
					game.ReplicatedStorage.Events.HitPart:FireServer(v.Character.Head,
						v.Character.Head.Position + Vector3.new(math.random(), math.random(), math.random()),
						Gun.Name,
						Crit and 2 or 1,
						Distance,
						Backstab,
						Crit,
						false,
						1,
						false,
						Gun.FireRate.Value,
						Gun.ReloadTime.Value,
						Gun.Ammo.Value,
						Gun.StoredAmmo.Value,
						Gun.Bullets.Value,
						Gun.EquipTime.Value,
						Gun.RecoilControl.Value,
						Gun.Auto.Value,
						Gun['Speed%'].Value,
						game.ReplicatedStorage.wkspc.DistributedTime.Value);
				end
			end
		end
	end)
end
coroutine.wrap(NBGZM_fake_script)()
local function UOOREXU_fake_script() -- SwitchFrame_3.SwitchButtonSystem 
	local script = Instance.new('LocalScript', SwitchFrame_3)

	local InfiniteJump = false
	-- Switches --
	local TweenService = game:GetService("TweenService")
	local time = 0.5 --this will tell you how much it would take for the tween to finish
	-- ColorFade --
	local SwitchButtonFade = TweenService:Create(script.Parent.SwitchButton, TweenInfo.new(time), {BackgroundTransparency = 0})
	local SwitchButtonFadeOut = TweenService:Create(script.Parent.SwitchButton, TweenInfo.new(time), {BackgroundTransparency = 1})
	local SwitchButtonLitFade = TweenService:Create(script.Parent.SwitchButton.SwitchButtonLit, TweenInfo.new(time), {BackgroundTransparency = 0})
	local SwitchButtonLitFadeOut = TweenService:Create(script.Parent.SwitchButton.SwitchButtonLit, TweenInfo.new(time), {BackgroundTransparency = 1})
	
	script.Parent.SwitchButtonActivator.MouseButton1Click:connect(function()
		if InfiniteJump == false then
			InfiniteJump = true
			script.Parent.SwitchButton:TweenPosition(UDim2.new(0.775,0,0.5,0), "Out", "Quad", 0.5, true)
			SwitchButtonFadeOut:Play()
			SwitchButtonLitFade:Play()
		else
			InfiniteJump = false
			script.Parent.SwitchButton:TweenPosition(UDim2.new(0.24,0,0.5,0), "Out", "Quad", 0.5, true)
			SwitchButtonFade:Play()
			SwitchButtonLitFadeOut:Play()
		end
	end)
	
	game:GetService("UserInputService").JumpRequest:connect(function()
		if InfiniteJump == true then
			game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
		end
	end)
end
coroutine.wrap(UOOREXU_fake_script)()
local function EGFWXE_fake_script() -- Page1.Aimbot 
	local script = Instance.new('LocalScript', Page1)

	local gui_hide_button = {Enum.KeyCode.LeftControl, "h"}
	local plrs = game:GetService("Players")
	local lplr = game:GetService("Players").LocalPlayer
	local TeamBased = true ; local teambasedswitch = "o"
	local presskeytoaim = true; local aimkey = "e"
	aimbothider = false; aimbothiderspeed = .5
	local Aim_Assist = false ; Aim_Assist_Key = {Enum.KeyCode.LeftControl, "z"}
	local abs = math.abs
	local mouselock = false
	local canaimat = true
	local lockaim = true; local lockangle = 5
	local ver = "2"
	local cam = game.Workspace.CurrentCamera
	local BetterDeathCount = true
	
	
	local mouse = lplr:GetMouse()
	local switch = false
	local key = "k"
	local aimatpart = nil
	
	-- Scripts:
	local uis = game:GetService("UserInputService")
	local bringall = false
	local hided2 = false
	mouse.KeyDown:Connect(function(a)
		if a == "u" then
			--print("worked1")
			if mouselock == false then
				mouselock = true
			else
				mouselock = false
			end
		elseif a == "y" then
			if aimbothider == false then
				aimbothider = true
				if aimbothider == true then
					return
				end
			end
		elseif a == Aim_Assist_Key[2] and uis:IsKeyDown(Aim_Assist_Key[1]) then
			if Aim_Assist == true then
				Aim_Assist = false
				--print("disabled")
			else
				Aim_Assist = true
			end
		end
		if a == "j" then
			if mouse.Target then
				mouse.Target:Destroy()
			end
		end
		if a == key then
			if switch == false then
				switch = true
			else
				switch = false
				if aimatpart ~= nil then
					aimatpart = nil
				end
			end
		elseif a == teambasedswitch then
			if TeamBased == true then
				TeamBased = false
				script.Parent.C4.Text = "Team-Check : "..tostring(TeamBased)
			else
				TeamBased = true
				script.Parent.C4.Text = "Team-Check : "..tostring(TeamBased)
			end
		elseif a == aimkey then
			if not aimatpart then
				local maxangle = math.rad(20)
				for i, plr in pairs(plrs:GetChildren()) do
					if plr.Name ~= lplr.Name and plr.Character and plr.Character.Head and plr.Character.Humanoid and plr.Character.Humanoid.Health > 1 then
						if TeamBased == true then
							if plr.Team.Name ~= lplr.Team.Name then
								local an = checkfov(plr.Character.Head)
								if an < maxangle then
									maxangle = an
									aimatpart = plr.Character.Head
								end
							end
						else
							local an = checkfov(plr.Character.Head)
							if an < maxangle then
								maxangle = an
								aimatpart = plr.Character.Head
							end
							--print(plr)
						end
						local old = aimatpart
						plr.Character.Humanoid.Died:Connect(function()
							--print("died")
							if aimatpart and aimatpart == old then
								aimatpart = nil
							end
						end)
						
					end
				end
			else
				aimatpart = nil
				canaimat = false
				delay(1.1, function()
					canaimat = true
				end)
			end
		end
	end)
	
	function getfovxyz (p0, p1, deg)
		local x1, y1, z1 = p0:ToOrientation()
		local cf = CFrame.new(p0.p, p1.p)
		local x2, y2, z2 = cf:ToOrientation()
		local d = math.deg
		if deg then
			return Vector3.new(d(x1-x2), d(y1-y2), d(z1-z2))
		else
			return Vector3.new((x1-x2), (y1-y2), (z1-z2))
		end
	end
	
	
	function aimat(part)
		if part then
			if aimbothider == true or Aim_Assist == true then
				cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.p, part.CFrame.p), aimbothiderspeed)
			else
				
				cam.CFrame = CFrame.new(cam.CFrame.p, part.CFrame.p)
			end
		end
	end
	function checkfov (part)
		local fov = getfovxyz(game.Workspace.CurrentCamera.CFrame, part.CFrame)
		local angle = math.abs(fov.X) + math.abs(fov.Y)
		return angle
	end
	pcall(function()
		delay(0, function()
			while wait(.4) do
				if Aim_Assist and not aimatpart and canaimat and lplr.Character and lplr.Character.Humanoid and lplr.Character.Humanoid.Health > 0 then
					for i, plr in pairs(plrs:GetChildren()) do
						
						
						local minangle = math.rad(5.5)
						local lastpart = nil
						local function gg(plr)
							pcall(function()
								if plr.Name ~= lplr.Name and plr.Character and plr.Character.Humanoid and plr.Character.Humanoid.Health > 0 and plr.Character.Head then
									local raycasted = false
									local cf1 = CFrame.new(cam.CFrame.p, plr.Character.Head.CFrame.p) * CFrame.new(0, 0, -4)
									local r1 = Ray.new(cf1.p, cf1.LookVector * 9000)
									local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
									local dist = (plr.Character.Head.CFrame.p- pos).magnitude
									if dist < 4 then
										raycasted = true
									end
									if raycasted == true then
										local an1 = getfovxyz(cam.CFrame, plr.Character.Head.CFrame)
										local an = abs(an1.X) + abs(an1.Y)
										if an < minangle then
											minangle = an
											lastpart = plr.Character.Head
										end
									end
								end
							end)
						end
						if TeamBased then
							if plr.Team.Name ~= lplr.Team.Name then
								gg(plr)
							end
						else
							gg(plr)
						end
						--print(math.deg(minangle))
						if lastpart then
							aimatpart = lastpart
							aimatpart.Parent.Humanoid.Died:Connect(function()
								if aimatpart == lastpart then
									aimatpart = nil
								end
							end)
							
						end
					end
				end
			end
		end)
	end)
	local oldheadpos
	local lastaimapart
	game:GetService("RunService").RenderStepped:Connect(function()
		if aimatpart and lplr.Character and lplr.Character.Head then
			if BetterDeathCount and lastaimapart and lastaimapart == aimatpart then
				local dist = (oldheadpos - aimatpart.CFrame.p).magnitude
				if dist > 40 then
					aimatpart = nil
				end
			end
			lastaimapart = aimatpart
			oldheadpos = lastaimapart.CFrame.p
			do
				if aimatpart.Parent == plrs.LocalPlayer.Character then
					aimatpart = nil
				end
				aimat(aimatpart)
				pcall(function()
					if Aim_Assist == true then
						local cf1 = CFrame.new(cam.CFrame.p, aimatpart.CFrame.p) * CFrame.new(0, 0, -4)
						local r1 = Ray.new(cf1.p, cf1.LookVector * 1000)
						local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
						local dist = (aimatpart.CFrame.p- pos).magnitude
						if obj then
							--print(obj:GetFullName())
						end
						if not obj or dist > 6 then
							aimatpart = nil
							--print("ooof")
						end
						canaimat = false
						delay(.5, function()
							canaimat = true
						end)
					end
				end)
			end
			
			
			
		end
	end)
end
coroutine.wrap(EGFWXE_fake_script)()
local function UBACA_fake_script() -- SwitchFrame_4.SwitchButtonSystem 
	local script = Instance.new('LocalScript', SwitchFrame_4)

	-- Switches --
	local TweenService = game:GetService("TweenService")
	local time = 0.5 --this will tell you how much it would take for the tween to finish
	-- ColorFade --
	local SwitchButtonFade = TweenService:Create(script.Parent.SwitchButton, TweenInfo.new(time), {BackgroundTransparency = 0})
	local SwitchButtonFadeOut = TweenService:Create(script.Parent.SwitchButton, TweenInfo.new(time), {BackgroundTransparency = 1})
	local SwitchButtonLitFade = TweenService:Create(script.Parent.SwitchButton.SwitchButtonLit, TweenInfo.new(time), {BackgroundTransparency = 0})
	local SwitchButtonLitFadeOut = TweenService:Create(script.Parent.SwitchButton.SwitchButtonLit, TweenInfo.new(time), {BackgroundTransparency = 1})
	
	local Toggle = false
	local ESPToggle = false
	
	script.Parent.SwitchButtonActivator.MouseButton1Click:connect(function()
		if Toggle == false then
			Toggle = true
			script.Parent.SwitchButton:TweenPosition(UDim2.new(0.775,0,0.5,0), "Out", "Quad", 0.5, true)
			SwitchButtonFadeOut:Play()
			SwitchButtonLitFade:Play()
			ESPToggle = true
			pcall(ClearESP)
			pcall(MakeESP)
		else
			Toggle = false
			script.Parent.SwitchButton:TweenPosition(UDim2.new(0.24,0,0.5,0), "Out", "Quad", 0.5, true)
			SwitchButtonFade:Play()
			SwitchButtonLitFadeOut:Play()
			ESPToggle = false
			pcall(ClearESP)
		end
	end)
	-- ESP --
	local Mouse = game.Players.LocalPlayer:GetMouse()
	
	local plrs = game:GetService("Players")
	local faces = {"Back","Bottom","Front","Left","Right","Top"}
	function MakeESP()
		if ESPToggle == true then
		for _, v in pairs(game.Players:GetChildren()) do if v.Name ~= game.Players.LocalPlayer.Name then
				local bgui = Instance.new("BillboardGui",v.Character.Head)
				bgui.Name = ("EGUI")
				bgui.AlwaysOnTop = true
				bgui.ExtentsOffset = Vector3.new(0,2,0)
				bgui.Size = UDim2.new(0,200,0,50)
				local nam = Instance.new("TextLabel",bgui)
				nam.Text = v.Name
				nam.BackgroundTransparency = 1
				nam.TextSize = 15
				nam.Font = ("GothamBold")
				nam.TextColor3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
				nam.Size = UDim2.new(0,200,0,50)
				for _, p in pairs(v.Character:GetChildren()) do
					if p.Name == ("Head") or p.Name == ("Torso") or p.Name == ("Right Arm") or p.Name == ("Right Leg") or p.Name == ("Left Arm") or p.Name == ("Left Leg") then 
						for _, f in pairs(faces) do
							local m = Instance.new("SurfaceGui",p)
							m.Name = ("EGUI")
							m.Face = f
							m.AlwaysOnTop = true
							local mf = Instance.new("Frame",m)
							mf.Size = UDim2.new(1,0,1,0)
							mf.BorderSizePixel = 0
							mf.BackgroundTransparency = 0.5
							mf.BackgroundColor3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
						end
					end
				end
			end
		end
		end
		end
	
	function ClearESP()
		for _, v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == ("EGUI") then
				v:Remove()
			end
		end
	end
	
	Mouse.KeyDown:Connect(function(k)
		if k == "t" then
			if ESPToggle == true then
				wait(1)
				pcall(ClearESP)
				pcall(MakeESP)
			end
		end
	end)
	
	game:GetService("Players").PlayerAdded:Connect(function(v)
		if ESPToggle == true then
			wait(1)
			pcall(ClearESP)
			pcall(MakeESP)
		end
	end)
	
	game:GetService("Players").PlayerRemoving:Connect(function(v)
		if ESPToggle == true then
			wait(1)
			pcall(ClearESP)
			pcall(MakeESP)
		end
	end)
	
	pcall(ClearESP)
	pcall(MakeESP)
	
	while wait(60) do
		if ESPToggle == true then
			wait(1)
			pcall(ClearESP)
			pcall(MakeESP)
		end
	end
end
coroutine.wrap(UBACA_fake_script)()
local function YNNKEQ_fake_script() -- SwitchFrame_5.SwitchButtonSystem 
	local script = Instance.new('LocalScript', SwitchFrame_5)

	script.Parent.SwitchButtonActivator.MouseButton1Click:connect(function()
		script.Parent.Parent.Parent.Parent.Page1:TweenPosition(UDim2.new(0,0,0.169,0), "Out", "Quad", 0.5, true)
		script.Parent.Parent.Parent.Parent.Menu:TweenPosition(UDim2.new(1.1,0,0.169,0), "Out", "Quad", 0.5, true)
		script.Parent.Parent.Parent.Parent.Page2:TweenPosition(UDim2.new(1.1,0,0.169,0), "Out", "Quad", 0.5, true)
		script.Parent.Parent.Parent.Parent.Page3:TweenPosition(UDim2.new(1.1,0,0.169,0), "Out", "Quad", 0.5, true)
	end)
end
coroutine.wrap(YNNKEQ_fake_script)()
local function QQOZMVW_fake_script() -- SwitchFrame_6.SwitchButtonSystem 
	local script = Instance.new('LocalScript', SwitchFrame_6)

	script.Parent.SwitchButtonActivator.MouseButton1Click:connect(function()
		script.Parent.Parent.Parent.Parent.Page2:TweenPosition(UDim2.new(0,0,0.169,0), "Out", "Quad", 0.5, true)
		script.Parent.Parent.Parent.Parent.Menu:TweenPosition(UDim2.new(1.1,0,0.169,0), "Out", "Quad", 0.5, true)
		script.Parent.Parent.Parent.Parent.Page1:TweenPosition(UDim2.new(1.1,0,0.169,0), "Out", "Quad", 0.5, true)
		script.Parent.Parent.Parent.Parent.Page3:TweenPosition(UDim2.new(1.1,0,0.169,0), "Out", "Quad", 0.5, true)
	end)
end
coroutine.wrap(QQOZMVW_fake_script)()
local function SVWBPQ_fake_script() -- SwitchFrame_7.SwitchButtonSystem 
	local script = Instance.new('LocalScript', SwitchFrame_7)

	script.Parent.SwitchButtonActivator.MouseButton1Click:connect(function()
		script.Parent.Parent.Parent.Parent.Page3:TweenPosition(UDim2.new(0,0,0.169,0), "Out", "Quad", 0.5, true)
		script.Parent.Parent.Parent.Parent.Menu:TweenPosition(UDim2.new(1.1,0,0.169,0), "Out", "Quad", 0.5, true)
		script.Parent.Parent.Parent.Parent.Page2:TweenPosition(UDim2.new(1.1,0,0.169,0), "Out", "Quad", 0.5, true)
		script.Parent.Parent.Parent.Parent.Page1:TweenPosition(UDim2.new(1.1,0,0.169,0), "Out", "Quad", 0.5, true)
	end)
end
coroutine.wrap(SVWBPQ_fake_script)()
local function XXBWPH_fake_script() -- MainFrame.Functionaries 
	local script = Instance.new('LocalScript', MainFrame)

	local Minimize = false
	
	script.Parent.TopFrame.Minimize.MouseButton1Click:connect(function()
			if Minimize == false then
			Minimize = true
			script.Parent.BottomFrame:TweenPosition(UDim2.new(0.5,0,-1.5,0), "Out", "Quad", 0.5, true)
		else
			Minimize = false
			script.Parent.BottomFrame:TweenPosition(UDim2.new(0.5,0,0.5,0), "Out", "Quad", 0.5, true)
		end
	end)
	
	script.Parent.TopFrame.Menu.MouseButton1Click:connect(function()
		script.Parent.BottomFrame.Menu:TweenPosition(UDim2.new(0,0,0.169,0), "Out", "Quad", 0.5, true)
		script.Parent.BottomFrame.Page1:TweenPosition(UDim2.new(1.1,0,0.169,0), "Out", "Quad", 0.5, true)
		script.Parent.BottomFrame.Page2:TweenPosition(UDim2.new(1.1,0,0.169,0), "Out", "Quad", 0.5, true)
		script.Parent.BottomFrame.Page3:TweenPosition(UDim2.new(1.1,0,0.169,0), "Out", "Quad", 0.5, true)
	end)
	
	-- Dragging
	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.TopFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(XXBWPH_fake_script)()
local function OTKOWZS_fake_script() -- MainFrame.LocalScript 
	local script = Instance.new('LocalScript', MainFrame)

	wait(2)
	script.Parent.TopFrame:TweenSize(UDim2.new(0,195,0,25), "Out", "Quad", 0.5, true)
	script.Parent.TopFrame:TweenPosition(UDim2.new(0.5,0,0,0), "Out", "Quad", 0.5, true)
	wait(1)
	script.Parent.BottomFrame:TweenPosition(UDim2.new(0.5,0,0.5,0), "Out", "Quad", 0.5, true)
end
coroutine.wrap(OTKOWZS_fake_script)()
end)


d:Button("Silent Aim",function()
----wallbang another


local CurrentCamera = workspace.CurrentCamera
local Players = game.GetService(game, "Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
function ClosestPlayer()
    local MaxDist, Closest = math.huge
    for I,V in pairs(Players.GetPlayers(Players)) do
        if V == LocalPlayer then continue end
        if V.Team == LocalPlayer then continue end
        if not V.Character then continue end
        local Head = V.Character.FindFirstChild(V.Character, "Head")
        if not Head then continue end
        local Pos, Vis = CurrentCamera.WorldToScreenPoint(CurrentCamera, Head.Position)
        if not Vis then continue end
        local MousePos, TheirPos = Vector2.new(Mouse.X, Mouse.Y), Vector2.new(Pos.X, Pos.Y)
        local Dist = (TheirPos - MousePos).Magnitude
        if Dist < MaxDist then
            MaxDist = Dist
            Closest = V
        end
    end
    return Closest
end
local MT = getrawmetatable(game)
local OldNC = MT.__namecall
local OldIDX = MT.__index
setreadonly(MT, false)
MT.__namecall = newcclosure(function(self, ...)
    local Args, Method = {...}, getnamecallmethod()
    if Method == "FindPartOnRayWithIgnoreList" and not checkcaller() then
        local CP = ClosestPlayer()
        if CP and CP.Character and CP.Character.FindFirstChild(CP.Character, "Head") then
            Args[1] = Ray.new(CurrentCamera.CFrame.Position, (CP.Character.Head.Position - CurrentCamera.CFrame.Position).Unit * 1000)
            return OldNC(self, unpack(Args))
        end
    end
    return OldNC(self, ...)
end)
MT.__index = newcclosure(function(self, K)
    if K == "Clips" then
        return workspace.Map
    end
    return OldIDX(self, K)
end)
setreadonly(MT, true)
end)

local wallbangenabled = false
-- Ill explain the wallbang script
local gm = getrawmetatable(game)            -- gets metatable of game
setreadonly(gm,false)                       -- Makes it writable
local OldIndex = gm.__index                 -- Save old index so we can return it if condition is not met
gm.__index = newcclosure(function(self,i)   -- Make new index method with a C function making it undetectable
    if i == "Clips" and wallbangenabled then                    -- Check if index was clips meaning thats the ammo we want to spoof
        return workspace.Map                -- Then we just return workspace.map so that the bullet doesnt stop when it comes in contact
    end
    return OldIndex(self,i)                 -- If its not met we just return old index we saved
end)

-- Toggles wallbang


local InfAmmoVar = false
local NoRecoilVar = false
local AutomaticModeVar = false
local NoSpreadVar = false

local a
local b
for i,v in next, getgc() do
  if (type(v) == 'function') and (debug.getinfo(v).name == 'firebullet') then
     a = getfenv(v);
     b = v
  end
end

game:GetService("RunService").Heartbeat:Connect(function()
	if InfAmmoVar then
		debug.setupvalue(b,5,420)
	end
	if InfAmmoVar or NoSpreadVar or AutomaticModeVar or NoRecoilVar then
		a.DISABLED = false
		a.DISABLED2 = false
	end
	if NoSpreadVar then
		a.currentspread = 0
	end
	if NoRecoilVar then
		a.recoil = 0
	end
	if AutomaticModeVar then
		a.mode = "automatic"
	end
end)



g:Toggle("No Recoil",function(t)
	NoRecoilVar = t

end)





g:Toggle("Automatic",function(t)
	AutomaticModeVar = t

end)

g:Toggle("No Spread",function(t)
	NoSpreadVar = t

end)

g:Button("Infinite Ammo",function()
local env = getsenv(game.Players.LocalPlayer.PlayerGui.GUI.Client)


while wait() do
   env.ammocount = 420
   env.ammocount2 = 420
   env.ammocount4 = 420
   env.ammocount4 = 420
   env.currentspread = 0
   env.recoil = 0
   env.mode = "automatic"
   env.inducefalldamage = function(...) return nil end
end

end)

g:Button("Teleport Ammo Box To You",function()
game.StarterGui:SetCore("SendNotification", {
Title = "Arsenal GUI V3";
Text = "Ammo Box Will Auto Teleport to you!";
Icon = "";
Duration = 5;
})

function Ammo() --make more efficient add more constant tp
	wait(1)
		for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
			if v.Name == "DeadAmmo" then
				v.CFrame =  player.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
				v.TextureID = 1
				v.Transparency = 1
			end
		end
	end


while wait() do 
	Ammo()
	wait(.1)
	Ammo()
end
end)

e:Bind("Knife KIll All (Enable Knife)",Enum.KeyCode.T,false,function()
for _,v in pairs(game.Players:GetChildren())do
game.ReplicatedStorage.Events.HitPart:FireServer(v.Character.Head,v.Character.Head.Position+Vector3.new(math.random(),math.random(),math.random()),game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Name,Crit and 2 or 1,(game.Players.LocalPlayer.Character.Head.Position-v.Character.Head.Position).magnitude,Backstab,Crit,false,1,false,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).FireRate.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).ReloadTime.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Ammo.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).StoredAmmo.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Bullets.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).EquipTime.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).RecoilControl.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Auto.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value)['Speed%'].Value,game.ReplicatedStorage.wkspc.DistributedTime.Value)
end
for _,v in pairs(game.Players:GetChildren())do
game.ReplicatedStorage.Events.HitPart:FireServer(v.Character.Head,v.Character.Head.Position+Vector3.new(math.random(),math.random(),math.random()),game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Name,Crit and 2 or 1,(game.Players.LocalPlayer.Character.Head.Position-v.Character.Head.Position).magnitude,Backstab,Crit,false,1,false,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).FireRate.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).ReloadTime.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Ammo.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).StoredAmmo.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Bullets.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).EquipTime.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).RecoilControl.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Auto.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value)['Speed%'].Value,game.ReplicatedStorage.wkspc.DistributedTime.Value)
end

for _,v in pairs(game.Players:GetChildren())do
game.ReplicatedStorage.Events.HitPart:FireServer(v.Character.Head,v.Character.Head.Position+Vector3.new(math.random(),math.random(),math.random()),game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Name,Crit and 2 or 1,(game.Players.LocalPlayer.Character.Head.Position-v.Character.Head.Position).magnitude,Backstab,Crit,false,1,false,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).FireRate.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).ReloadTime.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Ammo.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).StoredAmmo.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Bullets.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).EquipTime.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).RecoilControl.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Auto.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value)['Speed%'].Value,game.ReplicatedStorage.wkspc.DistributedTime.Value)
end

for _,v in pairs(game.Players:GetChildren())do
game.ReplicatedStorage.Events.HitPart:FireServer(v.Character.Head,v.Character.Head.Position+Vector3.new(math.random(),math.random(),math.random()),game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Name,Crit and 2 or 1,(game.Players.LocalPlayer.Character.Head.Position-v.Character.Head.Position).magnitude,Backstab,Crit,false,1,false,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).FireRate.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).ReloadTime.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Ammo.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).StoredAmmo.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Bullets.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).EquipTime.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).RecoilControl.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Auto.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value)['Speed%'].Value,game.ReplicatedStorage.wkspc.DistributedTime.Value)
end



local Player = game.Players.LocalPlayer

 
 

   for i ,v in ipairs( game.Players:GetPlayers() ) do
 
       if Player.Character ~= nil and v ~= Player and (v.TeamColor ~= Player.TeamColor or  v.TeamColor == "Bright blue") and v.Character ~= nil and v.Character:FindFirstChild("Gun") then
while v.Character:FindFirstChild("Gun") ~= nil and  Player.Character:FindFirstChild("Gun") ~= nil  do
               Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame + (v.Character.HumanoidRootPart.CFrame.LookVector * -1)
Camera.CoordinateFrame  = CFrame.new(Camera.CoordinateFrame.p , v.Character.HumanoidRootPart.CFrame.p)
mouse1press()
               wait()
           end
 
 
       end    
 
   end
wait()

end)



e:Bind("Kill All",Enum.KeyCode.R,false,function()
for _,v in pairs(game.Players:GetChildren())do
game.ReplicatedStorage.Events.HitPart:FireServer(v.Character.Head,v.Character.Head.Position+Vector3.new(math.random(),math.random(),math.random()),game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Name,Crit and 2 or 1,(game.Players.LocalPlayer.Character.Head.Position-v.Character.Head.Position).magnitude,Backstab,Crit,false,1,false,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).FireRate.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).ReloadTime.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Ammo.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).StoredAmmo.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Bullets.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).EquipTime.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).RecoilControl.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value).Auto.Value,game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value)['Speed%'].Value,game.ReplicatedStorage.wkspc.DistributedTime.Value)
end
end)


e:Button("Stronger Kill All (E)",function()
loadstring(game:HttpGet("https://pastebin.com/raw/uzQRru6Y", true))()

end)



local txt  = e:Text("Misc")

e:Button("Get all Banana",function()
repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.PlayerGui and game.Players.LocalPlayer.PlayerGui:FindFirstChild("GUI")


game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "banana";
	Text = "When the game is ended, you will have the bananas";
})


for i,v in pairs(game.Workspace.Map.BananaSpawns:GetChildren()) do
game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(v.CFrame)
wait(1)
end

function hopServer()
local x = {}
for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
if type(v) == "table" and v.playing <= 15 and v.id ~= game.JobId then
x[#x + 1] = v.id
end
end
if #x > 0 then
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
end
end
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State, Id, sName)
if State == Enum.TeleportState.Failed then
hopServer()
end
end)

repeat wait() until game:GetService("ReplicatedStorage").wkspc.Status.RoundOver.Value == true

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "banana";
	Text = "When the game is ended, you will have the bananas";
})

end)


e:Button("Be Purple (Buggy)",function()
local PurpleTeam = game.Players.LocalPlayer.PlayerGui.GUI.TeamSelection.Buttons["Pur"]:Clone()
PurpleTeam.Visible  = true
PurpleTeam.Parent = game.Players.LocalPlayer.PlayerGui.GUI.TeamSelection.Buttons
PurpleTeam.MouseButton1Click:connect(function()
game.ReplicatedStorage.Events.JoinTeam:FireServer("TBC")
game.Players.LocalPlayer.Status.Team.Value = "NoTeam"
game.Players.LocalPlayer.Character.Cap.Handle.BrickColor = BrickColor.new("Hot pink")
game.Players.LocalPlayer.Character.RightUpperArm.BrickColor = BrickColor.new("Hot pink")
game.Players.LocalPlayer.Character.RightLowerArm.BrickColor = BrickColor.new("Hot pink")
game.Players.LocalPlayer.Character.RightHand.BrickColor = BrickColor.new("Hot pink")
game.Players.LocalPlayer.Character.LeftUpperArm.BrickColor = BrickColor.new("Hot pink")
game.Players.LocalPlayer.Character.LeftLowerArm.BrickColor = BrickColor.new("Hot pink")
game.Players.LocalPlayer.Character.LeftHand.BrickColor = BrickColor.new("Hot pink")
game.Players.LocalPlayer.Character.UpperTorso.BrickColor = BrickColor.new("Hot pink")
game.Players.LocalPlayer.Character.LowerTorso.BrickColor = BrickColor.new("Hot pink")
game.Players.LocalPlayer.Status.Team.Value = "NoTeam"
game.Players.LocalPlayer.Status.Team.Value = "NoTeam"
game.Players.LocalPlayer.Status.Team.Value = "NoTeam"
game.Players.LocalPlayer.Status.Team.Value = "NoTeam"
game.Players.LocalPlayer.Status.Team.Value = "NoTeam"
game.Players.LocalPlayer.Status.Team.Value = "NoTeam"
game.Players.LocalPlayer.TeamColor = BrickColor.new("Hot pink")
end)
end)



ss:Button("Server Hop",function()
wait(0.3)
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Server hop  !";
	Text = "Finding New Server ";
})
 
local x = {}
	for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			x[#x + 1] = v.id
		end
	end
	if #x > 0 then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
	else
		return game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Lime X !";
	Text = "Server Hop failed ";
})
		end
 
end)


ss:Button("Less Lag",function()
local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
sethiddenproperty(l,"Technology",2)
sethiddenproperty(t,"Decoration",false)
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
end)


ss:Bind("Toggle GUI",Enum.KeyCode.P,true,function(a)
   library:SetBind(a)
   print("Set".. a ..  " as a gui keybind")
end)

ss:Button("Youtube: GOLDEN cheats",function()

setclipboard ("https://www.youtube.com/channel/UCFtiCEEVzw8HGjj1qVomOrA")
end)

ss:Button("Tiktok: @robloxlegocheats",function()
  setclipboard ("https://tiktok.com/@robloxlegocheats")  
end)

ss:Button("Copy Discord Invite",function()
    setclipboard ("https://discord.com/invite/PqGXqCzp7b ")
end)

end