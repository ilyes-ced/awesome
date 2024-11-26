local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")


local user = require("user")



mymainmenu = awful.menu({ items = {
  -- { 'awesome',       _M.awesomemenu, beautiful.awesome_icon },
  { 'open terminal',    user.terminal },
  { 'change wallpaper', 'nitrogen' },
  { 'change theme',     'lxappearance' }
}
                       })



-- Menubar configuration
menubar.utils.terminal = user.terminal -- Set the terminal for applications that require it
-- }}}
return mymainmenu