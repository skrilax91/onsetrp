local _ = function(k,...) return ImportPackage("i18n").t(GetPackageName(),k,...) end

GasStationCached = {}

AddEvent("OnPackageStart", function()
    for i,j in pairs(Config.gasStation.location.location) do
        Config.gasStation.location.pickup[i] = CreatePickup(2 , Config.gasStation.location.location[i][1], Config.gasStation.location.location[i][2], Config.gasStation.location.location[i][3])
        CreateText3D( _("refuel").."\n".._("press_e"), 18, Config.gasStation.location.location[i][1], Config.gasStation.location.location[i][2], Config.gasStation.location.location[i][3] + 120, 0, 0, 0)
        table.insert(GasStationCached, Config.gasStation.location.pickup[i])
    end

    CreateTimer(function()
        for k,v in pairs(GetAllVehicles()) do
            enginestate = GetVehicleEngineState(k)
            if enginestate then
                if VehicleData[k] == nil then
                    return
                end
                if VehicleData[k].fuel ~= 0 then
                    VehicleData[k].fuel = VehicleData[k].fuel - 1
                end
                if VehicleData[k].fuel == 0 then
                    StopVehicleEngine(k)
                    VehicleData[k].fuel = 0
                end
                SetVehiclePropertyValue(k, "fuel", VehicleData[k].fuel, true)
            end
        end
    end, 15000)
end)

AddEvent("OnPlayerJoin", function(player)
    CallRemoteEvent(player, "gasStationSetup", GasStationCached)
end)

AddEvent("OnPlayerEnterVehicle", function( player, vehicle, seat )
    if VehicleData[vehicle] == nil then
        return
    end
    if seat == 1 then
        SetVehiclePropertyValue(vehicle, "fuel", VehicleData[vehicle].fuel, true)
        if VehicleData[vehicle].fuel == 0 then
            StopVehicleEngine(vehicle)
        end
    end
end)

AddEvent("OnPlayerLeaveVehicle", function( player, vehicle, seat)
    if seat == 1 then
        StopVehicleEngine(vehicle)
    end
end)

AddRemoteEvent("StartRefuel", function(player, vehicle)
    if GetPlayerState(player) >= 2 then
        CallRemoteEvent(player, "MakeSuccessNotification", _("cant_while_driving"))
    else
        local cash = PlayerData[player].inventory['cash'] or 0
        local fuel = VehicleData[vehicle].fuel or 100
    
        CallRemoteEvent(player, "OpenUIGasStation", cash, 100, fuel, Config.gasStation.Fuel.gasoil.price, Config.gasStation.Fuel.gasoilplus.price)
    end
end)

AddRemoteEvent("PayGasStation", function(player, count, fuel, vehicle)
    price = count * tonumber(Config.gasStation.Fuel[fuel])

    local resultPay = RemovePlayerCash(player, price)
    if resultPay then
        VehicleData[vehicle].fuel = VehicleData[vehicle].fuel + count
        if VehicleData[vehicle].fuel > 100 then VehicleData[vehicle].fuel = 100 end
        
        CallRemoteEvent(player, "UpdateGasStation", PlayerData[player].inventory['cash'], 100, VehicleData[vehicle].fuel)

        SetVehiclePropertyValue(vehicle, "fuel", VehicleData[vehicle].fuel, true)
    else
        CallRemoteEvent(player, "MakeNotification", _("not_enought_cash"), "linear-gradient(to right, #ff5f6d, #ffc371)")
    end
end)
