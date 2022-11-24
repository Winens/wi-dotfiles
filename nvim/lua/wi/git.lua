local git = require("git")
local signs = require("gitsigns")

git.setup({
	default_mappings = true,
	target_branch = "master",
})

signs.setup({})
