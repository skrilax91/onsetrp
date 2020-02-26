AddRemoteEvent("characterize:GetOptions", function(player)
    CallRemoteEvent(player, "characterize:SetOptions", 
        json_encode(Config.clothing.body),
        json_encode(Config.clothing.shirt), 
        json_encode(Config.clothing.pant), 
        json_encode(Config.clothing.shoe), 
        json_encode(Config.clothing.hair))
end)

AddRemoteEvent("characterize:Submit", function(player, params)
    print('submitted: '..params)
    AddPlayerChat(player, 'Submitted: '..params)
end)
