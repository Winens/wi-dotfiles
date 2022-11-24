local telescope = require("telescope")
local telescope_actions = require("telescope.actions")
telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"icons",
			"target",
			"imgs",
			"public",
			"tmp",
			"cache",
			"bin",
			"CMakeFiles",
			"build",
			"limine",
			"dist",
		},
	},
})
