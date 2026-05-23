local env_vars = {
    XCURSOR_SIZE = "24",
    HYPRCURSOR_SIZE = "24",

    -- Remove these if something breaks
    GDK_BACKEND = "wayland,x11",
    QT_QPA_PLATFORM = "wayland",

    QT_QPA_PLATFORMTHEME = "qt6ct",
}

---@class StartupCommands
---@field [integer] string | {[1]: string, [2]: integer} 

---@type StartupCommands
local startup_commands = {
    "systemctl --user start waybar",
    "systemctl --user start mako",
    "systemctl --user start hyprpolkitagent",
    "systemctl --user start hyprsunset",
    "systemctl --user start hyprpaper",
    "systemctl --user import-environment SSH_AUTH_SOCK", -- For running ssh-add -D in systemd
    "systemctl --user start hypridle",
    "nm-applet",
    "vorta", -- For home directory backups
    -- "keepassxc --minimized", -- Maybe move this to systemd
    {"tutanota-desktop", 10},
    {"betterbird", 10}, -- Test this works and is silent
    "discord --start-minimized",
    "playerctld daemon" -- Allows playerctl to prioritize most recently played players
}

for var, value in pairs(env_vars) do
    hl.env(var, value)
end

hl.on("hyprland.start", function()
    for _, command in ipairs(startup_commands) do
        if type(command) == "string" then
            hl.exec_cmd(command)
        else
            hl.exec_cmd(command[1], {workspace = command[2] .. " silent"})
        end
    end
end)
