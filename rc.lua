local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local xresources = require("beautiful.xresources")
local dpi = beautiful.xresources.apply_dpi
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
local color = require("themes.colors")

modkey = "Mod4"
require("init")
local mymainmenu = require("popups.menu")
local user = require("user")
beautiful.init("~/.config/awesome/theme.lua")
local theme = require("themes.theme")

local bling = require("bling")

terminal = user.terminal
editor = user.editor
editor_cmd = terminal .. " -e " .. editor

awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.fair,
	awful.layout.suit.spiral,
	awful.layout.suit.max,
	awful.layout.suit.magnifier,
	awful.layout.suit.corner.nw,
	bling.layout.mstab,
	bling.layout.centered,
	bling.layout.equalarea,
	bling.layout.deck,
}

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

require("screen")

local globalkeys = require("bindings.keyboard.global")
local clientkeys = require("bindings.keyboard.client")
root.keys(globalkeys)

require("rules")

-- not tested
require("signals")

require("layout.titlebar")

-- bling tag preview
bling.widget.tag_preview.enable({
	show_client_content = true, -- Whether or not to show the client content
	x = 0, -- The x-coord of the popup
	y = 0, -- The y-coord of the popup
	scale = 0.5, -- The scale of the previews compared to the screen
	honor_padding = false, -- Honor padding when creating widget size
	honor_workarea = false, -- Honor work area when creating widget size
	placement_fn = function(c) -- Place the widget using awful.placement (this overrides x & y)
		awful.placement.top_left(c, {
			margins = {
				top = 270,
				left = 80,
			},
		})
	end,
	background_widget = wibox.widget({ -- Set a background image (like a wallpaper) for the widget
		image = "wallpaper image url",
		horizontal_fit_policy = "fit",
		vertical_fit_policy = "fit",
		widget = wibox.widget.imagebox,
	}),
})

-- gaps
beautiful.gap_single_client = true
beautiful.useless_gap = theme.spacing

function spawn_on_tag_and_screen(app_name, tag_name, screen_index)
	awful.spawn(
		app_name,
		{ tag = awful.tag.find_by_name(screen[screen_index], tag_name), screen = screen[screen_index] }
	)
end

-- Example of spawning applications at startup
--spawn_on_tag_and_screen("vscodium", "1", 1)
--spawn_on_tag_and_screen("floorp", "2", 1)
--
--spawn_on_tag_and_screen("brave", "1", 2)
--spawn_on_tag_and_screen("alacritty", "2", 2)

bling.widget.window_switcher.enable({
	type = "thumbnail", -- set to anything other than "thumbnail" to disable client previews

	-- keybindings (the examples provided are also the default if kept unset)
	hide_window_switcher_key = "Escape", -- The key on which to close the popup
	minimize_key = "n", -- The key on which to minimize the selected client
	unminimize_key = "N", -- The key on which to unminimize all clients
	kill_client_key = "q", -- The key on which to close the selected client
	cycle_key = "Tab", -- The key on which to cycle through all clients
	previous_key = "Left", -- The key on which to select the previous client
	next_key = "Right", -- The key on which to select the next client
	vim_previous_key = "h", -- Alternative key on which to select the previous client
	vim_next_key = "l", -- Alternative key on which to select the next client

	cycleClientsByIdx = awful.client.focus.byidx, -- The function to cycle the clients
	filterClients = awful.widget.tasklist.filter.currenttags, -- The function to filter the viewed clients
})

awful.spawn("picom --config ~/.config/picom/config.conf -b")
