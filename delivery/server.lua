local _ = function(k, ...) return ImportPackage("i18n").t(GetPackageName(), k, ...) end

local deliveryNpcCached = {}
local playerDelivery = {}

local trucksOnLocation = {}

AddEvent("OnPackageStart", function()
    for k, v in pairs(Config.delivery.NPC) do
        Config.delivery.NPC[k].npc = CreateNPC(Config.delivery.NPC[k].location[1], Config.delivery.NPC[k].location[2], Config.delivery.NPC[k].location[3], Config.delivery.NPC[k].location[4])
        CreateText3D(_("delivery_job") .. "\n" .. _("press_e"), 18, Config.delivery.NPC[k].location[1], Config.delivery.NPC[k].location[2], Config.delivery.NPC[k].location[3] + 120, 0, 0, 0)
        table.insert(deliveryNpcCached, Config.delivery.NPC[k].npc)
    end
end)

AddEvent("OnPlayerQuit", function(player)
    if playerDelivery[player] ~= nil then
        playerDelivery[player] = nil
    end
end)

AddEvent("OnPlayerJoin", function(player)
    CallRemoteEvent(player, "SetupDelivery", deliveryNpcCached, Config.delivery.locationPrice)
end)

AddRemoteEvent("StartStopDelivery", function(player)
    local nearestDelivery = GetNearestDelivery(player)
    local useBank = PlayerData[player].bank_balance >= Config.delivery.locationPrice
    local useCash = PlayerData[player].inventory['cash'] ~= nil and PlayerData[player].inventory['cash'] >= Config.delivery.locationPrice
    
    if PlayerData[player].job == "" then
        if PlayerData[player].job_vehicle ~= nil then
            DestroyVehicle(PlayerData[player].job_vehicle)
            DestroyVehicleData(PlayerData[player].job_vehicle)
            PlayerData[player].job_vehicle = nil
            CallRemoteEvent(player, "ClientDestroyCurrentWaypoint")
        else
            local isSpawnable = true
            local jobCount = 0
            for k, v in pairs(PlayerData) do
                if v.job == "delivery" then
                    jobCount = jobCount + 1
                end
            end
            if jobCount == 15 then
                return CallRemoteEvent(player, "MakeNotification", _("job_full"), "linear-gradient(to right, #ff5f6d, #ffc371)")
            end
            for k, v in pairs(GetAllVehicles()) do
                local x, y, z = GetVehicleLocation(v)
                local dist2 = GetDistance3D(Config.delivery.NPC[nearestDelivery].spawn[1], Config.delivery.NPC[nearestDelivery].spawn[2], Config.delivery.NPC[nearestDelivery].spawn[3], x, y, z)
                if dist2 < 500.0 then
                    isSpawnable = false
                    break
                end
            end
            if isSpawnable then
                
                if useBank then
                    PlayerData[player].bank_balance = PlayerData[player].bank_balance - Config.delivery.locationPrice
                elseif useCash then
                    RemovePlayerCash(player, Config.delivery.locationPrice)
                else
                    CallRemoteEvent(player, "MakeErrorNotification", _("delivery_not_enough_location_cash", Config.delivery.locationPrice))
                    return
                end
                
                local vehicle = CreateVehicle(24, Config.delivery.NPC[nearestDelivery].spawn[1], Config.delivery.NPC[nearestDelivery].spawn[2], Config.delivery.NPC[nearestDelivery].spawn[3], Config.delivery.NPC[nearestDelivery].spawn[4])
                PlayerData[player].job_vehicle = vehicle
                CreateVehicleData(player, vehicle, 24)
                SetVehicleRespawnParams(vehicle, false)
                SetVehiclePropertyValue(vehicle, "locked", true, true)
                PlayerData[player].job = "delivery"
                
                trucksOnLocation[PlayerData[player].accountid] = vehicle
                
                CallRemoteEvent(player, "MakeNotification", _("delivery_start_success"), "linear-gradient(to right, #00b09b, #96c93d)")
                return
            end
        end
    elseif PlayerData[player].job == "delivery" then
        
        if trucksOnLocation[PlayerData[player].accountid] ~= nil then -- If the player has a job vehicle
            local x, y, z = GetVehicleLocation(PlayerData[player].job_vehicle)
            
            local IsNearby = false
            for k, v in pairs(Config.delivery.NPC) do -- For each location npc
                local dist = GetDistance3D(x, y, z, v.location[1], v.location[2], v.location[3])
                if dist <= 2000 then -- if vehicle is nearby
                    IsNearby = true
                end
            end
            
            if IsNearby then
                local refund = Config.delivery.locationPrice * Config.delivery.locationRefoundPercentage
                PlayerData[player].bank_balance = PlayerData[player].bank_balance + refund
                CallRemoteEvent(player, "MakeNotification", _("delivery_location_price_refunded", refund), "linear-gradient(to right, #00b09b, #96c93d)")
            else
                CallRemoteEvent(player, "MakeErrorNotification", _("delivery_vehicle_too_far_away"))
            end
        end
        
        if trucksOnLocation[PlayerData[player].accountid] ~= nil then
            DestroyVehicle(trucksOnLocation[PlayerData[player].accountid])
            DestroyVehicleData(trucksOnLocation[PlayerData[player].accountid])
            PlayerData[player].job_vehicle = nil
            trucksOnLocation[PlayerData[player].accountid] = nil
        end
        PlayerData[player].job = ""
        playerDelivery[player] = nil
        CallRemoteEvent(player, "ClientDestroyCurrentWaypoint")
    
    end
end)

