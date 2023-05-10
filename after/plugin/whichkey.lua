local wk = require("which-key")

wk.register({
  a = "Add to harpoon",
  d = "Deleting to void register",
  h = "No highlighting",
  f = {
    name = "Telescope",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    F = { "<cmd>Telescope git_files<cr>", "Git files" },
    g = { "<cmd>Telescope live_grep<cr>", "Search word" },
    G = { "<cmd>Telescope grep_string<cr>", "Search current word" },
    b = { "<cmd>Telescope buffers<cr>", "Search current word" },
    h = { "<cmd>Telescope oldfiles<cr>", "Recent files (history)" },
  },
  j = { "<cmd>cprev<cr>zz", "(Quicklist) Previous"},
  k = { "<cmd>cnext<cr>zz", "(Quicklist) Next"},
  p = {
    p = "Paste without yanking",
    v = { "<cmd>Ex<cr>", "netrw" },
  },
  s = "Replace current word",
  u = "Undotree",
  y = "Copy in OS yank",
}, { prefix = "<leader>" })

wk.register(mappings, opts)
