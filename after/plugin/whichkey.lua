local wk = require("which-key")

wk.register({
  a = "Add to harpoon",
  d = "Deleting to void register",
  e = { "<cmd>Telescope find_files<cr>", "Find File" },
  h = "No highlighting",
  f = {
    name = "Telescope",
    e = { "<cmd>Telescope find_files<cr>", "fil(e)" },
    f = { "<cmd>Telescope find_files<cr>", "(f)ile" },
    g = { "<cmd>Telescope git_files<cr>", "(g)it file" },
    w = { "<cmd>Telescope live_grep<cr>", "(w)ord" },
    W = { "<cmd>Telescope grep_string<cr>", "Current (W)ord" },
    b = { "<cmd>Telescope buffers<cr>", "(b)uffer" },
    h = { "<cmd>Telescope oldfiles<cr>", "(h)istory" },
    ["<leader>"] = { "<cmd>Telescope resume<cr>", "resume" },
  },
  j = "LSP: code action",
  k = "LSP: hover",
  p = {
    p = "Paste without yanking",
    -- v = { "<cmd>Ex<cr>", "netrw" },
  },
  q = "Close quicklist",
  s = {
    name = "Replace current word",
    s = "Global",
    c = "Global (confirm)",
    ["$"] = "Line",
    G = {
      name = "To end of file",
      G = "To end of file",
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
  X = 'Close all buffers except current',
  y = "Copy in OS yank",
}, { prefix = "<leader>" })

wk.register(mappings, opts)
