local beautiful = require("beautiful")
local naughty = require("naughty")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local bling = require("bling")
local rubato = require("rubato")

timed = rubato.timed({
	duration = 1 / 2, --half a second
	intro = 1 / 6, --one third of duration
	override_dt = true, --better accuracy for testing
	subscribed = function(pos)
		print(pos)
		naughty.notify({
			text = tostring(pos),
			title = warning_msg_title,
			timeout = 25, -- show the warning for a longer time
			hover_timeout = 0.5,
			position = warning_msg_position,
			bg = "#000",
			fg = "#EEE9EF",
			width = 300,
		})
	end,
})
timed.target = 450

local args = {
	apps_per_column = 5,
	apps_per_row = 3,
	sort_alphabetically = false,
	reverse_sort_alphabetically = true,
	icon_size = 24,
	favorites = { "vscodium", "floorp", "brave" },
	app_height = dpi(200),
	expand_apps = true,

	rubato = { x = timed, y = timed },
}
local app_launcher = bling.widget.app_launcher(args)

return app_launcher
