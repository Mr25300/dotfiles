local monitors = require("lua.meta.monitors")

for name, info in pairs(monitors) do
    hl.monitor({
        output = name,
        mode = info.res,
        position = info.pos,
        transform = info.transform
    })

    for _, num in ipairs(info.workspaces) do
        hl.workspace_rule({workspace = tostring(num), monitor = name})
    end
end

hl.config({
    dwindle = {
        preserve_split = true
    },
    master = {
        new_status = "master"
    },
    scrolling = {
        fullscreen_on_one_column = true
    }
})

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
