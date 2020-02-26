
Config = {}

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
