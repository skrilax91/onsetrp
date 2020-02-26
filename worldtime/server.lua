function OnPackageStart()
    -- Start the day/night system
    CreateTimer(function()
		if Config.worldTime >= 24 then
			Config.worldTime = 0
		end

		-- edited by wasied
		if Config.worldTime < Config.morning or Config.worldTime > Config.evening then -- night
			Config.worldTime = Config.worldTime + Config.nightTime
		else -- day
			Config.worldTime = Config.worldTime + Config.dayTime
		end
		--

		for k, v in pairs(GetAllPlayers()) do
            CallRemoteEvent(v, "setTimeOfClient", Config.worldTime)
		end
    end, 1000)
end
AddEvent("OnPackageStart", OnPackageStart)

function OnPlayerSpawn(player)
    -- This script is used to make the time changing and synchronise to all client
	CallRemoteEvent(player, "setTimeOfClient", Config.worldTime)
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)

AddCommand("time", function(player, time)
	if PlayerData[player].admin == 1 and (tonumber(time) >= 0 and tonumber(time) <= 23)then
		Config.worldTime = tonumber(time)
	end
end)
