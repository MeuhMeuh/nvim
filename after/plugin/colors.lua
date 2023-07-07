function MakeItSexy(color)
  color = color or "tokyonight-moon"
  vim.cmd.colorscheme(color)

  -- Transparency - doesn't work?
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  -- 120 char color column
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1f2132" })
  vim.cmd([[
    augroup MyColors

    autocmd!

    autocmd ColorScheme * highlight BufferLineFill guibg=NONE
    autocmd ColorScheme * highlight BufferLineBuffer guibg=NONE
    autocmd ColorScheme * highlight BufferLineBufferVisible guibg=NONE
    autocmd ColorScheme * highlight BufferLineBackground guibg=NONE

    autocmd ColorScheme * highlight BufferLineSeparator guifg=NONE guibg=NONE

    autocmd ColorScheme * highlight BufferLineSeparatorSelected guifg=NONE

    " thick border on current buffer tab
    autocmd ColorScheme * highlight BufferLineIndicatorSelected guibg=NONE

    " column left to line numbers col
    autocmd ColorScheme * highlight SignColumn guibg=NONE

    autocmd ColorScheme * highlight SignColumn guibg=NONE

    augroup END
]])
end

MakeItSexy()
