-- Big cursor
vim.opt.guicursor = ""

-- Relative numbers ftw
vim.opt.nu = true
vim.opt.relativenumber = true

-- Because hey why not
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Make me dream, vim
vim.opt.smartindent = true

-- Line wrap is meh
vim.opt.wrap = false

-- Let undotree do the magic and have access to nice history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Avoid noh annoying stuff and still highlights incrementing search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- 8 lines at end of file when scrolling to bottom
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Shorter jump with C-d/C-u
vim.opt.scroll = 10

vim.opt.updatetime = 50

-- 120-char colored column
vim.opt.colorcolumn = "120"

vim.opt.winbar = "%=%m %f"

-- Autocomplete: max 8 items
vim.opt.pumheight = 8
-- Autocomplete: do not insert until we've selected something (askip)
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
