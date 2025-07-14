-- Enabled LSPs (@see lsp/)

vim.lsp.enable('luals')
vim.lsp.enable('ruby')


-- Completion & format on save
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
    end
    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    -- DISABLED : completion was inline :(
    -- if client:supports_method('textDocument/completion') then
    --   -- Optional: trigger autocompletion on EVERY keypress. May be slow!
    --   -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
    --   -- client.server_capabilities.completionProvider.triggerCharacters = chars
    --   vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    -- end
    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

-- lsp g* commands
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition,
      { buffer = ev.buf, desc = "Go to definition (LSP)" })

    vim.keymap.set('n', 'gv', function()
      local pos = vim.api.nvim_win_get_cursor(0)
      local word = vim.fn.expand('<cword>')
      local current_buf = vim.api.nvim_get_current_buf()

      -- Va dans la fenêtre de droite
      vim.cmd('wincmd l')

      -- Charge le buffer source dans la fenêtre de droite si besoin
      if vim.api.nvim_get_current_buf() ~= current_buf then
        vim.api.nvim_win_set_buf(0, current_buf)
      end

      -- Replace le curseur sur le mot initial
      vim.api.nvim_win_set_cursor(0, pos)

      -- Appelle la définition LSP
      vim.lsp.buf.definition()
    end, { noremap = true, silent = true })

    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action,
      { buffer = ev.buf, desc = "Code actions (LSP)" })
    vim.keymap.set('n', 'gr', vim.lsp.buf.rename,
      { buffer = ev.buf, desc = "Rename (LSP)" })
    vim.keymap.set('n', 'R', vim.lsp.buf.references,
      { buffer = ev.buf, desc = "References (LSP)" })
  end,
})

-- Inline diagnostics
vim.diagnostic.config({ virtual_text = true })
