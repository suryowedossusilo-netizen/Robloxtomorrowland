local Lighting = game:GetService("Lighting")

-- Waktu & atmosphere
Lighting.TimeOfDay = "20:30:00"           -- malam awal
Lighting.Brightness = 1
Lighting.FogStart = 0
Lighting.FogEnd = 2000
Lighting.FogColor = Color3.fromRGB(20, 10, 30) -- gelap dengan sedikit ungu
Lighting.Ambient = Color3.fromRGB(50, 24, 70)  -- ambient interior ungu gelap
Lighting.OutdoorAmbient = Color3.fromRGB(10, 6, 12)

-- Shadow / global
Lighting.GlobalShadows = true
Lighting.EnvironmentDiffuseScale = 0.9
Lighting.EnvironmentSpecularScale = 0.7

-- Skybox (jika ingin gunakan custom sky, ganti asset ID)
local sky = Instance.new("Sky")
-- contoh: sky.SkyboxBk = "rbxassetid://ID"  -- optional: pasang skybox id kamu
sky.SkyboxUp = ""
sky.Parent = Lighting

-- Post-processing effects
-- 1. Bloom (bikin neon/glow)
local bloom = Instance.new("BloomEffect")
bloom.Intensity = 3.2        -- naikkan untuk glow kuat
bloom.Size = 56
bloom.Threshold = 0.6
bloom.Parent = Lighting

-- 2. Color Correction (sesuaikan tone)
local cc = Instance.new("ColorCorrectionEffect")
cc.TintColor = Color3.fromRGB(230, 180, 255) -- sedikit magenta tint
cc.Contrast = 0.08
cc.Saturation = 0.05
cc.Brightness = -0.03
cc.Parent = Lighting

-- 3. SunRays (opsional untuk sedikit glow arah)
local sun = Instance.new("SunRaysEffect")
sun.Intensity = 0.08
sun.Spread = 0.6
sun.Parent = Lighting

-- 4. DepthOfField (opsional, hati-hati pada performa)
local dof = Instance.new("DepthOfFieldEffect")
dof.InFocusRadius = 10
dof.FocusDistance = 60
dof.Parent = Lighting

print("[LightingSetup] Applied club-style lighting defaults.")
