local theme = require("github-theme")

theme.setup{
  theme_style = "dark_default",
  transparent = false
}

local web_dev_icons = require("nvim-web-devicons")
web_dev_icons.setup{
  default = true
}
