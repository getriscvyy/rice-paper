hl.config{
	general = {
		border_size = 1,
		gaps_in = 5,
		gaps_out = 10,
		col = {
			active_border = 0xefa7c080,
			inactive_border = 0xafa7c080,
		}, },

	decoration = {
		rounding = 8,
		dim_inactive = true,
		dim_strength = 0.1,
		blur = {
			vibrancy = 0.5,
			passes = 2,
			enabled = true,
		}
	},

	input = {
		sensitivity = 0.25,

		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.25,
			tap_to_click = false,
		},
	},
}

hl.layer_rule({
	match = { namespace = "wofi" },
	blur = true,
	ignore_alpha = 0.5,
})

hl.layer_rule({
	match = { namespace = "waybar" },
	blur = true,
	ignore_alpha = 0.5,
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace"
})

hl.curve(
	"curvy",
	{
		type = "spring",
		mass = 1,
		stiffness = 2000,
		dampening = 100
})

hl.animation({
	leaf = "global",
	enabled = true,
	spring = "curvy",
	speed = 1,
})

