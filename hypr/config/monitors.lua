-- Lenovo ThinkVision P24QD-40
hl.monitor({
    output = "DP-4",
    mode = "2560x1440@120",
    position = "-1600x0",
    scale = 1.6,
})

-- Lenovo ThinkPad P1 Gen 8 Internal Display
hl.monitor({
    output = "eDP-1",
    mode = "3200x2000@120",
    position = "0x0",
    scale = 2
})

-- Fix XWayland scaling but
hl.config({ xwayland = { force_zero_scaling = true }})

-- Is the external monitor currently connected?
local function external_connected()
    for _, m in ipairs(hl.get_monitors()) do
        if m.name == "DP-4" then return true end
    end
    return false
end

-- Pin workspace 1 to whichever monitor should host it right now
local function set_default_workspace()
    if external_connected() then
        hl.workspace_rule({ workspace = "1", monitor = "DP-4", default = true })
    else
        hl.workspace_rule({ workspace = "1", monitor = "eDP-1", default = true })
    end
end

set_default_workspace()                          -- run once at startup
hl.on("monitor.added", set_default_workspace)     -- and whenever DP-4 appears
hl.on("monitor.removed", set_default_workspace)   -- or disappears

-- Lid closed
hl.bind("switch:on:Lid Switch", function()
    if external_connected() then
        hl.monitor({ output = "eDP-1", disabled = true })
    else
	hl.exec_cmd("systemctl suspend")
    end
end, { locked = true })

-- Lid opened
hl.bind("switch:off:Lid Switch", function()
    hl.exec_cmd("hyprctl dispatch dpms on")
    hl.monitor({
        output = "eDP-1",
        mode = "3200x2000@120",
        position = "0x0",
        scale = 2,
        disabled = false
    })
end, { locked = true })

