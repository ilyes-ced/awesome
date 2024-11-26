local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local bling = require("bling")

local args = {
	apps_per_column = 5,
	apps_per_row = 3,
	sort_alphabetically = false,
	reverse_sort_alphabetically = true,
	icon_size = 24,
	favorites = { "vscodium", "floorp", "brave" },
	app_height = dpi(200),
	expand_apps = true,
}
local app_launcher = bling.widget.app_launcher(args)

return app_launcher
