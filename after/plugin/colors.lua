function MakeItSexy(color)
  color = color or "tokyonight-moon"
  vim.cmd.colorscheme(color)

  -- Transparency - doesn't work?
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  -- 120 char color column
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#282c43" })
  vim.cmd([[
    augroup MyColors

    autocmd!

    autocmd ColorScheme * highlight BufferLineFill guibg=#1e2030

    autocmd ColorScheme * highlight BufferLineSeparator guifg=#1e2030

    autocmd ColorScheme * highlight BufferLineSeparatorSelected guifg=#1e2030

    augroup END
]])
end

MakeItSexy()
