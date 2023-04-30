local wk = require("which-key")

wk.register({
  a = "Add to harpoon",
  d = "Deleting to void register",
  h = "No highlighting",
  f = {
    name = "Telescope",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
  },
  s = "Replace current word",
  u = "Undotree",
  y = "Copy in OS yank",
}, { prefix = "<leader>" })

wk.register(mappings, opts)
