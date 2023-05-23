local wk = require("which-key")

wk.register({
  a = "Add to harpoon",
  d = "Deleting to void register",
  e = { "<cmd>Telescope find_files<cr>", "Find File" },
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
  k = "LSP: code action",
  k = "LSP: hover",
  p = {
    p = "Paste without yanking",
    v = { "<cmd>Ex<cr>", "netrw" },
  },
  s = {
    name = "Replace current word",
    s = "Global",
    c = "Global (confirm)",
    ["$"] = {
      name = "To end of file",
      ["$"] = "To end of file",
      c = "To end of file (confirm)",
    },
  },
  t = {
    t = "Copy relative path"
  },
  u = "Undotree",
  v = {
    name = "LSP",
    a = "Code action",
    d = "Open float",
    k = "Hover definition",
    r = "Rename",
    R = "References",
    w = {
      name = "Workspace",
      s = "Workspace symbol"
    },
  },
  x = 'Close current buffer',
  y = "Copy in OS yank",
}, { prefix = "<leader>" })

wk.register(mappings, opts)
