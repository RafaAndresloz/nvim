return {
  "numToStr/Comment.nvim",
  event = "VeryLazy", -- Carga diferida
  config = function()
    -- Configuración básica de Comment.nvim
    require("Comment").setup({})

    -- Configuración de atajos de teclado para comentar líneas y bloques
    vim.keymap.set('n', '<leader>/', function()
      require("Comment.api").toggle.linewise.current()
    end, { desc = "Comentar línea" })

    vim.keymap.set('x', '<leader>/', function()
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end, { desc = "Comentar selección" })

    vim.keymap.set('n', '<leader>b', function()
      require("Comment.api").toggle.blockwise.current()
    end, { desc = "Comentar bloque" })

    vim.keymap.set('x', '<leader>b', function()
      require("Comment.api").toggle.blockwise(vim.fn.visualmode())
    end, { desc = "Comentar selección en bloque" })
  end,
}

