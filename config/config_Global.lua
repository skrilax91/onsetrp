-- Var define DON'T TOUCH
Config = {}
Config.db = {}
Config.gasStation = {}
Config.delivery = {}
Config.Gather = {}
Config.clothing = {}
local _ = function(k,...) return ImportPackage("i18n").t(GetPackageName(),k,...) end
--------------------------

--+------------------------------------------+
--|                  Global                  |
--+------------------------------------------+

-- set your server Name
Config.serverName = "OnsetRp Server"
-- set server language
Config.lang = "en"
-- set player spawn location (after server registration)
Config.playerSpawnLocation = { x = 204094, y = 180846, z = 1500 }
-- set all possible spawn when user join the server
Config.spawnLocation = {
    -- The three last value are temporary until RandomFloat is fixed
    town = { 170402, 38013, 1180, "-", "-", "" },
    city = { 211526, 176056, 1450, "", "", "" },
    desert_town = { 16223, 8033, 2080, "-", "-", "" },
    old_town = { 39350, 138061, 1690, "", "", "" }
}

--+------------------------------------------+
--|                Database                  |
--+------------------------------------------+

-- hostname of database
Config.db.SQL_HOST = "127.0.0.1"
-- port of database
Config.db.SQL_PORT = 3306
-- user used for loggin to (DO NOT USE ROOT USER !)
Config.db.SQL_USER = "root"
-- user password
Config.db.SQL_PASS = ""
-- database name
Config.db.SQL_DB = "roleplay"
-- charset used (if you don't know how use it don't touch)
Config.db.SQL_CHAR = "utf8mb4"
-- sql logs
Config.db.SQL_LOGL = "error"


--+------------------------------------------+
--|                  Salary                  |
--+------------------------------------------+

-- number of minutes between each salary
Config.salaryTime = 20
-- Default salary (when hace no jobs)
Config.defaultSalary = 50
-- Salary when are Police
Config.PoliceSalary = 200
-- Salary when are Medic
Config.MedicSalary = 500

--+------------------------------------------+
--|              Day/Night Cycle             |
--+------------------------------------------+

-- set time when the server start
Config.worldTime = 12
-- set speed of day
Config.dayTime = 0.01
-- set speed of night
Config.nightTime = 0.05
-- set time the sun rises
Config.morning = 5
-- set time the sun sets
Config.evening = 20

--+------------------------------------------+
--|                 Whitelist                |
--+------------------------------------------+

-- Activate/Desactivate whitelist system
Config.whitelist = true


--+------------------------------------------+
--|            Inventory System              |
--+------------------------------------------+

Config.inventoryBaseMaxSlots = 50
Config.backpackSlotToAdd = 35
Config.repairKitHealth = 2500
Config.repairKitTime = 15

--+------------------------------------------+
--|             Damage system                |
--+------------------------------------------+

Config.bleedingChance = 40
Config.InitialDamageToBleed = 1.5
Config.DamagePerTick = 1
Config.BlledingDamageInterval = 5000
Config.BleedEffectAmount = 70
Config.tazerLockDuration = 10000
Config.TazerEffectDuration = 20000

--+------------------------------------------+
--|                 Radios                   |
--+------------------------------------------+

