local lsp = require('lsp-zero')

lsp.preset({ "recommended" })

lsp.ensure_installed({
  'eslint',
  'rust_analyzer',
  'tsserver',
  'solargraph',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    },
  }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-p>'] = cmp.mapping.scroll_docs(-4),
  ['<C-n>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
})

-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- Remove yaml key ordering warning
lsp.configure('yamlls', {
  settings = {
    yaml = {
      keyOrdering = false,
    },
  }
})

lsp.configure('eslint', {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end
})

-- lsp.format_on_save({
--   format_opts = {
--     async = false,
--     timeout_ms = 10000,
--   },
--   servers = {
--     ['vscode-eslint-language-server'] = { 'javascript', 'typescript', 'typescriptreact' },
--     -- ['typescript-language-server'] = { 'typescript', 'typescriptreact' },
--     ['lua-language-server'] = { 'lua' },
--     ['rust_analyzer'] = { 'rust' },
--   }
-- })

-- lsp.configure('rust_analyzer', {
--   assist = {
--     importEnforceGranularity = true,
--     importPrefix = 'crate',
--   },
--   cargo = {
--     allFeatures = true,
--   },
--   checkOnSave = {
--     command = 'clippy',
--   },
--   inlayHints = { locationLinks = false },
--   diagnostics = {
--     enable = true,
--     experimental = {
--       enable = true,
--     },
--   },
-- })


lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>vk", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>j", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "R", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vR", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("v", "<leader>vR", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  -- vim.keymap.set('n', '<leader>w', function()
  --   local params = vim.lsp.util.make_formatting_params({})
  --   local handler = function(err, result)
  --     if not result then return end
  --
  --     vim.lsp.buf.format()
  --     -- Todo: move that to eslint's own on_attach fn
  --     -- vim.cmd.EslintFixAll()
  --     -- vim.api.nvim_echo({ { tostring(vim.fn.exists(':EslintFixAll')), 'None' } }, true, {})
  --     if vim.fn.exists(':EslintFixAll') > 0 then
  --       vim.notify(":EslintFixAll executed", "info")
  --       vim.cmd('EslintFixAll')
  --     else
  --       vim.notify(":EslintFixAll not available", "warning")
  --     end
  --     vim.cmd('write')
  --   end
  --
  --   client.request('textDocument/formatting', params, handler, bufnr)
  -- end, { buffer = bufnr })

  vim.keymap.set('n', '<leader>W', function()
    if vim.fn.exists(':EslintFixAll') > 0 then
      vim.cmd('EslintFixAll')
      vim.notify(":EslintFixAll executed", "info")
    else
      vim.notify(":EslintFixAll not available", "warning")
    end
  end, { buffer = bufnr })
end)

lsp.setup()
