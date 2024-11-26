--local awful = require("awful")
--local wibox = require("wibox")
--local beautiful = require("beautiful")
--local dpi = beautiful.xresources.apply_dpi
--
--local color = require("themes.colors")
--local util = require("util")
--
--local button_text = util.textbox(color.lightblue, "Ubuntu nerd font bold 22", "󰀻")
--button_text.valign = "center"
--button_text.halign = "center"
--
--local button_bg = wibox.widget({
--	{
--		button_text,
--		widget = wibox.container.margin,
--		margins = dpi(5),
--	},
--	widget = wibox.container.background,
--	bg = color.bg_dim,
--	shape = util.rect(dpi(1)),
--	border_width = dpi(1),
--	border_color = "#ff0000",
--})
--
--local button_final = util.margin(button_bg, 5, 5, 5, 5)
--
--util.add_hover_effect(button_bg, color.bg_normal, color.bg_light, color.bg_dim)
--button_final.forced_width = dpi(50)
--
--button_final:connect_signal("button::release", function(_, _, _, button)
--	if button == 1 then
--		awesome.emit_signal("open::window")
--	end
--end)
--
--return button_final
--
--

local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = beautiful.xresources.apply_dpi

local color = require("themes.colors")
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
	bg = color.bg_dim,
	shape = util.rect(dpi(1)),
	border_width = dpi(1),
	bg = color.bg_normal,
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
