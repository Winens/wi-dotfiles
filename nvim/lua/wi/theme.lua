local theme = require("github-theme")
theme.setup({
	theme_style = "dark_default",
	transparent = false,
	function_style = "italic",
	sidebars = { "qf", "vista_kind", "terminal", "packer" },
	colors = {
		border = "#495057",
	},
})

local web_dev_icons = require("nvim-web-devicons")
web_dev_icons.setup({
	default = true,
})
