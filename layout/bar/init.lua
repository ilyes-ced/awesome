local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")
local color = require("themes.colors")
local clock = require("layout.bar.modules.clock")
local launcher = require("layout.bar.modules.launcher")
local button_group = require("layout.bar.modules.button_group")
local layoutbox = require("layout.bar.modules.layoutbox")
local taglist = require("layout.bar.modules.taglist")
local tasklist = require("layout.bar.modules.tasklist")

local sep = wibox.widget.textbox(" ")
sep.forced_width = dpi(50)
sep.forced_height = awful.screen.focused().workarea.height

local create_bar = function(s)
	-- Create a tasklist widget
	-- Create the wibox
	s.mywibox = awful.wibar({
		width = dpi(50),
		screen = s,
		position = "left",
		height = awful.screen.focused().workarea.height,
		bg = "#000000",
		widget = wibox.container.background,
		x = dpi(00),
		shape = util.rect(0),
	})

	-- Add widgets to the wibox
	s.mywibox:setup({
		{
			{
				{ launcher, clock, tasklist(s), layout = wibox.layout.fixed.vertical },
				nil,
				{ button_group, layoutbox, layout = wibox.layout.fixed.vertical },
				layout = wibox.layout.align.vertical,
			},
			{
				{
					taglist(s),
					layout = wibox.layout.fixed.vertical,
				},
				widget = wibox.container.place,
				content_fill_horizontal = true,
			},
			sep,
			layout = wibox.layout.stack,
		},
		widget = wibox.container.background,
		bg = color.bg_dark,
	})
end

return create_bar
