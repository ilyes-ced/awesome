local beautiful = require("beautiful")
local naughty = require("naughty")
local wibox = require("wibox")
local gears = require("gears")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local theme = require("themes.theme")
local util = require("util")

local bling = require("bling")
-- local rubato = require("rubato")
--
-- timed = rubato.timed({
-- 	duration = 1 / 2, --half a second
-- 	intro = 1 / 6, --one third of duration
-- 	override_dt = true, --better accuracy for testing
-- 	subscribed = function(pos)
-- 		print(pos)
-- 		naughty.notify({
-- 			text = tostring(pos),
-- 			title = warning_msg_title,
-- 			timeout = 25, -- show the warning for a longer time
-- 			hover_timeout = 0.5,
-- 			position = warning_msg_position,
-- 			bg = "#000",
-- 			fg = "#EEE9EF",
-- 			width = 300,
-- 		})
-- 	end,
-- })
-- timed.target = 450

local args = {
	sort_alphabetically = false,
	reverse_sort_alphabetically = true,
	icon_size = 24,
	favorites = { "vscodium", "floorp", "brave" },
	app_height = dpi(200),
	expand_apps = true,

	background = theme.launcher_bg,
	border_width = theme.launcher_border_width,
	border_color = theme.launcher_border_color,
	shape = util.rect(theme.rounded),
	prompt_height = dpi(50),
	prompt_margins = dpi(30),
	prompt_paddings = dpi(15),
	prompt_shape = util.rect(theme.rounded),
	prompt_color = theme.prompt_bg,
	prompt_border_width = theme.prompt_border_width,
	prompt_border_color = theme.prompt_border_color,
	prompt_text_halign = "center",
	prompt_text_valign = "center",
	prompt_icon_text_spacing = dpi(10),
	prompt_show_icon = true,
	prompt_icon_font = "Comic Sans",
	prompt_icon_markup = string.format("<span size='large' foreground='%s'>%s</span>", theme.prompt_icon_color, ""),
	prompt_text = "<b>Search</b>:",
	prompt_start_text = "manager",
	prompt_font = "Comic Sans",
	prompt_text_color = theme.prompt_text_color,
	prompt_cursor_color = theme.prompt_cursor_color,

	apps_per_column = 5,
	apps_per_row = 3,
	apps_margin = { left = dpi(30), right = dpi(30), bottom = dpi(30) },
	apps_spacing = dpi(10),

	expand_apps = true,
	app_shape = util.rect(theme.rounded),
	app_normal_color = theme.app_bg,

	app_normal_hover_color = theme.app_normal_hover_color,
	app_selected_color = theme.app_selected_color,
	app_selected_hover_color = theme.app_selected_hover_color,
	app_content_padding = dpi(10),
	app_content_spacing = dpi(10),
	app_show_icon = true,
	app_icon_halign = "center",
	app_icon_width = dpi(70),
	app_icon_height = dpi(70),
	app_show_name = true,
	app_name_layout = wibox.layout.fixed.vertical,
	app_name_generic_name_spacing = dpi(0),
	app_name_halign = "center",
	app_name_font = "Comic Sans",
	app_name_normal_color = theme.app_name_normal_color,
	app_name_selected_color = theme.app_name_selected_color,
	app_show_generic_name = true,
}

local app_launcher = bling.widget.app_launcher(args)

return app_launcher
