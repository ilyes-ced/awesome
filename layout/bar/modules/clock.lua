local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local color = require("themes.colors")
local theme = require("themes.theme")
local util = require("util")

local textclock_container = wibox.container.background(wibox.widget({
	{
		widget = wibox.widget.textclock,
		format = '<span color="' .. theme.fg_normal .. '" font="' .. theme.font .. ' Bold 16">%H\n%M</span>',
		refresh = 20,
		valign = "center",
		halign = "center",
	},
	widget = wibox.container.place,
}))

textclock_container.bg = theme.bg_normal
textclock_container.border_width = theme.bar_border_width
textclock_container.border_color = theme.bar_border_color
textclock_container.shape = util.rect(theme.rounded)

local clock = util.margin(textclock_container, 5, 5, 5, 5)
clock.forced_width = dpi(50)

return clock