-- Base volume for radio
Config.radioBaseVolume = 0.2
-- set all radios available on the server
Config.radioList = {
    {label = "NCS #1", url = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://51.15.152.81:8947/listen.pls?sid=1&t=.pls"},
    {label = "NCS #2", url = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://91.121.113.129:9115/listen.pls?sid=1&t=.pls"},
    {label = "Metal", url = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://5.135.154.69:11590/listen.pls?sid=1&t=.pls"},
    {label = "Reggae", url = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://us5.internet-radio.com:8487/listen.pls&t=.pls"},
    {label = "Dance", url = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://pulseedm.cdnstream1.com:8124/1373_128.m3u&t=.pls"},
    {label = "Jazz", url = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://199.180.72.2:8015/listen.pls?sid=1&t=.pls"},
    {label = "Rap", url = "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://192.211.51.158:8010/listen.pls?sid=1&t=.pls"},
}

--+------------------------------------------+
--|               Bus System                 |
--+------------------------------------------+

-- set price of a ticket
Config.ticketPrice = 5
-- set amount the ticket price will be in order of kilometers
Config.kilometerPrice = 2

-- set all bus stop 
Config.busStop = {
    { x= 43977, y= 134767, z= 1567, labelArret= _("old_town") }, --Vieille ville
    { x= -23335, y= -12534, z= 2081, labelArret= _("desert_town") }, --Ville du desert
    { x= -162541, y= 79023, z= 1545, labelArret= _("prison") }, --Ville du desert
    { x= -181984, y= -44583, z= 1149, labelArret= _("town") }, --Village        
    { x= -165259, y= -37945, z= 1149, labelArret= _("town").." 2" }, --Village        
    { x= 178654, y= 210121, z= 1314, labelArret= _("city").." 1" }, -- Ville
    { x= 210387, y= 194379, z= 1310, labelArret= _("city").." 2" }, -- Ville
    { x= 194706, y= 211555, z= 1310, labelArret= _("city").." 3" }, -- Ville
    { x= 196929, y= 200157, z= 1309, labelArret= _("city").." 4" }, -- Ville
    { x= 179352, y= 195067, z= 1310, labelArret= _("city").." 5" }, -- Ville
    { x= 182731, y= 198008, z= 1310, labelArret= _("city").." 6" }, -- Ville        
    { x= 157242, y= 210114, z= 1310, labelArret= _("city").." 7" }, -- Ville
    { x= 204877, y= 187104, z= 1312, labelArret= _("city").." 8" }, -- Ville
}

-- add bus stop props if not on the map
Config.addProp = {
    { x= 44159, y= 134743, z= 1467, ry= -3 }, --Vieille ville
    { x= -162727, y= 79044, z= 1434, ry= 183 }, --Prison
}

--+------------------------------------------+
--|                  Phone                   |
--+------------------------------------------+

-- can use phone without phone item
Config.useWithoutPhone = false
-- Name of phone item
Config.phoneItemName = "phone"
-- can use phon while gathering
Config.usewhilegathering = false

--+------------------------------------------+
--|              Fuel System                 |
--+------------------------------------------+

Config.gasStation.jericanCapacity = 50
Config.gasStation.jericanTime = 15

Config.gasStation.location = {
    { 127810,   78431,  1568 },
    { 127446,   78415,  1568 },
    { 127048,   78430,  1568 },
    { 126678,   78404,  1568 },
    { 126246,   78420,  1568 },
    { 125904,   78406,  1568 },
    { -17171,   -2172,  2062 },
    { -16814,   -3187,  2062 },
    { -17155,   -3305,  2062 },
    { -17526,   -2315,  2062 },
    { -17804,   -2415,  2062 },
    { -17447,   -3387,  2062 },
    { -17753,   -3526,  2062 },
    { -18106,   -2502,  2062 },
    { -167866,  -37112, 1146 },
    { -168188,  -37103, 1146 },
    { -168693,  -37095, 1146 },
    { -169015,  -37088, 1146 },
    { 170659,   207324, 1411 },
    { 170105,   207314, 1410 },
    { 170630,   206760, 1411 },
    { 170107,   206783, 1410 },
    { 170099,   206107, 1410 },
    { 170647,   206097, 1411 },
    { 170623,   205561, 1411 },
    { 170100,   205587, 1411 },
    { 42526,    137156, 1569 },
    { 42966,    137150, 1569 },
    { 42524,    136717, 1569 },
    { 42949,    136744, 1569 }
}

Config.gasStation.Fuel = {
    gasoil = {
        price = "1"
    },
    gasoilplus = {
        price = "2"
    }
}

--+------------------------------------------+
--|            Delivery System               |
--+------------------------------------------+

Config.delivery.locationPrice = 2000

Config.delivery.locationRefoundPercentage = 0.8

Config.delivery.priceDivider = 250

Config.delivery.pricePerDivide = 15

Config.delivery.NPC = {
    {
        location = {-16925, -29058, 2200, -90},
        spawn = {-17450, -28600, 2060, -90}
    },
    {
        location = {-168301, -41499, 1192, 90},
        spawn = {-168233, -40914, 1146, 90}
    },
    {
        location = {146585, 211065, 1307, -90},
        spawn = {145692, 210574, 1307, 0}
    }
}

Config.delivery.point = {
    {116691, 164243, 3028},
    {38964, 204516, 550},
    {182789, 186140, 1203},
    {211526, 176056, 1209},
    {42323, 137508, 1569},
    {122776, 207169, 1282},
    {209829, 92977, 1312},
    {176840, 10049, 10370},
    {198130, -49703, 1109},
    {130042, 78285, 1566},
    {203711, 190025, 1312},
    {170311, -161302, 1242},
    {152267, -143379, 1242},
    {-181677, -31627, 1148},
    {-179804, -66772, 1147},
    {182881, 148416, 5933}
}