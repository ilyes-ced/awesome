local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi

local util = require("util")
local color = require("themes.colors")
local theme = require("themes.theme")

-- Create the button background with proper centering
local profile_container = wibox.widget({
	{
		{

			{
				{
					{
						{
							image = theme.assets_path .. "itachi.jpg",
							--forced_height = 200,
							forced_width = 150,
							clip_shape = util.rect(dpi(theme.rounded)),
							widget = wibox.widget.imagebox,
						},
						widget = wibox.container.margin,
						left = dpi(50),
						right = dpi(50),
						bottom = dpi(10),
					},
					widget = wibox.container.place,
				},
				{
					{
						widget = wibox.widget.textbox,
						markup = '<span color="'
							.. theme.fg_normal
							.. '" font="'
							.. theme.font
							.. ' Bold 16">Ilyes</span>',
						valign = "center",
						halign = "center",
					},
					widget = wibox.container.place,
				},
				layout = wibox.layout.align.vertical,
			},

			widget = wibox.container.place,
		},
		widget = wibox.container.background,
		bg = theme.bg_normal,
		border_width = theme.bar_border_width,
		border_color = theme.bar_border_color,
		shape = util.rect(theme.rounded),
	},
	widget = wibox.container.margin,
	top = theme.spacing,
	bottom = theme.spacing,
	left = theme.spacing,
	right = theme.spacing,
})

return profile_container
