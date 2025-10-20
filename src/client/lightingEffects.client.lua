-- run this in Studio Command Bar or as a Script that creates sign models
local Workspace = game:GetService("Workspace")

local sign = Instance.new("Part")
sign.Name = "NeonSign"
sign.Size = Vector3.new(8, 3, 0.2)
sign.Position = Vector3.new(0, 6, 0)
sign.Anchored = true
sign.Material = Enum.Material.Neon
sign.Color = Color3.fromRGB(255, 70, 150) -- pink neon
sign.Parent = Workspace

-- Optional decal/text: use SurfaceGui with TextLabel for crisp text
local surfaceGui = Instance.new("SurfaceGui", sign)
surfaceGui.Face = Enum.NormalId.Front
surfaceGui.AlwaysOnTop = true
surfaceGui.CanvasSize = Vector2.new(800, 300)

local label = Instance.new("TextLabel", surfaceGui)
label.Size = UDim2.new(1,0,1,0)
label.BackgroundTransparency = 1
label.Text = "ELYSIUM CLUB"
label.Font = Enum.Font.GothamBlack
label.TextScaled = true
label.TextColor3 = Color3.fromRGB(255, 230, 240)
label.TextStrokeTransparency = 0.6
label.TextTransparency = 0

-- Light to create bloom + local glow
local pl = Instance.new("PointLight", sign)
pl.Range = 18
pl.Brightness = 6
pl.Shadows = true
pl.Color = sign.Color