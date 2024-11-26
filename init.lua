-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end

local naughty = require("naughty")

naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification({
		urgency = "critical",
		title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
		message = message,
	})
end)
