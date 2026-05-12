local envVars = {
    XCURSOR_SIZE = "24",
    HYPRCURSOR_SIZE = "24",
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
    "hyprpaper",
    "nm-applet",
    "keepassxc --minimized",
    {"thunderbird", 10},
    "discord --start-minimized",
    "steam -silent"
}

for _, var in ipairs(envVars) do
    hl.env(var, envVars[var])
end

hl.on("hyprland.start", function()
    for command in pairs(startupCommands) do
        if type(command) == "string" then
            hl.exec_cmd(command)
        else
            hl.exec_cmd(command[1], command[2])
        end
    end
end)
