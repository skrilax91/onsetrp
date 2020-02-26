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
	    orange = "FF6600"
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

--+------------------------------------------+
--|               Vehicle Def                |
--+------------------------------------------+

Config.Vehicles = {
    vehicle_1 = {
        itemSpace = 205,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_2 = {
        itemSpace = 50,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_3 = {
        itemSpace = 80,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_4 = {
        itemSpace = 215,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_5 = {
        itemSpace = 205,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_6 = {
        itemSpace = 90,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_7 = {
        itemSpace = 315,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_8 = {
        itemSpace = 50,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_9 = {
        itemSpace = 10,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_10 = {
        itemSpace = 10,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_11 = {
        itemSpace = 140,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_12 = {
        itemSpace = 100,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_13 = {
        itemSpace = 100,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_14 = {
        itemSpace = 100,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_15 = {
        itemSpace = 100,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_16 = {
        itemSpace = 100,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_17 = {
        itemSpace = 540,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_18 = {
        itemSpace = 540,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_19 = {
        itemSpace = 205,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_20 = {
        itemSpace = 10,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_21 = {
        itemSpace = 100,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_22 = {
        itemSpace = 475,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_23 = {
        itemSpace = 475,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_24 = {
        itemSpace = 10,
        price = 144572,
        fuel = "fuel_1"
    },

    vehicle_25 = {
        itemSpace = 160,
        price = 144572,
        fuel = "fuel_1"
    }
}

