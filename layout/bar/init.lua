local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")
local color = require("themes.colors")
local theme = require("themes.theme")

local clock = require("layout.bar.modules.clock")
local launcher = require("layout.bar.modules.launcher")
local button_group = require("layout.bar.modules.button_group")
local layoutbox = require("layout.bar.modules.layoutbox")
local taglist = require("layout.bar.modules.taglist")
local tasklist = require("layout.bar.modules.tasklist")

local sep = wibox.widget.textbox(" ")
sep.forced_width = dpi(50)
sep.forced_height = awful.screen.focused().workarea.height

local decide_rounded = function()
	if theme.spacing == dpi(0) then
		return dpi(0)
	else
		return theme.rounded
	end
end

local create_bar = function(s)
	-- Create a tasklist widget
	-- Create the wibox
	s.mywibox = awful.wibar({
		width = dpi(50 + theme.spacing * 2),
		screen = s,
		position = "left",
		height = awful.screen.focused().workarea.height,
		bg = "#00000000",
		widget = wibox.container.background,
		x = dpi(00),
		shape = util.rect(0),
	})

	-- Add widgets to the wibox

	s.mywibox:setup({
		{
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
			bg = theme.bar_bg,
			border_width = theme.border_width,
			border_color = theme.border_color,
			shape = util.rect(decide_rounded()),
		},
		widget = wibox.container.margin,
		top = theme.spacing * 2,
		bottom = theme.spacing * 2,
		left = theme.spacing * 2,
	})
end

return create_bar
