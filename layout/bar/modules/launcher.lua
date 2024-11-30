local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = beautiful.xresources.apply_dpi

local color = require("themes.colors")
local theme = require("themes.theme")
local util = require("util")

-- Create the button text
local button_text = util.textbox(color.lightblue, "Ubuntu nerd font bold 22", "󰀻")

-- Create the button background with proper centering
local button_bg = wibox.widget({
	{
		button_text,
		widget = wibox.container.place, -- Use place container for centering
	},
	widget = wibox.container.background,
	bg = theme.bg_normal,
	border_width = theme.bar_border_width,
	border_color = theme.bar_border_color,
	shape = util.rect(theme.rounded),
})

-- Add margins around the button background
local button_final = util.margin(button_bg, 5, 5, 5, 5)

-- Add hover effect
util.add_hover_effect(button_bg, color.bg_normal, color.bg_light, color.bg_dim)

-- Connect signal for button release
button_final:connect_signal("button::release", function(_, _, _, button)
	if button == 1 then
		awesome.emit_signal("open::window")
	end
end)

return button_final
