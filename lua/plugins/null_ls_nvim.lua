return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Carga el plugin al abrir o crear un archivo
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formateadores para cada lenguaje
        null_ls.builtins.formatting.black,       -- Python
        null_ls.builtins.formatting.phpcsfixer,  -- PHP
        null_ls.builtins.formatting.prettier,    -- JavaScript, TypeScript, HTML, CSS
        null_ls.builtins.formatting.google_java_format, -- Java
        null_ls.builtins.formatting.stylua,      -- Lua

        -- Linters opcionales
        null_ls.builtins.diagnostics.eslint,     -- JS/TS linting
        null_ls.builtins.diagnostics.flake8,     -- Python linting
      },
      on_attach = function(client, bufnr)
        -- Validar que bufnr sea válido
        if not bufnr or bufnr == 0 or not vim.api.nvim_buf_is_loaded(bufnr) then
          return -- Salir si el buffer no es válido
        end

        -- Configuración de atajos
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-f>", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

        -- Activar formato automático al guardar
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("LspFormat", { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end,
    })
  end,
}

