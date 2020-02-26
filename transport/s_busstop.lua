local _ = function(k,...) return ImportPackage("i18n").t(GetPackageName(),k,...) end

local pickup = {}

local ticketPrice = 5
local kilometerPrice = 2

bus_stops_cached = {}

function CalculateAmount(distance) 
    if distance <= 4 then
        return 0
    end
    return (math.floor(distance / 1000) * kilometerPrice) + ticketPrice
end

AddEvent("OnPackageStart", function() -- Création des halos jaunes sur les arrêts de bus
    for i,j in pairs(Config.busStop) do
        pickup[i] = CreatePickup(2 , j.x, j.y, j.z)
        CreateText3D( _("bus_stop").."\n".._("press_e"), 18, j.x, j.y, j.z + 120, 0, 0, 0)
        table.insert(bus_stops_cached, pickup[i])
    end    

    for i,j in pairs(Config.addProp) do -- Ajout des arrêts de bus qui ne sont pas présents de base
        CreateObject(1588, j.x, j.y, j.z, 0, j.ry)
    end    
end)

AddEvent("OnPlayerJoin", function(player) -- Mise en cache client
    CallRemoteEvent(player, "busStopSetup", bus_stops_cached)
end)

AddRemoteEvent("TransportMenuSGetListe", function(player) -- Récupération de la liste des arrêts de bus et envoie au menu
    transportMenuListe = {}
    local x,y = GetPlayerLocation(player)
    for k,v in pairs(Config.busStop) do
        local distance = math.floor(tonumber(GetDistance2D(x, y, v.x, v.y)) / 100)
        transportMenuListe[k] = { label= v.labelArret, distance= distance, amount= CalculateAmount(distance)}
        if distance <= 4 then
            transportMenuListe[k].label = transportMenuListe[k].label.." ".._("transport_you_are_there")
        end
    end
    CallRemoteEvent(player, "TransportMenuCOpenMenu", transportMenuListe)
end)

AddRemoteEvent("TransportMenuSTeleportPlayer", function(player, arret) -- Téléport du joueur a l'arrêt de bus
    for k,v in pairs(Config.busStop) do
        if k == tonumber(arret) then
            local x,y = GetPlayerLocation(player)
            local amount = CalculateAmount(math.floor(tonumber(GetDistance2D(x, y, v.x, v.y)) / 100))

            if GetPlayerCash(player) >= amount then                
                CallRemoteEvent(player, "TransportMenuCPresentToastSuccess")
                
                Delay(10000, function() -- Timer de 10s pour plus de RP
                    SetPlayerLocation(player, v.x, v.y, v.z + 200) -- pour éviter la chute sous le sol (marche pas tout le temps :( )
                    RemovePlayerCash(player, amount)
                end)                
            else
                CallRemoteEvent(player, "TransportMenuCPresentNotEnoughMoney")
            end
            return
        end
    end
end)
