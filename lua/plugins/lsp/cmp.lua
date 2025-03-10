return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",   -- Fuente para autocompletado basado en LSP
    "hrsh7th/cmp-buffer",     -- Fuente para buffers abiertos
    "hrsh7th/cmp-path",       -- Fuente para rutas de archivos
    "saadparwaiz1/cmp_luasnip", -- Fuente para integrar LuaSnip
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Expande el snippet usando LuaSnip
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(), -- Siguiente opción
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Opción anterior
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar selección
        ["<C-e>"] = cmp.mapping.abort(), -- Cancelar selección
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- Fuente LSP
        { name = "luasnip" },   -- Fuente para snippets
        { name = "buffer" },    -- Fuente para el texto en buffers abiertos
        { name = "path" },      -- Fuente para rutas de archivos
      }),
    })
  end,
}

