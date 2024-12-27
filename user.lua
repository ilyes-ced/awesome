local user = {

	--Profile
	name = "ilyes",
	host = "awesomewm",
	user_img = os.getenv("HOME") .. "/.config/awesome/assets/user.png",

	-- Default apps
	terminal = "alacritty",
	file_manager = "thunar",
	browser = "firefox",
	editor = "nvim",

	wallpaper = os.getenv("HOME") .. "/.config/awesome/assets/wave.png",
	icon_path = os.getenv("HOME") .. "/.icons/Papirus/48x48/apps/",
	-- icon_path    = os.getenv("HOME") .. '/.icons/Tela/scalable/apps/',
	-- icon_path    = os.getenv("HOME") .. '/.icons/Zafiro-Icons-Dark-Blue-f/apps/scalable/',
	theme = "rosepine",
	bar_floating = false,
}

return user
