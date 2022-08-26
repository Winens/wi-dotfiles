local lualine = require("lualine")

local statusline_theme = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local config = {
  options = {
    component_separators = '',
    section_separators = '',
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

ins_left {
  function()
    return '▊'
  end,
  color = { fg = statusline_theme.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return ''
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = statusline_theme.red,
      i = statusline_theme.green,
      v = statusline_theme.blue,
      [''] = statusline_theme.blue,
      V = statusline_theme.blue,
      c = statusline_theme.magenta,
      no = statusline_theme.red,
      s = statusline_theme.orange,
      S = statusline_theme.orange,
      [''] = statusline_theme.orange,
      ic = statusline_theme.yellow,
      R = statusline_theme.violet,
      Rv = statusline_theme.violet,
      cv = statusline_theme.red,
      ce = statusline_theme.red,
      r = statusline_theme.cyan,
      rm = statusline_theme.cyan,
      ['r?'] = statusline_theme.cyan,
      ['!'] = statusline_theme.red,
      t = statusline_theme.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = statusline_theme.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = statusline_theme.fg, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = statusline_theme.red },
    color_warn = { fg = statusline_theme.yellow },
    color_info = { fg = statusline_theme.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

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
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}

-- Add components to right sections
ins_right {
  'o:encoding',
  fmt = string.upper,
  cond = conditions.hide_in_width,
  color = { fg = statusline_theme.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false,
  color = { fg = statusline_theme.green, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = statusline_theme.violet, gui = 'bold' },
}

ins_right {
  'diff',
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = statusline_theme.green },
    modified = { fg = statusline_theme.orange },
    removed = { fg = statusline_theme.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = statusline_theme.blue },
  padding = { left = 1 },
}

lualine.setup(config)
