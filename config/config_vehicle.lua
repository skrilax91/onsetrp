--+------------------------------------------+
--|               Car Dealer                 |
--+------------------------------------------+

-- set color groups for vehicle vendors
-- Syntax : 
-- groupName = {
--  colorname = "colorHex",
--  colorname = "colorHex"
--}
Config.VehiclesColor = {
    defaultColor = {
        black = "0000",
	    red = "FF0000",
	    blue = "0000FF",
	    green = "00FF00",
	    orange = "971900",
        vert_bambou = "001F09",
        marron = "391c00",
        bleu_galaxie = "010026",
        rouge_bordeau = "1f0000",
        rose = "ff15b5",
        jaune = "c9be00",
        turquoise = "00a47c",
        blanc = "ffffff",
        gris_clair = "787878",
        gris_fonce = "262626",
        gris_titanium = "0b0f14",
        violet_fonce = "140019"
    }
}

-- set vehicle groups for vehicle vendors
Config.VehicleGroups = {
    DefaultVehicles = {
        vehicle_25 = 2000,
        vehicle_1 = 6000,
        vehicle_19 = 6000,
        vehicle_5 = 9000,
        vehicle_4 = 12000,
        vehicle_7 = 30000,
        vehicle_11 = 40000,
        vehicle_12 = 50000,
        vehicle_22 = 45000,
        vehicle_23 = 45000,
        vehicle_17 = 60000,
        vehicle_18 = 60000,
        vehicle_6 = 70000,
    }
}

-- set all car Dealers
Config.CarDealers = {
    {
		vehicles = Config.VehicleGroups.DefaultVehicles, -- group of color used
		colors = Config.VehiclesColor.defaultColor, -- group of vehicle used
		location = { 162911, 191166, 1380, 180 }, -- location of car dealer
		spawn = { 162518, 189841, 1347, -90 } -- location of vehicle spawn
    },
    {
		vehicles = Config.VehicleGroups.DefaultVehicles, -- group of color used
		colors = Config.VehiclesColor.defaultColor, -- group of vehicle used
		location = { -188591, -50391, 1150, 180 }, -- location of car dealer
		spawn = { -188315, -51413, 1150, 180 } -- location of vehicle spawn
	},
    {
		vehicles = Config.VehicleGroups.DefaultVehicles, -- group of color used
		colors = Config.VehiclesColor.defaultColor, -- group of vehicle used
		location = { -24737, -18052, 2087, -150 }, -- location of car dealer
		spawn = { -25060, -18800, 2062, -150 } -- location of vehicle spawn
	}
}

-- set all garage on map
Config.GarageDealerTable = {
    {
		location = { 22083, 146617, 1560, -90 },
		spawn = { 22120, 145492 , 1560, -90 }
    },
    {
        location = { -184007, -50877, 1146, -90 },
        spawn = { -183649, -51499, 1146, -90 }
    },
    {
        location = { 202673, 198046, 1307, 90 },
        spawn = { 202786, 199085, 1307, 0 }
    },
    {
        location = { -25135, -17097, 2062, -150 },
        spawn = { -25576, -17300, 2062 , -150 }
    }
 }

Config.GarageStoreTable = {
    {
        modelid = 2,
        location = {
            { 23432, 145697, 1550 },
            { 20752, 168878, 1306 },
            { -184587, -51196, 1146 },
            { -185403, -51170, 1146 },
            { -185603, -51410, 1146 },
			{ 203269, 201098, 1307 },
			{ 203973, 201098, 1307 },
            { -25189, -16824, 2077 }
        },
        object = {}
    }
}

--+------------------------------------------+
--|               Vehicle Def                |
--+------------------------------------------+

Config.Vehicles = {
    vehicle_1 = {
        itemSpace = 205,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_2 = {
        itemSpace = 50,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_3 = {
        itemSpace = 80,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_4 = {
        itemSpace = 215,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_5 = {
        itemSpace = 205,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_6 = {
        itemSpace = 90,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_7 = {
        itemSpace = 315,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_8 = {
        itemSpace = 50,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_9 = {
        itemSpace = 10,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_10 = {
        itemSpace = 10,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_11 = {
        itemSpace = 140,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_12 = {
        itemSpace = 100,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_13 = {
        itemSpace = 100,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_14 = {
        itemSpace = 100,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_15 = {
        itemSpace = 100,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_16 = {
        itemSpace = 100,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_17 = {
        itemSpace = 540,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_18 = {
        itemSpace = 540,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_19 = {
        itemSpace = 205,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_20 = {
        itemSpace = 10,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_21 = {
        itemSpace = 100,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_22 = {
        itemSpace = 475,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_23 = {
        itemSpace = 475,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_24 = {
        itemSpace = 10,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    },

    vehicle_25 = {
        itemSpace = 160,
        price = 144572,
        fuel = "fuel_1",
        fuelCapacity = 100
    }
}

