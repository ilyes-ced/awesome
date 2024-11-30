--Standard MOdules
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")
--Colors
local color = require("themes.colors")
local theme = require("themes.theme")

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
	{ {
		mylayoutbox,
		widget = wibox.container.place,
	}, widget = wibox.container.margin, margins = dpi(10) },
	widget = wibox.container.background,
	bg = theme.bg_normal,
	border_width = theme.bar_border_width,
	border_color = theme.bar_border_color,
	shape = util.rect(theme.rounded),
})
local btn = util.margin(layoutbox, 5, 5, 5, 5)
util.add_hover_effect(btn, color.bg_normal, color.bg_light, color.bg_dim)
return btn
