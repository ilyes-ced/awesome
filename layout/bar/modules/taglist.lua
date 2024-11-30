local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local util = require("util")
local color = require("themes.colors")
local theme = require("themes.theme")

local taglist_buttons = require("bindings.mouse.taglist")

local update_tag = function(self, c3, _)
	if c3.selected then
		self:get_children_by_id("tags")[1].forced_height = theme.tags_focused_height
		self:get_children_by_id("tags")[1].bg = theme.tags_focused
	elseif #c3:clients() == 0 then
		self:get_children_by_id("tags")[1].forced_height = theme.tags_unfocused_height
		self:get_children_by_id("tags")[1].bg = theme.tags_unfocused
	else
		if c3.urgent then
			self:get_children_by_id("tags")[1].forced_height = theme.tags_urgent_height
			self:get_children_by_id("tags")[1].bg = theme.tags_urgent
		else
			self:get_children_by_id("tags")[1].forced_height = theme.tags_unfocused_full_height
			self:get_children_by_id("tags")[1].bg = theme.tags_unfocused_full
		end
	end
end

local create_taglist = function(s)
	-- Create a taglist widget
	taglist_container = wibox.container.background(wibox.container.margin(
		awful.widget.taglist({
			screen = s,
			filter = awful.widget.taglist.filter.all,
			buttons = taglist_buttons,

			layout = {
				layout = wibox.layout.fixed.vertical,
				spacing = dpi(10),
				shape = util.rect(dpi(8)),
			},

			widget_template = {
				id = "tags",
				widget = wibox.container.background,
				bg = color.fg_normal,
				forced_height = dpi(20),
				shape = util.rect(dpi(20)),

				create_callback = function(self, c3, index, objects) --luacheck: no unused args
					update_tag(self, c3, _)
					--self:get_children_by_id("index_role")[1].markup = "<b> " .. index .. " </b>"
					self:connect_signal("mouse::enter", function()
						-- BLING: Only show widget when there are clients in the tag
						if #c3:clients() > 0 then
							-- BLING: Update the widget with the new tag
							awesome.emit_signal("bling::tag_preview::update", c3)
							-- BLING: Show the widget
							awesome.emit_signal("bling::tag_preview::visibility", s, true)
						end

						if self.bg ~= color.orange then
							self.backup = self.bg
							self.has_backup = true
						end
						self.bg = color.orange
					end)
					self:connect_signal("mouse::leave", function()
						-- BLING: Turn the widget off
						awesome.emit_signal("bling::tag_preview::visibility", s, false)

						if self.has_backup then
							self.bg = self.backup
						end
					end)
				end,
				update_callback = function(self, c3, index, objects) --luacheck: no unused args
					update_tag(self, c3, _)
					--self:get_children_by_id("index_role")[1].markup = "<b> " .. index .. " </b>"
				end,
			},
		}),
		dpi(15),
		dpi(15),
		dpi(10),
		dpi(10)
	))
	taglist_container.bg = theme.bg_normal
	taglist_container.border_width = theme.bar_border_width
	taglist_container.border_color = theme.bar_border_color
	taglist_container.shape = util.rect(theme.rounded)

	local taglist = util.margin(taglist_container, 5, 5, 5, 5)

	return taglist
end

return create_taglist
