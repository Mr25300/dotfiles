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
    -- "keepassxc --minimized", -- Maybe move this to systemd
    {"thunderbird", 10}, -- Make this silent so that it doesnt switch workspaces
    "discord --start-minimized",
    "steam -silent"
}

for _, var in ipairs(envVars) do
    hl.env(var, envVars[var])
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
