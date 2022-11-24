local lualine = require("lualine")

local statusline_theme = {
	bg = "#121721",
	fg = "#7b8fb7",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local config = {
	options = {
		globalstatus = true,
		component_separators = "",
		section_separators = "",
		theme = {
			normal = { c = { fg = statusline_theme.fg, bg = statusline_theme.bg } },
			inactive = { c = { fg = statusline_theme.fg, bg = statusline_theme.bg } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

--[[
ins_left {
  function()
    return '▊'
  end,
  color = { fg = statusline_theme.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}
--]]

ins_left({
	-- mode component
	function()
		return " "
	end,
	color = {
		fg = statusline_theme.fg,
	},
	-- auto change color according to neovims mode
	padding = { right = 1 },
})

ins_left({ "hostname" })

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
	color = { fg = statusline_theme.fg, gui = "bold" },
})

ins_right({ "filetype" })

ins_right({ "location" })

ins_right({ "progress", color = { fg = statusline_theme.fg, gui = "bold" } })

--[[
ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = statusline_theme.red },
  },
}
--]]

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
--[[
ins_left {
  function()
    return '%='
  end,
}
--]]

--[[
ins_left {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}
--]]

-- Add components to right sections

lualine.setup(config)
