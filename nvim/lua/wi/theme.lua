local theme = require("github-theme")
theme.setup({
	theme_style = "dark_default",
	dark_float = true,
	dark_sidebar = true,
	function_style = "italic",
	colors = {
		border = "#495057",
	},
})

local web_dev_icons = require("nvim-web-devicons")
web_dev_icons.setup({
	default = true,
})
