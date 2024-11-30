local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local funcs = {}

funcs.rect = function(radius)
	return function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, radius)
	end
end

funcs.part_rect = function(tl, tr, br, bl, radius)
	return function(cr, width, height)
		gears.shape.partially_rounded_rect(cr, width, height, tl, tr, br, bl, radius)
	end
end

funcs.margin = function(wgt, ml, mr, mt, mb)
	return wibox.widget({
		wgt,
		widget = wibox.container.margin,
		left = dpi(ml),
		right = dpi(mr),
		top = dpi(mt),
		bottom = dpi(mb),
	})
end

funcs.textbox = function(color, font, text)
	return wibox.widget({
		markup = '<span color="' .. color .. '" font="' .. font .. '">' .. text .. "</span>",
		widget = wibox.widget.textbox,
	})
end

funcs.add_hover_effect = function(button, clr_hvr, clr_press, clr_nrml)
	button:connect_signal("mouse::enter", function()
		button.bg = clr_hvr
	end)

	button:connect_signal("mouse::leave", function()
		button.bg = clr_nrml
	end)

	button:connect_signal("button::press", function()
		button.bg = clr_press
	end)

	button:connect_signal("button::release", function()
		button.bg = clr_hvr
	end)
end

return funcs
