-- What else?
vim.keymap.set("i", "jk", "<Esc>")

-- Paste without yanking newly selected line
vim.keymap.set("x", "<leader>pp", "\"_dP")

-- Remap netrw :Ex
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append next line to current one (as usual) but don't move cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Sexy C-d/C-u to browse with centered cursor
-- vim.keymap.set("n", "<C-d>", "5jzz")
vim.api.nvim_set_keymap('n', '<C-d>', '5jzz<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '5kzz<CR>', { silent = true })

-- Smoother cursor behavior when searching with n
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Separate yanks vim VS OS - <leader>y to yank in OS-one
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Deleting to void register
vim.keymap.set("v", "<leader>d", "\"_d")

-- Easy ciw
vim.keymap.set("n", "<leader>,", "ciw")

-- Disabling Q
vim.keymap.set("n", "Q", "<nop>")

-- When using _, ensuring that editor's left side is at char 0
vim.keymap.set("n", "_", "0_")

-- Vim Quicklist
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>q", "<cmd>cclose<CR>")

-- Easy replace
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>s$", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>sc", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left><Left>]])
vim.keymap.set("n", "<leader>sGG", [[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>sGc", [[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left><Left>]])
--
-- Delete current buffer
vim.keymap.set("n", "<leader>x", "<cmd>bdelete! %<CR>")
-- Delete current buffer except current one
vim.keymap.set("n", "<leader>X", "<cmd>%bd!|e#|bd!#<CR>")

-- Bufferline
vim.keymap.set("n", "<C-h>", "<cmd>:BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>:BufferLineCycleNext<CR>")

-- Copy relative path of current buffer
vim.api.nvim_set_keymap('n', '<Leader>tt',
  ':let @+ = join(systemlist("echo " .. fnameescape(expand("%"))), "\\n") <CR><cmd>lua vim.notify("Path in clipboard", "info")<CR>',
  { noremap = true, silent = true })
