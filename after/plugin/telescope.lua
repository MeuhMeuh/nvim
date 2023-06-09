local telescope = require('telescope')
local fb_actions = require "telescope".extensions.file_browser.actions
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>e', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>fp', function ()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fW', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>f<leader>', builtin.resume, {})
vim.keymap.set('n', '<leader>pv', ':Telescope file_browser path=%:p:h select_buffer=true<CR>')

telescope.setup {
  defaults = {
    initial_mode = "normal",
  },
  pickers = {
    live_grep = {
      initial_mode = "insert"
    },
    grep_string = {
      initial_mode = "insert"
    },
  },
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["-"] = fb_actions.goto_parent_dir,
          ["H"] = fb_actions.toggle_hidden,
          ["r"] = fb_actions.rename,
          ["d"] = fb_actions.create,
          ["%"] = fb_actions.create,
          ["y"] = fb_actions.copy,
          ["h"] = fb_actions.goto_parent_dir,
          ["l"] = require("telescope.actions").select_default,
        },
      },
    },
  },
}
telescope.load_extension "file_browser"
