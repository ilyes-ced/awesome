-------------------------------------------------
-- Github Contributions Widget for Awesome Window Manager
-- Shows the contributions graph
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/github-contributions-widget

-- @author Pavel Makhov
-- @copyright 2020 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local naughty = require("naughty")
local wibox = require("wibox")
local gears = require("gears")

local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi

local util = require("util")
local color = require("themes.colors")
local theme = require("themes.theme")

local widget_themes = {
	standard = {
		[4] = "#216e39",
		[3] = "#30a14e",
		[2] = "#40c463",
		[1] = "#9be9a8",
		[0] = "#ebedf0",
	},
	classic = {
		[4] = "#196127",
		[3] = "#239a3b",
		[2] = "#7bc96f",
		[1] = "#c6e48b",
		[0] = "#ebedf0",
	},
	teal = {
		[4] = "#458B74",
		[3] = "#66CDAA",
		[2] = "#76EEC6",
		[1] = "#7FFFD4",
		[0] = "#ebedf0",
	},
	leftpad = {
		[4] = "#F6F6F6",
		[3] = "#DDDDDD",
		[2] = "#A5A5A5",
		[1] = "#646464",
		[0] = "#2F2F2F",
	},
	dracula = {
		[4] = "#ff79c6",
		[3] = "#bd93f9",
		[2] = "#6272a4",
		[1] = "#44475a",
		[0] = "#282a36",
	},
	pink = {
		[4] = "#61185f",
		[3] = "#a74aa8",
		[2] = "#ca5bcc",
		[1] = "#e48bdc",
		[0] = "#ebedf0",
	},
}

local GET_CONTRIBUTIONS_CMD = [[bash -c "curl -s https://github-contributions.vercel.app/api/v1/%s]]
	.. [[ | jq -r '[.contributions[] ]]
	.. [[ | select ( .date | strptime(\"%%Y-%%m-%%d\") | mktime < now)][:%s]| .[].intensity'"]]

local github_contributions_widget = wibox.widget({
	{
		{
			reflection = {
				horizontal = true,
				vertical = true,
			},
			widget = wibox.container.mirror,
		},
		widget = wibox.container.background,
		bg = "#ff0000",
		border_width = theme.bar_border_width,
		border_color = theme.bar_border_color,
		shape = util.rect(theme.rounded),
	},
	widget = wibox.container.margin,
	top = theme.spacing,
	bottom = theme.spacing,
	left = theme.spacing,
	right = theme.spacing,
})

local function show_warning(message)
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Github Contributions Widget",
		text = message,
	})
end

local function worker(user_args)
	local args = user_args or {}
	local username = "ilyes-ced"
	local days = args.days or 365
	local color_of_empty_cells = args.color_of_empty_cells
	local with_border = args.with_border
	local margin = dpi(20)
	local theme = args.theme or "standard"

	if widget_themes[theme] == nil then
		show_warning("Theme " .. theme .. " does not exist")
		theme = "standard"
	end

	if with_border == nil then
		with_border = true
	end

	local function get_square(color)
		if color_of_empty_cells ~= nil and color == widget_themes[theme][0] then
			color = color_of_empty_cells
		end

		return wibox.widget({
			fit = function()
				return 3, 3
			end,
			draw = function(_, _, cr, _, _)
				cr:set_source(gears.color(color))
				cr:rectangle(0, 0, with_border and 2 or 3, with_border and 2 or 3)
				cr:fill()
			end,
			layout = wibox.widget.base.make_widget,
		})
	end

	local col = { layout = wibox.layout.fixed.vertical }
	local row = { layout = wibox.layout.fixed.horizontal }
	local day_idx = 5 - os.date("%w")
	for _ = 0, day_idx do
		table.insert(col, get_square(color_of_empty_cells))
	end

	local update_widget = function(_, stdout, _, _, _)
		for intensity in stdout:gmatch("[^\r\n]+") do
			if day_idx % 7 == 0 then
				table.insert(row, col)
				col = { layout = wibox.layout.fixed.vertical }
			end
			table.insert(col, get_square(widget_themes[theme][tonumber(intensity)]))
			day_idx = day_idx + 1
		end
		github_contributions_widget:setup({
			row,
			top = margin,
			bottom = margin,
			right = margin,
			left = margin,
			layout = wibox.container.margin,
		})
	end

	awful.spawn.easy_async(string.format(GET_CONTRIBUTIONS_CMD, username, days), function(stdout)
		update_widget(github_contributions_widget, stdout)
	end)

	return github_contributions_widget
end

return setmetatable(github_contributions_widget, {
	__call = function(_, ...)
		return worker(...)
	end,
})
