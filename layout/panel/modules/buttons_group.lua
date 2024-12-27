local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi

local util = require("util")
local color = require("themes.colors")
local theme = require("themes.theme")

local outer_padding = dpi(20)

local create_container = function(img, clr, onstatus, fn_on, fn_off)
	local btn = wibox.widget({
		util.margin(
			wibox.widget({
				util.imagebox(img, 40, 50),
				widget = wibox.container.place,
			}),
			5,
			5,
			5,
			5
		),
		widget = wibox.container.background,
		bg = onstatus and "#ff0000" or clr,
		shape = util.rect(theme.rounded),
	})

	btn:connect_signal("button::press", function()
		onstatus = not onstatus
		if onstatus then
			btn.bg = clr
			if fn_on ~= nil then
				fn_on()
			end
		else
			btn.bg = color.mid_dark
			if fn_off ~= nil then
				fn_off()
			end
		end
	end)

	return util.margin(btn, 10, 10, 10, 10)
end

local power_buttons = wibox.widget({
	{
		{
			{
				{
					{
						create_container(theme.assets_path .. "power.svg", color.red, false, nil, nil),
						create_container(theme.assets_path .. "restart.svg", color.orange, false, nil, nil),
						layout = wibox.layout.fixed.horizontal,
					},
					widget = wibox.container.margin,
					top = dpi(outer_padding),
				},
				{
					{
						create_container(theme.assets_path .. "logout.svg", color.green, false, nil, nil),
						create_container(theme.assets_path .. "sleep.svg", color.blue, false, nil, nil),
						layout = wibox.layout.fixed.horizontal,
					},

					widget = wibox.container.margin,
					bottom = dpi(outer_padding),
				},
				widget = wibox.container.margin,
				bottom = dpi(outer_padding),
				layout = wibox.layout.fixed.vertical,
			},
			widget = wibox.container.place,
		},
		widget = wibox.container.background,
		shape = util.rect(dpi(theme.rounded)),
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

-- calendar.visible = false

return power_buttons
