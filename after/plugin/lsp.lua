local lsp = require('lsp-zero')

lsp.preset({ "recommended" })

lsp.ensure_installed({
  'eslint',
  'rust_analyzer',
  'tsserver',
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
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

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


lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>vk", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vR", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  vim.keymap.set('n', '<leader>w', function()
    local params = vim.lsp.util.make_formatting_params({})
    local handler = function(err, result)
      if not result then return end

      vim.lsp.buf.format()
      -- Todo: move that to eslint's own on_attach fn
      vim.cmd.EslintFixAll()
      vim.cmd('write')
    end

    client.request('textDocument/formatting', params, handler, bufnr)
  end, { buffer = bufnr })
end)

lsp.setup()
