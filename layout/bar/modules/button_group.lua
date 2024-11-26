local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = beautiful.xresources.apply_dpi

local color = require("themes.colors")
local util = require("util")

-- Create the button text with appropriate font and color
local button_text = util.textbox(color.lightblue, "Ubuntu nerd font bold 22", "󰀻")

-- Create a container for the button text and center it
local button_content = wibox.widget({
	button_text,
	widget = wibox.container.place, -- Use 'place' to center content
})

-- Create the background for the button with margins
local button_bg = wibox.widget({
	{
		button_content,
		widget = wibox.container.margin,
		margins = dpi(5),
	},
	widget = wibox.container.background,
	bg = color.bg_dim,
	shape = util.rect(dpi(1)),
	border_width = dpi(1),
	bg = color.bg_normal,
})

-- Add margins to the final button
local button_final = util.margin(button_bg, 5, 5, 5, 5)

-- Add hover effects to the button background
util.add_hover_effect(button_bg, color.bg_normal, color.bg_light, color.bg_dim)
button_final.forced_width = dpi(50)

-- Connect signal for button release
button_final:connect_signal("button::release", function(_, _, _, button)
	if button == 1 then
		awesome.emit_signal("open::window")
	end
end)

return button_final
--
--
--local awful = require("awful")
--local wibox = require("wibox")
--local gears = require("gears")
--local beautiful = require("beautiful")
--local dpi = beautiful.xresources.apply_dpi
--
--local color = require("themes.colors")
--local util = require("util")
--
--local centered_text = wibox.widget({
--	markup = '<span font="jetBrainsMonoNerdFont 22" color="' .. beautiful.fg_normal .. '">󰕰</span>',
--	align = "center",
--	valign = "center",
--	widget = wibox.widget.textbox,
--})
--
--local centered_text2 = util.margin(centered_text, 5, 5, 5, 5)
--local my_button = wibox.container.background(
--	wibox.container.place(centered_text2, { halign = "center", valign = "center" }),
--	beautiful.bg_normal,
--	util.rect(dpi(1))
--)
--
--my_button.shape = util.rect(dpi(1))
--my_button.border_width = dpi(1)
--my_button.bg = color.bg_normal
--
--local my_button_final = util.margin(my_button, 5, 5, 5, 5)
--
-----------------------------------------------
--
--my_button_final:connect_signal("button::release", function(_, _, _, button)
--	if button == 1 then
--		awesome.emit_signal("open::window")
--	end
--end)
--
--return my_button_final
--
