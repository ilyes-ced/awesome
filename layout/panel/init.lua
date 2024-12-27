local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi

local util = require("util")
local color = require("themes.colors")
local theme = require("themes.theme")

local power_buttons = require("layout.panel.modules.power_buttons")
local user = require("layout.panel.modules.user")
local clock = require("layout.bar.modules.clock")
local github_contribs = require("layout.panel.modules.github_contribs")
local buttons_group = require("layout.panel.modules.buttons_group")

-----------------------------
--Widgets--------------------
-----------------------------

local panel = wibox.widget({
	{
		{
			wibox.container.constraint(user, "exact", 300 * 0.8),
			wibox.container.constraint(power_buttons, "max", 105),
			layout = wibox.layout.align.horizontal,
		},

		github_contribs(),
		{

			wibox.container.constraint(buttons_group, "exact", 300 * 0.5),
			wibox.container.constraint(buttons_group, "exact", 300 * 0.5),

			layout = wibox.layout.align.horizontal,
		},
		layout = wibox.layout.align.vertical,
	},
	layout = wibox.layout.stack,
})

-- calendar.visible = false

return panel
