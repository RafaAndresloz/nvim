return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" }, -- Incluye una colección de snippets
  config = function()
    -- Carga snippets del formato de VS Code (como los de Friendly Snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Si tienes snippets personalizados, agrégalos aquí
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { "~/.config/nvim/snippets/" } -- Ruta donde guardes tus snippets personalizados
    })
  end,
}