AddRemoteEvent("OpenDeliveryMenu", function(player)
    if PlayerData[player].job == "delivery" then
        CallRemoteEvent(player, "DeliveryMenu")
    end
end)

AddRemoteEvent("NextDelivery", function(player)
    if playerDelivery[player] ~= nil then
        return CallRemoteEvent(player, "MakeNotification", _("finish_your_delivery"), "linear-gradient(to right, #ff5f6d, #ffc371)")
    end
    delivery = {}
    delivery[1] = Random(1, #Config.delivery.point)
    local x, y, z = GetPlayerLocation(player)
    local dist = GetDistance3D(x, y, z, Config.delivery.point[delivery[1]][1], Config.delivery.point[delivery[1]][2], Config.delivery.point[delivery[1]][3])
    delivery[2] = ((dist / 100) / Config.delivery.priceDivider) * Config.delivery.pricePerDivide
    playerDelivery[player] = delivery
    CallRemoteEvent(player, "ClientCreateWaypoint", _("delivery"), Config.delivery.point[delivery[1]][1], Config.delivery.point[delivery[1]][2], Config.delivery.point[delivery[1]][3])
    CallRemoteEvent(player, "MakeNotification", _("new_delivery"), "linear-gradient(to right, #00b09b, #96c93d)")
end)

AddRemoteEvent("FinishDelivery", function(player)
    delivery = playerDelivery[player]
    
    if delivery == nil then
        CallRemoteEvent(player, "MakeNotification", _("no_delivery"), "linear-gradient(to right, #ff5f6d, #ffc371)")
        return
    end
    
    local x, y, z = GetPlayerLocation(player)
    
    local dist = GetDistance3D(x, y, z, Config.delivery.point[delivery[1]][1], Config.delivery.point[delivery[1]][2], Config.delivery.point[delivery[1]][3])
    
    if dist < 150.0 then
        if PlayerData[player].job_vehicle ~= GetPlayerVehicle(player) then
            CallRemoteEvent(player, "MakeErrorNotification", _("delivery_need_delivery_truck"))
            return
        end
        
        CallRemoteEvent(player, "MakeNotification", _("finished_delivery", math.ceil(delivery[2]) or Config.delivery.pricePerDivide, _("currency")), "linear-gradient(to right, #00b09b, #96c93d)")
        
        AddPlayerCash(player, math.ceil(delivery[2]) or Config.delivery.pricePerDivide)
        playerDelivery[player] = nil
        CallRemoteEvent(player, "ClientDestroyCurrentWaypoint")
    else
        CallRemoteEvent(player, "MakeNotification", _("no_delivery_point"), "linear-gradient(to right, #ff5f6d, #ffc371)")
    end
end)

function GetNearestDelivery(player)
    local x, y, z = GetPlayerLocation(player)
    
    for k, v in pairs(GetAllNPC()) do
        local x2, y2, z2 = GetNPCLocation(v)
        local dist = GetDistance3D(x, y, z, x2, y2, z2)
        
        if dist < 250.0 then
            for k, i in pairs(Config.delivery.NPC) do
                if v == i.npc then
                    return k
                end
            end
        end
    end
    
    return 0
end

AddEvent("job:onspawn", function(player)
    PlayerData[player].job_vehicle = trucksOnLocation[PlayerData[player].accountid]
end)
