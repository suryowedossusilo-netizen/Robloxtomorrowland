-- === Fungsi Fireworks ===
local function fireworks()
    local stage = workspace:WaitForChild("Stage")

    for i = 1, 6 do
        local part = Instance.new("Part")
        part.Size = Vector3.new(0.5, 0.5, 0.5)
        part.Position = stage.Position + Vector3.new(math.random(-20,20), 10, math.random(-20,20))
        part.Transparency = 1
        part.Anchored = true
        part.Parent = workspace

        local particle = Instance.new("ParticleEmitter")
        particle.Texture = "rbxassetid://241594314" -- contoh tekstur percikan
        particle.Lifetime = NumberRange.new(1)
        particle.Rate = 200
        particle.Speed = NumberRange.new(20)
        particle.Parent = part

        task.delay(1.5, function()
            part:Destroy()
        end)
    end
end

-- === Fungsi Lighting Club Effect ===
local function applyClubLighting()
    local Lighting = game:GetService("Lighting")

    -- Warna lighting berubah ke suasana pesta
    Lighting.Ambient = Color3.fromRGB(80, 30, 100)
    Lighting.OutdoorAmbient = Color3.fromRGB(20, 10, 30)
    Lighting.Brightness = 2

    -- Efek Bloom
    local bloom = Lighting:FindFirstChildOfClass("BloomEffect") or Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 3.5
    bloom.Size = 60
    bloom.Threshold = 0.5

    -- Color Correction (tint magenta)
    local cc = Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect", Lighting)
    cc.TintColor = Color3.fromRGB(230, 150, 255)
    cc.Saturation = 0.3
    cc.Contrast = 0.1

    print("✨ Lighting club mode aktif")
end

local function pulseNeon()
    local TweenService = game:GetService("TweenService")

    for _, light in pairs(workspace:GetDescendants()) do
        if light:IsA("PointLight") or light:IsA("SurfaceLight") then
            if light.Parent and light.Parent.Name:lower():find("neon") then
                local tweenInfo = TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, 0)
                local goals = {Brightness = math.clamp(light.Brightness * 1.5, 1, 12)}
                local t = TweenService:Create(light, tweenInfo, goals)
                t:Play()
            end
        end
    end
end

-- === Fungsi Laser Show ===
local function laserShow()
    print("⚡ Menyalakan Laser Show!")
    local stage = workspace:WaitForChild("Stage")

    -- 🔥 Nyalakan efek Lighting Club
    applyClubLighting()

    -- 💡 Hidupkan kedipan neon
    pulseNeon()

    -- 🎆 Jalankan kembang api
    fireworks()

    -- 🕒 Durasi show (5 detik contoh)
    task.wait(5)

    -- 🎵 Kembali ke lighting normal
    local Lighting = game:GetService("Lighting")
    Lighting.Ambient = Color3.fromRGB(40, 40, 40)
    Lighting.OutdoorAmbient = Color3.fromRGB(20, 20, 20)
    Lighting.Brightness = 1
    print("🎇 Laser Show selesai!")
end

-- === Eksekusi saat player join / event tertentu ===
task.wait(2)
laserShow()
