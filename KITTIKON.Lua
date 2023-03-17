local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("KittiKon", "RJTheme7")

local Tab = Window:NewTab("Main")
local Tab2 = Window:NewTab("Other")
local Tab3 = Window:NewTab("Credits")

local Section = Tab:NewSection("Main")
local Section2 = Tab2:NewSection("Other")
local SectionCredit1 = Tab3:NewSection("Script Founder KITTAKEI")
local SectionCredit1 = Tab3:NewSection("YT:@ArtiFinally")
local SectOwn = Tab:NewSection("Script by KITTIAKEI#9571")
Section:NewSlider("WalkSpeed", "You can change your Speed(Standart 16)", 500, 0, function(s)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
	end)
Section:NewSlider("HipHeight", "You can change your HipHeight(Standart 2)", 500, 2, function(x)
	game.Players.LocalPlayer.Character.Humanoid.HipHeight = x
	end)
Section2:NewButton("F3X TOOL", "Give F3X Tool in you backpack", function()
	loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
end)
Section:NewButton("Flight", "Wow, you can fly! Press [F] on keybord", function()
	repeat wait() until game.Players.LocalPlayer.Character

	local plr = game.Players.LocalPlayer
	local Char = plr.Character
	local HM = Char:WaitForChild("Humanoid")
	local Tors = Char:WaitForChild("LowerTorso")
	local mouse = plr:GetMouse()

	local enabled = false

	mouse.KeyDown:Connect(function(key)
		if key == "f" then
			if enabled == false then
				enabled = true
				local bv = Instance.new("BodyVelocity",Tors)
				bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)

				while enabled == true do
					bv.Velocity = mouse.Hit.LookVector * 100
					wait()
				end
			end
			if enabled == true then
				enabled = false
				Tors:FindFirstChildOfClass("BodyVelocity"):Destroy()
			end	

		end
	end)
end)
Section:NewButton("Noclip", "Are you a ghost? (Not Working T-T)", function()
	local root = script.Parent:WaitForChild("HumanoidRootPart")
	local humanoid = script.Parent:WaitForChild("Humanoid")

	local partToNotAdd = nil

	game:GetService("RunService").RenderStepped:Connect(function()
		local preRay = Ray.new(root.Position,root.CFrame.UpVector * - 5)
		local hit = workspace:FindPartOnRay(preRay,script.Parent)
		if hit then
			partToNotAdd = hit
		else
			partToNotAdd = nil
		end

		for _,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") then
				if v == partToNotAdd then
					v.CanCollide = true
				else
					v.CanCollide = false
				end
			end
		end
	end)
end)
Section2:NewButton("Esp", "you have wallhack?",	function()
	while wait(0.5) do
		for i, childrik in ipairs(workspace:GetDescendants()) do
			if childrik:FindFirstChild("Humanoid") then
				if not childrik:FindFirstChild("EspBox") then
					if childrik ~= game.Players.LocalPlayer.Character then
						local esp = Instance.new("BoxHandleAdornment",childrik)
						esp.Adornee = childrik
						esp.ZIndex = 0
						esp.Size = Vector3.new(4, 5, 1)
						esp.Transparency = 0.65
						esp.Color3 = Color3.fromRGB(255,48,48)
						esp.AlwaysOnTop = true
						esp.Name = "EspBox"
					end
				end
			end
		end
	end
end)
Section2:NewButton("TpToClick", "To teleport, aim at the place and press on keyboard M", function()
local mouse = game.Players.LocalPlayer:GetMouse()
mouse.KeyDown:Connect(function(key)
if key == "m" then
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end
end)
end)
