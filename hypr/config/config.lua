hl.config{
	general = {
		border_size = 2,
		gaps_in = 10,
		gaps_out = 20,
		col = {
			inactive_border = 0xff1e2326,
			active_border = 0xffa7c080,
		}, },

	decoration = {
		rounding = 5,
		dim_inactive = true,
		dim_strength = 0.1,
		blur = {
			enabled = true,
			vibrancy = 0.2,
			passes = 2,
		},
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

