local mod = "SUPER"

-- General
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + E", hl.dsp.exec_cmd(file_manager))
hl.bind(mod .. " + D", hl.dsp.exec_cmd(launcher))
hl.bind(mod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(editor))

-- System Power Controls
hl.bind(mod .. " + CTRL + S", hl.dsp.exec_cmd("systemctl poweroff"))                -- Shutdown
hl.bind(mod .. " + CTRL + R", hl.dsp.exec_cmd("systemctl reboot"))                  -- Reboot
hl.bind(mod .. " + CTRL + Z", hl.dsp.exec_cmd("systemctl suspend"))                 -- Sleep (zzz)
hl.bind(mod .. " + CTRL + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")) -- logout
hl.bind(mod .. " + CTRL + L", hl.dsp.exec_cmd("hyprlock"))                          -- Lock

-- Window management + Vim bindings
-- Move focus
hl.bind(mod .. " + H", hl.dsp.focus({direction = "left"}))
hl.bind(mod .. " + L", hl.dsp.focus({direction = "right"}))
hl.bind(mod .. " + K", hl.dsp.focus({direction = "up"}))
hl.bind(mod .. " + J", hl.dsp.focus({direction = "down"}))

-- Resize active window in direction
hl.bind(mod .. " + ALT + H", hl.dsp.window.resize({x = -30, y = 0, relative = true}), {repeating = true})
hl.bind(mod .. " + ALT + L", hl.dsp.window.resize({x = 30, y = 0, relative = true}), {repeating = true})
hl.bind(mod .. " + ALT + K", hl.dsp.window.resize({x = 0, y = -30, relative = true}), {repeating = true})
hl.bind(mod .. " + ALT + J", hl.dsp.window.resize({x = 0, y = 30, relative = true}), {repeating = true})

-- Move active window in direction
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({direction = "left"}))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({direction = "right"}))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({direction = "up"}))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({direction = "down"}))

-- Enter screenshot submap on SUPER+SHIFT+S
hl.bind(mod .. " + SHIFT + S", hl.dsp.submap("screenshot"))
hl.define_submap("screenshot", function()
    hl.bind("R", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
    hl.bind("R", hl.dsp.submap("reset"))
    hl.bind("W", hl.dsp.exec_cmd("hyprshot -m window --clipboard-only"))
    hl.bind("W", hl.dsp.submap("reset"))
    hl.bind("A", hl.dsp.exec_cmd("grim - | wl-copy"))
    hl.bind("A", hl.dsp.submap("reset"))
    hl.bind("ESCAPE", hl.dsp.submap("reset"))
end)

-- Switch workspaces with mod + [0-9]
-- Move active window to a workspace with mod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mod .. " + " .. key, hl.dsp.focus({workspace = i}))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({workspace = i}))
end

-- Switch to adjacent workspaces
hl.bind(mod .. " + bracketleft", hl.dsp.focus({workspace = "r-1"}))
hl.bind(mod .. " + bracketright", hl.dsp.focus({workspace = "r+1"}))

-- Cycle only through non-empty workspaces
hl.bind(mod .. " + Tab", hl.dsp.focus({workspace = "e+1"}))
hl.bind(mod .. " + SHIFT + Tab", hl.dsp.focus({workspace = "e-1"}))

-- Move active to adjacent workspaces
hl.bind(mod .. " + SHIFT + bracketleft", hl.dsp.window.move({workspace = "r-1"}))
hl.bind(mod .. " + SHIFT + bracketright", hl.dsp.window.move({workspace = "r+1"}))

-- Multimedia
-- Laptop keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), {locked = true, repeating = true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {locked = true, repeating = true})
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {locked = true, repeating = true})
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), {locked = true, repeating = true})
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), {locked = true, repeating = true})
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), {locked = true, repeating = true})

-- External keyboard (vim-style HJKL pad: H/L = seek track, J/K = volume, V = mute)
hl.bind("ALT + X", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = true })
hl.bind("ALT + H", hl.dsp.exec_cmd("playerctl previous"), { locked = true, repeating = true })
hl.bind("ALT + L", hl.dsp.exec_cmd("playerctl next"), { locked = true, repeating = true })
hl.bind("ALT + K", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("ALT + J", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("ALT + V", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })

-- OLED-friendly mode
local border_enabled = true

hl.bind(mod .. " + G", function()
	-- 1. Toggle Waybar
	hl.dispatch(hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))

	-- 2. Toggle borders using hyprctl eval
	border_enabled = not border_enabled
	if border_enabled then
		hl.dispatch(hl.dsp.exec_cmd([[hyprctl eval 'hl.config({ general = { border_size = 2 } })']]))
	else
		hl.dispatch(hl.dsp.exec_cmd([[hyprctl eval 'hl.config({ general = { border_size = 0 } })']]))
	end
end)
