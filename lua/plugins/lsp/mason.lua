return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  config = function()
    -- Configuración de Mason
    require("mason").setup()

    -- Configuración de Mason-LSPConfig
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",        -- Python
        "ts_ls",          -- TypeScript/JavaScript (reemplazo de tsserver)
        "lua_ls",         -- Lua
        "cssls",          -- CSS
        "html",           -- HTML
        "intelephense",   -- PHP
        "jdtls",          -- Java
        "tailwindcss",    -- TailwindCSS
      },
      automatic_installation = true, -- Instalar automáticamente los servidores que falten
    })
  end,
}

