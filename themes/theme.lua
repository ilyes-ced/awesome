local user = require("user")
local color = require("themes.colors")
local util = require("util")
local theme = {}
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = beautiful.xresources.apply_dpi

theme.useless_gap = 4
theme.font = "jetBrainsMonoNerdFont 12"
theme.wallpaper = user.wallpaper
theme.assets_path = "/home/dude/.config/awesome/assets/"

local layout_path = "/usr/share/awesome/themes/default/layouts/"
local titlebar_path = user.theme == "biscuit_dark" and os.getenv("HOME") .. "/.config/awesome/assets/titlebar_biscuit/"
	or os.getenv("HOME") .. "/.config/awesome/assets/titlebar_icons/"

-------------------------
--Colors-----------------
-------------------------
theme.fg = color.fg_normal
theme.bg = color.bg_dark
theme.bg_normal = color.bg_normal
theme.fg_normal = color.mid_light
theme.bg_focus = color.mid_dark
theme.fg_focus = color.fg_normal
theme.border_width = dpi(2)
theme.border_normal = "#000000"
theme.border_focus = "#535d6c"
theme.logout_box_bg = "#00000090"

theme.rounded = dpi(4)
theme.spacing = dpi(4)
theme.bar_spacing = dpi(0)

-------------------------
--client-----------------
-------------------------

theme.client_border_width = dpi(2)
theme.client_border_color = color.bg_dark
theme.client_border_color_active = color.red

-------------------------
--bar--------------------
-------------------------

theme.bar_bg = color.bg_dark
theme.bar_light_bg = color.bg_normal

theme.bar_border_width = dpi(0)
theme.bar_border_color = color.red

-------------------------
--tags-------------------
-------------------------

theme.tags_focused = color.purple
theme.tags_focused_height = dpi(50)

theme.tags_unfocused = color.bg_light
theme.tags_unfocused_height = dpi(20)

theme.tags_unfocused_full = color.cyan
theme.tags_unfocused_full_height = dpi(50)

theme.tags_urgent = color.red
theme.tags_urgent_height = dpi(20)

-------------------------
--tag preview------------
-------------------------

theme.tag_preview_border_width = dpi(2)
theme.tag_preview_border_color = color.mid_normal

-------------------------
--window switcher--------
-------------------------

theme.window_switcher_bg = color.bg_dark
theme.window_switcher_border_width = dpi(2)
theme.window_switcher_border_color = color.mid_normal
theme.window_switcher_border_radius = theme.rounded

theme.window_switcher_name_normal_color = color.purple
theme.window_switcher_name_focus_color = color.red

-------------------------
--app launcher ----------
-------------------------

theme.launcher_bg = color.bg_dark
theme.launcher_border_width = dpi(2)
theme.launcher_border_color = color.purple

theme.prompt_bg = color.bg_normal
theme.prompt_border_width = dpi(2)
theme.prompt_border_color = color.purple
theme.prompt_icon_color = color.mid_light
theme.prompt_text_color = color.fg_normal
theme.prompt_cursor_color = color.mid_light

theme.app_bg = color.bg_dim
theme.app_normal_hover_color = color.mid_normal
theme.app_selected_color = color.mid_light
theme.app_selected_hover_color = color.fg_normal
theme.app_name_normal_color = color.fg_normal
theme.app_name_selected_color = color.bg_dark

--------------------------
--Layout icons------------
--------------------------
theme.layout_fairh = layout_path .. "fairhw.png"
theme.layout_fairv = layout_path .. "fairvw.png"
theme.layout_floating = layout_path .. "floatingw.png"
theme.layout_magnifier = layout_path .. "magnifierw.png"
theme.layout_max = layout_path .. "maxw.png"
theme.layout_fullscreen = layout_path .. "fullscreenw.png"
theme.layout_tilebottom = layout_path .. "tilebottomw.png"
theme.layout_tileleft = layout_path .. "tileleftw.png"
theme.layout_tile = layout_path .. "tilew.png"
theme.layout_tiletop = layout_path .. "tiletopw.png"
theme.layout_spiral = layout_path .. "spiralw.png"
theme.layout_dwindle = layout_path .. "dwindlew.png"
theme.layout_cornernw = layout_path .. "cornernw.png"
theme.layout_cornerne = layout_path .. "cornerne.png"
theme.layout_cornersw = layout_path .. "cornersw.png"
theme.layout_cornerse = layout_path .. "cornerse.png"

