local _ = function(k,...) return ImportPackage("i18n").t(GetPackageName(),k,...) end

LicensesNpcLocation = { x = 169336, y = 193430, z = 1307, h = 180 }
-- LicensesNpcLocation = { x = 211564, y = 175848, z = 1307, h = 180 }
LicensesNpc = {}

AddEvent("OnPackageStart", function()
    LicensesNpc = CreateNPC(Config.LicensesNpcLocation.x, Config.LicensesNpcLocation.y, Config.LicensesNpcLocation.z, Config.LicensesNpcLocation.h)
    CreateText3D(_("license_shop").."\n".._("press_e"), 18, Config.LicensesNpcLocation.x, Config.LicensesNpcLocation.y, Config.LicensesNpcLocation.z + 120, 0, 0, 0)
end)

AddEvent("OnPlayerJoin", function(player)
    CallRemoteEvent(player, "LicenseSetup", LicensesNpc)
end)

AddRemoteEvent("LicenseInteract", function(player)
    local availableLicenses = {}

    for k, v in pairs(Config.Licenses) do
        if PlayerData[player][k] == 0 then
            availableLicenses[k] = v
        end
    end

    CallRemoteEvent(player, "OpenLicenses", availableLicenses)
end)

AddRemoteEvent("BuyLicense", function (player, license)
    local price = Config.Licenses[license].price

    if GetPlayerCash(player) < price then
        CallRemoteEvent(player, "MakeNotification", _("not_enought_cash"), "linear-gradient(to right, #ff5f6d, #ffc371)")
    else
        RemovePlayerCash(player, price)
        PlayerData[player][license] = 1
        CallRemoteEvent(player, "MakeNotification", _("shop_success_buy", "1",_("license").._(license), _("price_in_currency", price)), "linear-gradient(to right, #00b09b, #96c93d)")
    end
end)

AddEvent("OnNPCDamage", function(npc)
    SetNPCHealth( npc, 100 )
end)
