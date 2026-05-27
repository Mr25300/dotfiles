local state = require("lua.meta.state")

local profiles = {
    sanctum = {
        ["HDMI-A-1"] = { -- Left
            res = "1920x1080@60",
            pos = "0x0",
            -- scale = 1920 / 2560,
            transform = 1,
            workspaces = {5, 6, 7}
        },
        ["DP-2"] = { -- Center
            res = "2560x1440@165",
            pos = "1080x287",
            scale = 1.07,
            workspaces = {1, 2, 3, 4}
        },
        ["DP-1"] = { -- Right
            res = "1920x1080@60",
            pos = "3480x0",
            -- scale = 1920 / 2560,
            transform = 1,
            workspaces = {8, 9, 10}
        }
    },

    bastion = {
        ["eDP-1"] = {
            res = "1920x1080@60",
            pos = "0x0"
        }
    },

    default = {
        [","] = {}
    }
}

return profiles[state.device]
