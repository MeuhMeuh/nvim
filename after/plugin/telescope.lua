local telescope = require('telescope')
local fb_actions = require "telescope".extensions.file_browser.actions
local builtin = require('telescope.builtin')

local dropdown = require('telescope.themes').get_dropdown()

vim.keymap.set('n', '<leader>ff', ':Telescope find_files theme=dropdown layout_config={width=0.8}  <CR>', {})
vim.keymap.set('n', '<leader>e', ':Telescope find_files theme=dropdown layout_config={width=0.8}<CR>', {})
vim.keymap.set('n', '<leader>fg', ':Telescope git_files theme=dropdown layout_config={width=0.8}<CR>', {})
vim.keymap.set('n', '<leader>fw', ':Telescope live_grep theme=dropdown layout_config={width=0.8}<CR>', {})
vim.keymap.set('n', '<leader>fW', ':Telescope grep_string theme=dropdown layout_config={width=0.8}<CR>', {})
vim.keymap.set('n', '<leader>fb', ':Telescope buffers theme=dropdown layout_config={width=0.8}<CR>', {})
vim.keymap.set('n', '<leader>fh', ':Telescope oldfiles theme=dropdown layout_config={width=0.8}<CR>', {})
vim.keymap.set('n', '<leader>f<leader>', ':Telescope resume theme=dropdown layout_config={width=0.8}<CR>', {})
vim.keymap.set('n', '<leader>pv', ':Telescope file_browser theme=dropdown layout_config={width=0.8} path=%:p:h select_buffer=true<CR>')

telescope.setup {
  defaults = {
    initial_mode = "normal",
    file_ignore_patterns = {".git/.*"},
    theme = dropdown
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    old_files = {
      hidden = true,
    },
    live_grep = {
      additional_args = function(opts)
        return { "--hidden" }
      end,
      initial_mode = "insert",
    },
    grep_string = {
      hidden = true,
      initial_mode = "insert",
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
          ["D"] = fb_actions.remove,
          ["%"] = fb_actions.create,
          ["y"] = fb_actions.copy,
          ["h"] = fb_actions.goto_parent_dir,
          ["l"] = require("telescope.actions").select_default,
        },
      },
    },
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
  },
}
telescope.load_extension "file_browser"
telescope.load_extension "file_browser"
telescope.load_extension "fzf"
