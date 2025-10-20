print("Server aktif: Tomorrowland dimulai!")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

-- RemoteEvent untuk komunikasi client <-> server
local event = Instance.new("RemoteEvent")
event.Name = "TomorrowlandEvent"
event.Parent = ReplicatedStorage

-- Spawn NPC DJ
local function spawnDJ()
	local dj = Instance.new("Part")
	dj.Name = "DJ_NPC"
	dj.Size = Vector3.new(2, 5, 2)
	dj.Anchored = true
	dj.Position = Vector3.new(0, 3, 0)
	dj.Color = Color3.fromRGB(255, 200, 50)
	dj.Parent = workspace
	print("DJ NPC siap tampil!")
end

spawnDJ()

-- Kirim sinyal ke client untuk mulai show
task.wait(5)
for _, player in pairs(game.Players:GetPlayers()) do
	event:FireClient(player, "StartShow")
end

-- Loop efek panggung
while true do
	task.wait(15)
	for _, player in pairs(game.Players:GetPlayers()) do
		event:FireClient(player, "LightShow")
	end
	task.wait(10)
	for _, player in pairs(game.Players:GetPlayers()) do
		event:FireClient(player, "Fireworks")
	end
end
