local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")
local color = require("themes.colors")
local theme = require("themes.theme")
local panel = require("layout.panel")
local rubato = require("rubato")

local naughty = require("naughty")
local clock = require("layout.bar.modules.clock")
local launcher = require("layout.bar.modules.launcher")
local button_group = require("layout.bar.modules.button_group")
local layoutbox = require("layout.bar.modules.layoutbox")
local taglist = require("layout.bar.modules.taglist")
local tasklist = require("layout.bar.modules.tasklist")

local sep = wibox.widget.textbox(" ")
sep.forced_width = dpi(50)
sep.forced_height = awful.screen.focused().workarea.height
local sep2 = wibox.widget.textbox(" ")
sep2.forced_width = dpi(450)
sep2.forced_height = awful.screen.focused().workarea.height

local decide_rounded = function()
	if theme.spacing == dpi(0) then
		return dpi(0)
	else
		return theme.rounded
	end
end

local create_bar = function(s)
	-- could be wrong
	local height
	if s.index == 1 then
		height = s.workarea.height
	elseif s.index == 2 then
		height = s.workarea.height
	else
		height = s.workarea.height
	end

	s.bar = awful.wibar({
		width = dpi(50 + theme.spacing * 2),
		screen = s,
		position = "left",
		height = height,
		bg = "#00000000",
		widget = wibox.container.background,
		x = dpi(0),
		shape = util.rect(0),
		ontop = true,
		--stretch = true,
	})
	s.bar:setup({
		{
			{
				{
					{ launcher, clock, tasklist(s), layout = wibox.layout.fixed.vertical },
					nil,
					{ button_group, layoutbox, layout = wibox.layout.fixed.vertical },
					layout = wibox.layout.align.vertical,
				},
				{
					{
						taglist(s),
						layout = wibox.layout.fixed.vertical,
					},
					widget = wibox.container.place,
					content_fill_horizontal = true,
				},
				sep,
				layout = wibox.layout.stack,
			},
			widget = wibox.container.background,
			bg = theme.bar_bg,
			border_width = theme.bar_border_width,
			border_color = theme.bar_border_color,
			shape = util.rect(decide_rounded()),
		},
		widget = wibox.container.margin,
		top = theme.spacing * 2,
		bottom = theme.spacing * 2,
		left = theme.spacing * 2,
	})

	---------------------------------
	----panel------------------------
	---------------------------------

	if s == screen[1] then
		s.panel = awful.popup({
			width = dpi(450 + theme.spacing * 2),
			screen = s,
			height = height,
			ontop = true,
			bg = "#00000000",
			widget = wibox.container.background,
			x = dpi(-500),
			visible = true,
		})

		s.panel:setup({
			{
				{
					panel,
					sep2,
					layout = wibox.layout.stack,
				},
				widget = wibox.container.background,
				bg = color.bg_dim,
				shape = util.rect(theme.runded),
				border_width = theme.bar_border_width,
				border_color = theme.bar_border_color,
			},
			widget = wibox.container.margin,
			top = theme.spacing * 2,
			bottom = theme.spacing * 2,
			left = theme.spacing * 2,
			right = theme.spacing * 2,
		})

		---------------------------------
		----panel animation--------------
		---------------------------------

		local open = false
		awesome.connect_signal("open::window", function()
			open = not open
			if open then
				s.bar.ontop = true
				local timed = rubato.timed({
					duration = 1 / 5,
					intro = 1 / 11,
					override_dt = true,
					subscribed = function(pos)
						s.bar.x = pos
						s.panel.x = pos - 450
					end,
				})
				timed.target = 450
			else
				local timed = rubato.timed({
					duration = 1 / 4,
					intro = 1 / 9,
					override_dt = true,
					subscribed = function(pos)
						s.bar.x = pos + 450
						s.panel.x = pos
					end,
				})
				timed.target = -450
				awful.spawn.easy_async("sleep 0.25", function()
					s.bar.ontop = false
				end)
			end
		end)
	end
end

return create_bar
