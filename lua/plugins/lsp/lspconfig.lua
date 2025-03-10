return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities() -- Habilita capacidades de autocompletado

    -- Función común para `on_attach`
    local on_attach = function(client, bufnr)
      -- Opciones comunes para los atajos
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Define las teclas específicas del LSP
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>dl', vim.diagnostic.open_float, opts)
    end

    -- CSS
    lspconfig.cssls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- HTML
    lspconfig.html.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- PHP (Intelephense)
    lspconfig.intelephense.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Java (jdtls)
    lspconfig.jdtls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Lua
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }, -- Indica que `vim` es una global reconocida por el servidor LSP
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true), -- Carga bibliotecas del runtime de Neovim
            checkThirdParty = false, -- Opcional: evita advertencias de plugins externos
          },
          telemetry = {
            enable = false, -- Desactiva la telemetría
          },
        },
      },
    })

    -- Python
    lspconfig.pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "strict",
          },
        },
      },
    })

    -- TailwindCSS
    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- TypeScript/JavaScript
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}

