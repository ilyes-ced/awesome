--Standard MOdules
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")
--Colors
local color = require("themes.colors")

local mylayoutbox = awful.widget.layoutbox()
mylayoutbox:buttons(gears.table.join(
	awful.button({}, 1, function()
		awful.layout.inc(1)
	end),
	awful.button({}, 3, function()
		awful.layout.inc(-1)
	end),
	awful.button({}, 4, function()
		awful.layout.inc(1)
	end),
	awful.button({}, 5, function()
		awful.layout.inc(-1)
	end)
))

local layoutbox = wibox.widget({
	{
		mylayoutbox,
		widget = wibox.container.place,
	},
	widget = wibox.container.background,
	bg = color.bg_dim,
	shape = util.rect(dpi(1)),
	border_width = dpi(1),
	bg = color.bg_normal,
})
local btn = util.margin(layoutbox, 5, 5, 5, 5)
util.add_hover_effect(btn, color.bg_normal, color.bg_light, color.bg_dim)
return btn
