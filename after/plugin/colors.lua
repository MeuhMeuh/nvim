function MakeItSexy(color)
	color = color or "tokyonight-moon"
	vim.cmd.colorscheme(color)

	-- Transparency - doesn't work?
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

MakeItSexy()