----------------------------
--Titlebar------------
----------------------------
--Close Button
theme.titlebar_close_button_normal = titlebar_path .. "inactive.png"
theme.titlebar_close_button_focus = titlebar_path .. "close.png"
theme.titlebar_close_button_normal_hover = titlebar_path .. "close_hover.png"
theme.titlebar_close_button_focus_hover = titlebar_path .. "close_hover.png"

--Maximized Button
theme.titlebar_maximized_button_normal_inactive = titlebar_path .. "inactive.png"
theme.titlebar_maximized_button_focus_inactive = titlebar_path .. "maximize.png"
theme.titlebar_maximized_button_normal_active = titlebar_path .. "inactive.png"
theme.titlebar_maximized_button_focus_active = titlebar_path .. "maximize.png"
theme.titlebar_maximized_button_normal_inactive_hover = titlebar_path .. "maximize-hover.png"
theme.titlebar_maximized_button_focus_inactive_hover = titlebar_path .. "maximize-hover.png"
theme.titlebar_maximized_button_normal_active_hover = titlebar_path .. "maximize-hover.png"
theme.titlebar_maximized_button_focus_active_hover = titlebar_path .. "maximize-hover.png"

--Minimize Button
theme.titlebar_minimize_button_normal = titlebar_path .. "inactive.png"
theme.titlebar_minimize_button_focus = titlebar_path .. "minimize.png"
theme.titlebar_minimize_button_normal_hover = titlebar_path .. "minimize_hover.png"
theme.titlebar_minimize_button_focus_hover = titlebar_path .. "minimize_hover.png"

--Colors
theme.titlebar_bg = color.bg_dark
theme.titlebar_bg_focus = color.bg_dark

------------------------
--Taglist---------------
------------------------
theme.taglist_bg_empty = color.bg_dark
theme.taglist_fg_empty = color.mid_normal
theme.taglist_bg_occupied = color.bg_dark
theme.taglist_fg_occupied = color.fg_normal
theme.taglist_bg_focus = color.bg_light
theme.taglist_fg_focus = color.cyan
theme.taglist_fg_urgent = color.yellow

theme.taglist_spacing = 15
theme.taglist_font = "Ubuntu nerd font 1 bold"

------------------------
--Tasklist--------------
------------------------
theme.tasklist_bg_minimize = color.bg_normal
theme.tasklist_bg_focus = color.bg_normal
theme.tasklist_shape_border_width = 3
theme.tasklist_shape_border_color = color.bg_normal
theme.tasklist_shape_border_color_focus = color.cyan
theme.tasklist_shape_border_color_minimized = color.magenta
theme.tasklist_shape_border_color_urgent = color.yellow

------------------------
--Rightclick Menu-------
------------------------
theme.menu_width = 220
theme.menu_height = 35
theme.menu_font = "Ubuntu nerd font 15"
theme.menu_bg_normal = "#ff0000"
theme.menu_bg_focus = color.lightblue
theme.menu_fg_normal = color.fg_normal
theme.menu_fg_focus = color.bg_dark
theme.menu_border_width = 3
theme.menu_border_color = color.bg_normal

------------------------
--Notifications---------
------------------------
theme.notification_font = "Ubuntu nerd font 13"
theme.notification_border_width = 1
theme.notification_border_color = color.bg_dim
theme.notification_width = 350
theme.notification_shape = util.rect(8)

return theme
