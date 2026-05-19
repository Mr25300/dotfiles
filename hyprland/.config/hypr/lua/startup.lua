local envVars = {
    XCURSOR_SIZE = "24",
    HYPRCURSOR_SIZE = "24",

    -- Remove these if something breaks
    GDK_BACKEND = "wayland,x11",
    QT_QPA_PLAFORM = "wayland",

    QT_QPA_PLATFORMTHEME = "qt6ct"
}

---@class StartupCommands
---@field [integer] string | {[1]: string, [2]: integer} 

---@type StartupCommands
local startupCommands = {
    "waybar",
    "mako",
    "systemctl --user start hyprpolkitagent",
    "hyprsunset",
    "systemctl --user start hyprpaper",
    "nm-applet",
    "vorta", -- For home directory backups
    -- "keepassxc --minimized", -- Maybe move this to systemd
    {"tutanota-desktop", 10},
    {"betterbird", 10}, -- Test this works and is silent
    "discord --start-minimized",
}

for var, value in pairs(envVars) do
    hl.env(var, value)
end

hl.on("hyprland.start", function()
    for _, command in ipairs(startupCommands) do
        if type(command) == "string" then
            hl.exec_cmd(command)
        else
            hl.exec_cmd(command[1], {workspace = command[2] .. " silent"})
        end
    end
end)
