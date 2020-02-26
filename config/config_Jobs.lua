--+------------------------------------------+
--|                  Global                  |
--+------------------------------------------+



--+------------------------------------------+
--|                  Police                  |
--+------------------------------------------+

-- how many policemens at the same time
Config.MaxPolice = 30
-- Allow the respawn of the vehicle by destroying the previously spawned one. (Can break RP if the car is stolen or need repairs or fuel)
Config.AllowVehicleRespawn = false

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