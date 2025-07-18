-- return {
--   cmd = { 'solargraph', 'stdio' },
--   settings = {
--     solargraph = {
--       diagnostics = true,
--     },
--   },
--   init_options = { formatting = true },
--   filetypes = { 'ruby' },
--   root_markers = { 'Gemfile', '.git' },
-- }
return {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby', 'eruby' },
  root_markers = { 'Gemfile', '.git' },
  init_options = {
    formatter = 'auto',
  },
}
