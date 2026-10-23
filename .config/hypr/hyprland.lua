require('config.monitors')
local splitWorkspaces = require('config.workspaces')
local apps = require('config.apps')

hl.on("hyprland.start", function ()
	hl.exec_cmd("dbus-update-activation-environment --systemd GTK_THEME XDG_DATA_DIRS")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme Matugen-Adwaita")
	hl.exec_cmd("bash ~/.config/hypr/scripts/apply-hyprland-borders.sh")
	hl.exec_cmd("qs & hyprpaper")
	hl.exec_cmd("hyprpm reload -n")
	hl.exec_cmd("swaync")
	hl.exec_cmd("easyeffects -w")
end)

hl.env("XCURSOR_SIZE", "36")
hl.env("GTK_THEME", "Adwaita")
hl.env("XDG_DATA_DIRS", "/home/emoralesg/.config/matugen/data:/home/emoralesg/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share")
hl.env("HYPRCURSOR_THEME", "Fuure-Cyan-Hypercursor_Theme")
hl.env("HYPRCURSOR_SIZE", "36")

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,

		border_size = 2,

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 0.95,
		inactive_opacity = 0.95,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},
	},

	animations = { enabled = true },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})


hl.config({
	input = {
		kb_layout = "us, latam",
		kb_variant ="",
		kb_model = "",
		kb_options = "grp:alt_shift_toggle",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0,
	}
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = 0
})


require('bindings.applications')(apps)
require('bindings.media')
require('bindings.navigation')
require('bindings.system')
require('bindings.workspaces')(splitWorkspaces)
require("windowrules")
