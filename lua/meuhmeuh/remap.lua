-- What else?
vim.keymap.set("i", "jk", "<Esc>")

-- Clear highlights with Esc in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Paste without yanking newly selected line
vim.keymap.set("x", "<leader>pp", "\"_dP")

vim.keymap.set("n", "<leader>w", ":w<CR>")

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

-- In visual mode, (un)indent without losing selection
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("v", "<Tab>", ">gv")

-- Deleting to void register
vim.keymap.set("v", "<leader>d", "\"_d")

-- Handy delete/replace functions that do not yank
vim.keymap.set("n", "S", "\"_ciw") -- Originally deleting the whole line
vim.keymap.set("n", "D", "\"_diw") -- Originally deleting rest of the line

-- Disabling Q
vim.keymap.set("n", "Q", "<nop>")

-- When using _, ensuring that editor's left side is at char 0
vim.keymap.set("n", "_", "0_")

-- Vim Quicklist
vim.keymap.set("n", "<leader>qj", "<cmd>cnext<CR>zz", { desc = "Quickfix: next" })
vim.keymap.set("n", "<leader>qk", "<cmd>cprev<CR>zz", { desc = "Quickfix: previous" })

-- Location list
vim.keymap.set("n", "<leader>lj", "<cmd>lnext<CR>zz", { desc = "Location: next" })
vim.keymap.set("n", "<leader>lk", "<cmd>lprev<CR>zz", { desc = "Location: previous" })

vim.keymap.set("n", "<leader>qq", function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd "cclose"
    return
  else
    vim.cmd "copen"
  end
end)

-- Easy replace
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


vim.keymap.set(
  'x',
  '<leader>ss',
  [["zy:%s/<C-r>z//gI<Left><Left><Left>]],
  { noremap = true }
)
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
vim.keymap.set("n", "<C-S-h>", "<cmd>:BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<C-S-l>", "<cmd>:BufferLineCycleNext<CR>")
vim.keymap.set("n", "<C-f>", "<cmd>:BufferLineMovePrev<CR>")
vim.keymap.set("n", "<C-g>", "<cmd>:BufferLineMoveNext<CR>")

-- Moving in between windows opened with vs/sp
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })


-- Copy relative path of current buffer
vim.api.nvim_set_keymap('n', '<Leader>tt',
  ':let @+ = join(systemlist("echo " .. fnameescape(expand("%"))), "\\n") <CR><cmd>lua vim.notify("Path in clipboard", "info")<CR>',
  { noremap = true, silent = true })

vim.keymap.set("n", "<leader>z", "<cmd>:ZenMode<CR>")
