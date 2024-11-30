local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local bling = require("bling")
local color = require("themes.colors")

local taglist_buttons = require("bindings.mouse.taglist")
local tasklist_buttons = require("bindings.mouse.tasklist")

local function set_wallpaper(s)
	bling.module.tiled_wallpaper("󰝤", s, { -- call the actual function ("x" is the string that will be tiled)
		fg = color.red, -- define the foreground color
		bg = color.bg_normal, -- define the background color
		offset_y = 4, -- set a y offset
		offset_x = 4, -- set a x offset
		font = "jetBrainsMonoNerdFont", -- set the font (without the size)
		font_size = 18, -- set the font size
		padding = 50, -- set padding (default is 100)
		zickzack = false, -- rectangular pattern or criss cross
	})
end

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	-- -- Create a taglist widget
	-- s.mytaglist = awful.widget.taglist {
	--     screen  = s,
	--     filter  = awful.widget.taglist.filter.all,
	--     buttons = taglist_buttons,
	--
	--     layout = {
	--         layout  = wibox.layout.fixed.vertical,
	--         spacing_widget = {
	--             color  = '#dddddd'
	--         },
	--     }
	-- }

	local create_bar = require("layout.bar")
	create_bar(s)
end)
-- }}}
