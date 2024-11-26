local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local color = require("themes.colors")
local util = require("util")

local tasklist_buttons = require("bindings.mouse.tasklist")

local create_tasklist = function(s)
	-- Create a tasklist widget
	tasklist_container = wibox.container.background(awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
		layout = {
			layout = wibox.layout.fixed.vertical,
		},
	}))

	tasklist_container.shape = util.rect(dpi(5))
	tasklist_container.bg = "#ff00ff"
	tasklist_container.border_width = dpi(5)
	tasklist_container.border_color = "#ff0000"

	local tasklist = util.margin(tasklist_container, 5, 5, 5, 5)
	return tasklist
end

return create_tasklist
