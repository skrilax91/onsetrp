Config.Gather = {
    {-- LUMBERJACK STUFF
        gather_zone = {
            {x = -215796, y = -74619, z = 291}
        }, -- Zone of initial gathering
        gather_item = "tree_log", -- item that is given by initial gathering
        gather_time = 15, -- Time in seconds to gather one item,
        process_steps = {-- Describe the steps of processing
            {
                step_zone = {x = -70149, y = -59260, z = 1466}, -- zone of processing
                step_require = "tree_log", -- item that is required (take the one from previous step)
                step_require_number = 1, -- number of item required
                step_require_tool = "lumberjack_saw",
                step_processed_item = "wood_plank", -- item that will be given
                step_processed_item_number = 2, -- number of item that will be given
                step_process_time = 30, -- Time in seconds to process one item
                step_animation = "COMBINE", -- Animation for processing
                step_animation_attachement = nil
            }
        },
        require_job = false, -- Job required,
        require_tool = "lumberjack_axe", -- Tool required in inventory,
        require_knowledge = false, -- Require knowledge (for processing illegal stuff → drugdealer, cocaine)
        gather_animation = "PICKAXE_SWING", -- Animation that the player will act when doing stuff
        gather_animation_attachement = {modelid = 1047, bone = "hand_r"},
        gather_rp_props = nil,
        sell_zone = {
            {x = 203566, y = 171875, z = 1306, h = -90, item_to_sell = "wood_plank", price_per_unit = 36, sell_time = 5}
        }
    },



    {-- PEACH HARVESTION (FOR ALTIS LIFE FANS)
        gather_zone = {
            {x = -174432, y = 10837, z = 1831},
            {x = 189595, y = 147717, z = 5875},
        },
        gather_item = "peach",
        gather_animation = "PICKUP_UPPER",
        gather_time = 4,
        gather_rp_props = {
            -- Peach trees
            {model = 145, x = -174006, y = 10457, z = 1773, rx = 0, ry = 10, rz = 0},
            {model = 145, x = -173829, y = 10894, z = 1743, rx = 0, ry = 30, rz = 0},
            {model = 145, x = -173980, y = 11396, z = 1698, rx = 0, ry = 45, rz = 0},
            {model = 145, x = -174691, y = 11532, z = 1709, rx = 0, ry = 0, rz = 0},
            {model = 145, x = -175204, y = 11094, z = 1755, rx = 0, ry = 145, rz = 0},
            {model = 145, x = -175449, y = 11528, z = 1757, rx = 0, ry = 80, rz = 0},
            {model = 145, x = -175171, y = 12038, z = 1719, rx = 0, ry = 50, rz = 0},
            {model = 145, x = -174581, y = 12021, z = 1686, rx = 0, ry = 40, rz = 0},
        },
        sell_zone = {
            { x = -167521, y = -39359, z = 1146, h = 180, item_to_sell = "peach", price_per_unit = 2, sell_time = 2 }
        }
    },

    {-- COCAINE
        gather_zone = {
            {x = 101448, y = -137535, z = 2178}
        },
        gather_item = "coca_leaf",
        gather_time = 7,
        process_steps = {
            {
                step_zone = {x = 74387, y = -92653, z = 2293},
                step_require = "coca_leaf",
                step_require_number = 3,
                step_processed_item = "cocaine",
                step_processed_item_number = 1,
                step_process_time = 15,
            }
        },
        require_knowledge = true,
    },

    { -- FISHING
        gather_zone = {
            {x = 232464, y = 193521, z = 112},
            {x = -220130, y = 23036, z = 107},
        },
        gather_item = "herring",
        require_tool = "fishing_rod",
        gather_animation = "FISHING",
        gather_time = 6,
        gather_animation_attachement = {modelid = 1111, bone = "hand_r"},
        sell_zone = {
            {x = -21295, y = -22954, z = 2080, h = -90, item_to_sell = "herring", price_per_unit = 5, sell_time = 5}
        }
    },

    { -- MINING
        gather_zone = {
            {x = -101174, y = 98223, z = 180}
        },
        gather_item = "iron_ore",
        require_tool = "pickaxe",
        gather_animation = "PICKAXE_SWING",
        gather_time = 18,
        gather_animation_attachement = {modelid = 1063, bone = "hand_r"},
        process_steps = {
            {
                step_zone = {x = -82629, y = 90991, z = 481},
                step_require = "iron_ore",
                step_require_number = 1,
                step_processed_item = "iron_ingot",
                step_processed_item_number = 2,
                step_process_time = 18,
            },
            {
                step_zone = {x = -191437, y = -31107, z = 1148},
                step_require = "iron_ingot",
                step_require_number = 2,
                step_processed_item = "iron_pipe",
                step_processed_item_number = 1,
                step_process_time = 30,
            }
        },
        sell_zone = {
            {x = 67862, y = 184741, z = 535, h = 90, item_to_sell = "iron_pipe", price_per_unit = 54, sell_time = 5}
        }
    }
}