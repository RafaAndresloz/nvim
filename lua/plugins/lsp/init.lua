return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim", -- Plugin requerido
    dependencies = { "neovim/nvim-lspconfig" }, -- Dependencia necesaria
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { 
        "pyright",        -- Python
        "ts_ls",          -- TypeScript/JavaScript
        "lua_ls",         -- Lua
        "cssls",          -- CSS
        "html",           -- HTML
        "intelephense",   -- PHP
        "jdtls",          -- Java
        "tailwindcss",    
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig", -- LSPConfig para configurar servidores
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
    end,
  },
}

