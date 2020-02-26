sr = ImportPackage("soundstreamer")
local _ = function(k, ...) return ImportPackage("i18n").t(GetPackageName(), k, ...) end

local nowPlaying = {}
local TIMER_REFRESH_RADIO_POSITION = 25
local HOOD_BONUS = 300
local RADIO_RADIUS = 800

AddEvent("OnPackageStart", function()
    CreateTimer(function()        
        for k, v in pairs(nowPlaying) do
            if IsValidVehicle(k) then            
                local x, y, z = GetVehicleLocation(k)
                sr.SetSound3DLocation(v.sound, x, y, z + HOOD_BONUS)
                local x2,y2,z2 = GetObjectLocation(v.sound)
            else
                sr.DestroySound3D(nowPlaying[k].sound)
                nowPlaying[k] = nil
            end
        end    
    end, TIMER_REFRESH_RADIO_POSITION)
end)

function VehicleRadioToggle(player)
    local veh = GetPlayerVehicle(player)
    if veh ~= nil and veh ~= 0 then
        if GetPlayerVehicleSeat(player) ~= 1 and GetPlayerVehicleSeat(player) ~= 2 then return end
        local x, y, z = GetVehicleLocation(veh)
        if nowPlaying[veh] ~= nil then
            sr.DestroySound3D(nowPlaying[veh].sound)
            nowPlaying[veh] = nil
            for k=1, GetVehicleNumberOfSeats(veh) do
                local target = GetVehiclePassenger(veh, k)
                if IsValidPlayer(target) then 
                    CallRemoteEvent(target, "vehicle:radio:toggleui", false)
                end
            end
        else
            nowPlaying[veh] = {}
            nowPlaying[veh].channel = 1
            local sound = sr.CreateSound3D(Config.radioList[1].url, x, y, z + HOOD_BONUS, RADIO_RADIUS, Config.radioBaseVolume)
            nowPlaying[veh].sound = sound
            nowPlaying[veh].volume = Config.radioBaseVolume            
            for k=1, GetVehicleNumberOfSeats(veh) do                
                local target = GetVehiclePassenger(veh, k)
                if IsValidPlayer(target) then 
                    CallRemoteEvent(target, "vehicle:radio:toggleui", true) 
                    CallRemoteEvent(target, "vehicle:radio:updateui", Config.radioList[nowPlaying[veh].channel].label, nowPlaying[veh].volume)  
                end
            end                  
        end
    end
end
AddRemoteEvent("vehicle:radio:toggle", VehicleRadioToggle)

function VehicleRadioUpdateVolume(player, increaseOrLower)
    local veh = GetPlayerVehicle(player)
    if veh ~= nil and veh ~= 0 and nowPlaying[veh] ~= nil then
        if GetPlayerVehicleSeat(player) ~= 1 and GetPlayerVehicleSeat(player) ~= 2 then return end
        if increaseOrLower == 1 then -- Increase
            nowPlaying[veh].volume = nowPlaying[veh].volume + 0.1
            if nowPlaying[veh].volume > 1 then nowPlaying[veh].volume = 1 end
        elseif increaseOrLower == 2 then -- Lower
            nowPlaying[veh].volume = nowPlaying[veh].volume - 0.1
            if nowPlaying[veh].volume < 0 then nowPlaying[veh].volume = 0 end
        end
        sr.SetSound3DVolume(nowPlaying[veh].sound, nowPlaying[veh].volume)
        for k=1, GetVehicleNumberOfSeats(veh) do
            local target = GetVehiclePassenger(veh, k)
            if IsValidPlayer(target) then CallRemoteEvent(target, "vehicle:radio:updateui", Config.radioList[nowPlaying[veh].channel].label, nowPlaying[veh].volume) end
        end    
    end
end
AddRemoteEvent("vehicle:radio:updatevolume", VehicleRadioUpdateVolume)

function VehicleRadioUpdateChannel(player, channelId)
    local veh = GetPlayerVehicle(player)
    if veh ~= nil and veh ~= 0 and nowPlaying[veh] ~= nil and channelId <= 7 then
        if GetPlayerVehicleSeat(player) ~= 1 and GetPlayerVehicleSeat(player) ~= 2 then return end
        local x, y, z = GetVehicleLocation(veh)
        sr.DestroySound3D(nowPlaying[veh].sound)
        local sound = sr.CreateSound3D(Config.radioList[channelId].url, x, y, z + HOOD_BONUS, RADIO_RADIUS, nowPlaying[veh].volume)        
        nowPlaying[veh].sound = sound
        nowPlaying[veh].channel = channelId   
        for k=1, GetVehicleNumberOfSeats(veh) do
            local target = GetVehiclePassenger(veh, k)
            if IsValidPlayer(target) then CallRemoteEvent(target, "vehicle:radio:updateui", Config.radioList[nowPlaying[veh].channel].label, nowPlaying[veh].volume) end
        end
    end
end
AddRemoteEvent("vehicle:radio:updatechannel", VehicleRadioUpdateChannel)

AddEvent("OnPlayerLeaveVehicle", function(player, veh, seat)
    if seat == 1 and nowPlaying[veh] ~= nil then
        sr.DestroySound3D(nowPlaying[veh].sound)
        nowPlaying[veh] = nil        
    end
    CallRemoteEvent(player, "vehicle:radio:toggleui", false)
end)

AddEvent("OnPlayerEnterVehicle", function(player, veh, seat)
    if nowPlaying[veh] ~= nil then
        CallRemoteEvent(player, "vehicle:radio:toggleui", true)
    end
end)
