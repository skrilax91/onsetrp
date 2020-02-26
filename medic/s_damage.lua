local _ = function(k, ...) return ImportPackage("i18n").t(GetPackageName(), k, ...) end

local BODY_Z = 50
local HEAD_Z = 150
local HEAD_Z_CROUCHING = 130

local HEADSHOT_BONUS = 20

local bleedingTimers = {}

AddEvent("OnPlayerDeath", function(player, instigator)
    CallRemoteEvent(player, "damage:death:toggleeffect", 1)
    CleanPlayerEffects(player)
end)

AddEvent("OnPlayerSpawn", function(player)
    CallRemoteEvent(player, "damage:death:toggleeffect", 0)
end)

AddEvent("OnPlayerWeaponShot", function(player, weapon, hittype, hitid, hitX, hitY, hitZ, startX, startY, normalX, normalY, normalZ)
    if hittype == 2 and weapon ~= 1 and weapon ~= 21 then -- Only for players with other weaps than fist and tazer
        -- GET PLAYER POS
        local x, y, z = GetPlayerLocation(hitid)
        -- GET PLAYER FEETS POS
        local feetPos = z - 90
        -- CROUCHING CASE
        local headZ = HEAD_Z
        local bodyZ = BODY_Z
        if GetPlayerMovementMode(hitid) == 4 then
            headZ = HEAD_Z_CROUCHING
        end
        -- APPLY MORE DMG WHEN HEADSHOT
        if hitZ > feetPos + headZ then 
            SetPlayerHealth(hitid, GetPlayerHealth(hitid) - HEADSHOT_BONUS)            
        end
    end    
    if hittype == 2 and weapon == 21 then
        ApplyTaserEffect(hitid)
    end
end)

AddEvent("OnPlayerDamage", function(player, damagetype, amount)
    if GetPlayerHealth(player) > 0 and damagetype == 1 and amount > 10 then
        math.randomseed(os.time())
        local lucky = math.random(100)
        if lucky <= Config.bleedingChance then
            ApplyBleeding(player, amount)
        end
    end
end)

function ApplyTaserEffect(player)
    SetPlayerRagdoll(player, true)-- Makes player ragdoll
    CallRemoteEvent(player, "LockControlMove", true)
    CallRemoteEvent(player, "damage:taser:starteffect", Config.tazerLockDuration)
    Delay(Config.tazerLockDuration, function()-- Waits 6 seconds before the player can stand up again
        SetPlayerRagdoll(player, false)-- Disables the ragdoll so he can walk again.
        SetPlayerAnimation(player, "PUSHUP_END")
        CallRemoteEvent(player, "LockControlMove", false)
        Delay(2000, function()
            CallEvent("police:refreshcuff", player)
        end)
    end)
end

function ApplyBleeding(player, damageAmount)
    local damages = (tonumber(damageAmount) / Config.InitialDamageToBleed)
    local bleedingTime = math.ceil(damages / Config.DmamgePerTick)-- calculate the amount of time while the player will bleed
    
    -- Reset timer if another bleed occur
    if bleedingTimers[player] ~= nil then
        DestroyTimer(bleedingTimers[player].timer)
    end
    bleedingTimers[player] = {}
    
    CallRemoteEvent(player, "damage:bleed:toggleeffect", 1)
    
    local i = 0
    bleedingTimers[player].timer = CreateTimer(function()
        if i >= bleedingTime or GetPlayerHealth(player) < 1 then -- end is reached
            if GetPlayerHealth(player) > 0 then
                CallRemoteEvent(player, "damage:bleed:toggleeffect", 0)
            end
            DestroyTimer(bleedingTimers[player].timer)
            bleedingTimers[player] = nil
            return
        end
        i = i + 1
        SetPlayerHealth(player, GetPlayerHealth(player) - Config.DmamgePerTick)
        CallRemoteEvent(player, "damage:bleed:tickeffect", Config.BleedEffectAmount)
        for k, v in pairs(GetStreamedPlayersForPlayer(player)) do
            if IsValidPlayer(v) then
                CallRemoteEvent(v, "damage:bleed:dropblood", player)
            end
        end
    end, Config.BlledingDamageInterval)
end

function CleanPlayerEffects(player)
    if bleedingTimers[player] and bleedingTimers[player].timer then
        DestroyTimer(bleedingTimers[player].timer)
        bleedingTimers[player] = nil
    end
end
AddEvent("OnPlayerQuit", CleanPlayerEffects)

function IsPlayerBleeding(player)
    if bleedingTimers[player] ~= nil and bleedingTimers[player].timer ~= nil then
        return true
    end
    return false
end

function StopBleedingForPlayer(player)
    if bleedingTimers[player] ~= nil and bleedingTimers[player].timer ~= nil then
        DestroyTimer(bleedingTimers[player].timer)
        bleedingTimers[player] = nil
    end
end
