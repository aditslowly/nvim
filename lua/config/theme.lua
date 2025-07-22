vim.cmd([[
  augroup TransparentBG
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight NormalNC ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight NormalFloat ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight FloatBorder ctermbg=NONE guibg=NONE
  augroup END
]])
