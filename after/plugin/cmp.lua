local cmp = require("cmp")

-- Ne rien insérer tant qu’on n’a pas validé
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }

cmp.setup({
  window = {
    -- === menu de complétion (sans bordure) =========================
    completion = {
      border     = "none", -- style natif
      max_width  = 60,     -- 60 colonnes max
      max_height = 8,      -- idem pumheight
    },

    -- === fenêtre de documentation =================================
    documentation = {
      border     = "none",
      max_width  = 72, -- ajuste si besoin
      max_height = 15,
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- menu = détail / chemin ; on le raccourcit
      local menu = entry.completion_item.detail or ""
      if #menu > 35 then -- limite arbitraire
        menu = menu:sub(1, 32) .. "…"
      end
      vim_item.menu = menu
      return vim_item
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- ── Navigation ────────────────────────────────
    ["<Tab>"]   = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-j>"]   = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-k>"]   = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    -- ── Validation / Fermeture ────────────────────
    ["<CR>"]    = cmp.mapping.confirm({ select = false }), -- Valide l’item choisi
    ["<Esc>"]   = cmp.mapping.abort(),                     -- Ferme le menu
  }),                                                      -- ← on referme preset.insert() puis la clé `mapping`

  sources = {
    { name = "nvim_lsp" }, -- seule source indispensable
  },
})
