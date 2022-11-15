require("nvim-treesitter.install").prefer_git = true

require("nvim-treesitter.configs").setup{
  auto_install = true,
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true
  },
  endwise = {
    enable = true
  }
}

require('nvim-ts-autotag').setup()
--vim.cmd([[ autocmd BufReadPost,FileReadPost * normal zR ]])
