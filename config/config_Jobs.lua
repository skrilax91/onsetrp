--+------------------------------------------+
--|                  Global                  |
--+------------------------------------------+

-- Allow the respawn of the vehicle by destroying the previously spawned one. (Can break RP if the car is stolen or need repairs or fuel)
Config.AllowVehicleRespawn = false

--+------------------------------------------+
--|                  Police                  |
--+------------------------------------------+

-- how many policemens at the same time
Config.MaxPolice = 30
-- Number of handcuffs per players
Config.nbHandcuffs = 3

Config.Police = {
    vehiclespawnLocation = {
        {x = 189301, y = 206802, z = 1320, h = 220},
        {x = -173007, y = -65864, z = 1130, h = -90},
    },
    serviceNPC = {
        {x = 191680, y = 208448, z = 2427, h = 0},
        {x = -173771, y = -64070, z = 1209, h = 90},
    },
    vehicleNPC = {
        {x = 189593, y = 206346, z = 1323, h = 180},
        {x = -172714, y = -65156, z = 1149, h = -90},
    },
    garage = {
        {x = 197007, y = 205898, z = 1321},
        {x = -172667, y = -65824, z = 1130},
    },
    equipmentNPC = {
        {x = 192373, y = 208150, z = 2420, h = 180},
        {x = -173980, y = -63613, z = 1209, h = -90},
    }
}

--+------------------------------------------+
--|                  Medic                   |
--+------------------------------------------+

-- how many medic at the same time
Config.MaxMedic = 30
-- time before respawn
config.waitbeforerespawn = 30*60 -- 30 minutes
-- percentage of success revive
Config.revivePercentSuccess = 40
-- time needed to revive someone
Config.timeToRevive = 15
-- auto call medic on death
Config.autoCall = false
-- time needed to heal
Config.timeToHeal = 5

Config.medkitHeal = 10
Config.medkitMaxheal = 30
Config.adrSyringeHeal = 50
Config.ItemTimeToUse = 5

Config.Medic = {
    defaultRespawnPoint = {x = 212124, y = 159055, z = 1305, h = 90},

    equipmentNeeded = {
        {item = "defibrillator", qty = 1},
        {item = "adrenaline_syringe", qty = 5},
        {item = "bandage", qty = 5},
        {item = "health_kit", qty = 3},
    }

    vehiclespawnLocation = {
        {x = 213325, y = 161177, z = 1305, h = -90},
    },
    serviceNPC = {
        {x = 212493, y = 157096, z = 2780, h = 180},
    },
    vehicleNPC = {
        {x = 212571, y = 159486, z = 1320, h = 90},
    },
    garage = {
        {x = 215766, y = 161131, z = 1305},
    },
    equipmentNPC = {
        {x = 212744, y = 157405, z = 2781, h = -90},
    },
    hospitalLocation = {
        {x = 213079, y = 155179, radius = 2000}
    }
}