local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local color = require("themes.colors")
local theme = require("themes.theme")
local util = require("util")

local tasklist_buttons = require("bindings.mouse.tasklist")

local create_tasklist = function(s)
	-- Create a tasklist widget
	tasklist_container = wibox.container.background(wibox.container.margin(
		awful.widget.tasklist({
			screen = s,
			filter = awful.widget.tasklist.filter.currenttags,
			buttons = tasklist_buttons,
			spacing = dpi(20),
			layout = {
				layout = wibox.layout.fixed.vertical,
			},
			bg = "#f00",
			bg_normal = "#f00",
			bg_focus = "#f00",
		}),
		dpi(5),
		dpi(5),
		dpi(5),
		dpi(5),
		"#00000000"
	))

	tasklist_container.bg = theme.bg_normal
	tasklist_container.border_width = theme.border_width
	tasklist_container.border_color = theme.border_color
	tasklist_container.shape = util.rect(theme.rounded)

	local tasklist = util.margin(tasklist_container, 5, 5, 5, 5)
	return tasklist
end

return create_tasklist
