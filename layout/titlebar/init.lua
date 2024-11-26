local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = beautiful.xresources.apply_dpi

local sep = wibox.widget.textbox(" ")
sep.forced_width = dpi(50)
sep.forced_height = awful.screen.focused().workarea.height

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	awful.titlebar(c, { position = "left" }):setup({
		{ -- Left
			awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = wibox.layout.fixed.vertical,
		},
		{ -- Middle
			buttons = buttons,
			layout = wibox.layout.flex.vertical,
		},
		{ -- Right
			awful.titlebar.widget.floatingbutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.stickybutton(c),
			awful.titlebar.widget.ontopbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.vertical(),
		},
		layout = wibox.layout.align.vertical,
	})
end)
