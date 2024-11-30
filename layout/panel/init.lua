local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi

local util = require("util")
local color = require("themes.colors")

local clock = require("layout.bar.modules.clock")
local launcher = require("layout.bar.modules.launcher")
local button_group = require("layout.bar.modules.button_group")
-----------------------------
--Widgets--------------------
-----------------------------

local panel = wibox.widget({
	{
		clock,
		launcher,
		button_group,
		nil,
		nil,
		layout = wibox.layout.align.vertical,
	},
	layout = wibox.layout.stack,
})

-- calendar.visible = false

return panel
