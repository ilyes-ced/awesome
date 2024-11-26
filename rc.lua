local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

modkey = "Mod4"
require("init")
local mymainmenu = require("popups.menu")
local user = require("user")
beautiful.init("~/.config/awesome/theme.lua")

local bling = require("bling")
bling.module.flash_focus.enable()

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
bling.widget.tag_preview.enable({
	show_client_content = false, -- Whether or not to show the client content
	x = 10, -- The x-coord of the popup
	y = 10, -- The y-coord of the popup
	scale = 0.25, -- The scale of the previews compared to the screen
	honor_padding = false, -- Honor padding when creating widget size
	honor_workarea = false, -- Honor work area when creating widget size
	placement_fn = function(c) -- Place the widget using awful.placement (this overrides x & y)
		awful.placement.top_left(c, {
			margins = {
				top = 30,
				left = 30,
			},
		})
	end,
	background_widget = wibox.widget({ -- Set a background image (like a wallpaper) for the widget
		image = beautiful.wallpaper,
		horizontal_fit_policy = "fit",
		vertical_fit_policy = "fit",
		widget = wibox.widget.imagebox,
	}),
})
