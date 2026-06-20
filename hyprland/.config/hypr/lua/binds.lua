local apps = require("lua.meta.apps")

local mainMod = "SUPER"

-- TODO: Handle the different types of binds better

local special_binds = {
    X = apps.terminal,
    C = hl.dsp.window.close(),
    R = apps.menu,
    B = "hyprpicker | wl-copy",
    -- M = hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
    P = hl.dsp.window.pseudo({action = "toggle"}),
    V = hl.dsp.window.float({action = "toggle"}),
    F = hl.dsp.window.fullscreen({action = "toggle"}),
    A = hl.dsp.layout("splitratio -0.05"),
    D = hl.dsp.layout("splitratio 0.05"),
    H = hl.dsp.focus({direction = "l"}), -- Try switching left, right, up, down to l, r, u, d
    L = hl.dsp.focus({direction = "r"}),
    K = hl.dsp.focus({direction = "u"}),
    J = hl.dsp.focus({direction = "d"}),
    ["SHIFT + H"] = hl.dsp.window.move({direction = "l"}), -- Try switching left, right, up, down to l, r, u, d
    ["SHIFT + L"] = hl.dsp.window.move({direction = "r"}),
    ["SHIFT + K"] = hl.dsp.window.move({direction = "u"}),
    ["SHIFT + J"] = hl.dsp.window.move({direction = "d"}),
    G = hl.dsp.group.toggle(),
    TAB = hl.dsp.group.next(),
    ["SHIFT + TAB"] = hl.dsp.group.prev(),
    S = hl.dsp.workspace.toggle_special("magic"),
    ["SHIFT + S"] = hl.dsp.window.move({workspace = "special:magic"}),
    mouse_down = hl.dsp.focus({workspace = "e+1"}),
    mouse_up = hl.dsp.focus({workspace = "e-1"})
}

-- Can run while screen is locked
local locked_special_binds = {
    M = "pgrep hyprlock && systemctl suspend || loginctl lock-session",
}

local mouse_binds = {
    ["mouse:272"] = hl.dsp.window.drag(),
    ["mouse:273"] = hl.dsp.window.resize()
}

-- Can find these binds by running "sudo evtest"
-- https://github.com/xkbcommon/libxkbcommon/blob/master/include/xkbcommon/xkbcommon-keysyms.h
local binds = {
    XF86AudioRaiseVolume = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+",
    XF86AudioLowerVolume = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
    XF86AudioMute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
    XF86AudioMicMute = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
    XF86MonBrightnessUp = "brightnessctl -e4 -n2 set 5%+",
    XF86MonBrightnessDown = "brightnessctl -e4 -n2 set 5%-",
    XF86Explorer = apps.fileManager,
    XF86HomePage = apps.webBrowser,
    XF86Mail = apps.mailClient,
    XF86Calculator = apps.calculator,
    XF86Tools = apps.mediaPlayer,
    XF86AudioStop = "playerctl stop",
    XF86AudioPrev = "playerctl previous",
    XF86AudioPlay = "playerctl play-pause",
    -- XF86AudioPause = "playerctl play-pause", -- No such key on my keyboard
    XF86AudioNext = "playerctl next",
    Print = "zsh -c 'screenshot selection'",
    ["CTRL + Print"] = "zsh -c 'screenshot window'",
    ["SHIFT + CTRL + Print"] = "zsh -c 'screenshot window manual'",
    ["ALT + Print"] = "zsh -c 'screenshot monitor'",
    ["SHIFT + ALT + Print"] = "zsh -c 'screenshot monitor manual'",
    ["SUPER + Print"] = "zsh -c 'screen-record selection' > /tmp/record.log 2>&1",
    ["SUPER + ALT + Print"] = "zsh -c 'screen-record monitor'",
    -- Print = {
    --     "sh -c 'GEOM=$(slurp -d) || exit 0; grim -g \"$GEOM\" - | tee ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png | wl-copy'",
    --     "notify-send 'Screenshot Saved and Copied to Clipboard'"
    -- },
    -- ["ALT + Print"] = {
    --     "sh -c 'grim - | tee ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png | wl-copy'",
    --     "notify-send 'Screenshot Saved and Copied to Clipboard'"
    -- }
}

local function getDispatcher(command)
    if type(command) == "string" then
        return hl.dsp.exec_cmd(command)
    elseif type(command) == "table" then
        return hl.dsp.exec_cmd(table.concat(command, " && "))
    else
        return command
    end
end

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        }
    }
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

for key, bind in pairs(special_binds) do
    hl.bind(mainMod .. " + " .. key, getDispatcher(bind))
end

for key, bind in pairs(locked_special_binds) do
    hl.bind(mainMod .. " + " .. key, getDispatcher(bind), {locked = true})
end

for key, bind in pairs(mouse_binds) do
    hl.bind(mainMod .. " + " .. key, getDispatcher(bind), {mouse = true})
end

for key, bind in pairs(binds) do
    hl.bind(key, getDispatcher(bind))
end

for i = 1, 10 do
    local key = i % 10

    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({workspace = i}))
end
