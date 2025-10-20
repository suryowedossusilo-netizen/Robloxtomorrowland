--[[ 
    Elysium Club Lighting System v2 by Edo x Oto
    Tema: Romawi Modern + Smooth RGB Floor + Logo Club
--]]

local Lighting = game:GetService("Lighting")
local Workspace = game.Workspace

-- 🔹 Folder utama club
local clubFolder = Instance.new("Folder")
clubFolder.Name = "ElysiumClub"
clubFolder.Parent = Workspace

-- 🔹 Membuat floor gabungan segitiga + persegi panjang
local floorBase = Instance.new("Part")
floorBase.Name = "DanceFloor"
floorBase.Size = Vector3.new(40, 1, 25)
floorBase.Anchored = true
floorBase.Position = Vector3.new(0, 0, 0)
floorBase.Material = Enum.Material.Neon
floorBase.Color = Color3.fromRGB(255, 255, 255)
floorBase.Transparency = 0.15
floorBase.Parent = clubFolder

-- 🔹 Segitiga depan floor
local trianglePart = Instance.new("WedgePart")
trianglePart.Name = "FrontTriangle"
trianglePart.Size = Vector3.new(40, 1, 20)
trianglePart.Anchored = true
trianglePart.Position = Vector3.new(0, 0, -22)
trianglePart.Material = Enum.Material.Neon
trianglePart.Color = Color3.fromRGB(255, 255, 255)
trianglePart.Transparency = 0.15
trianglePart.Orientation = Vector3.new(0, 180, 0)
trianglePart.Parent = clubFolder

-- 🔹 Tiang untuk dancer di sisi-sisi floor
local function createPole(x, z)
	local pole = Instance.new("Part")
	pole.Name = "DancePole"
	pole.Size = Vector3.new(0.5, 10, 0.5)
	pole.Anchored = true
	pole.Position = Vector3.new(x, 5, z)
	pole.Material = Enum.Material.Metal
	pole.Color = Color3.fromRGB(180, 180, 180)
	pole.Parent = clubFolder
end

local poleOffsetX, poleOffsetZ = 18, 10
createPole(poleOffsetX, poleOffsetZ)
createPole(-poleOffsetX, poleOffsetZ)
createPole(poleOffsetX, -poleOffsetZ - 10)
createPole(-poleOffsetX, -poleOffsetZ - 10)

-- 🔹 Menambahkan logo Elysium di tengah lantai
local logo = Instance.new("Decal")
logo.Name = "ElysiumLogo"
logo.Texture = "rbxassetid://LOGO_ID"  -- 🔸 Ganti dengan ID upload logo-mu
logo.Face = Enum.NormalId.Top
logo.Transparency = 0.1
logo.Parent = floorBase

-- 🔹 Smooth RGB transition system
local RunService = game:GetService("RunService")
local hue = 0

RunService.RenderStepped:Connect(function(dt)
	hue = (hue + dt * 0.05) % 1
	local color = Color3.fromHSV(hue, 1, 1)
	floorBase.Color = color
	trianglePart.Color = color
	logo.Color3 = color
end)

-- 🔹 Pencahayaan lembut dari lantai
local floorLight = Instance.new("PointLight")
floorLight.Color = Color3.fromRGB(255, 255, 255)
floorLight.Brightness = 4
floorLight.Range = 60
floorLight.Parent = floorBase

print("✅ Elysium Club lighting + logo aktif.")
