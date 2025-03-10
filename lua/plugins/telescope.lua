return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Plenary es esencial para Telescope
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      -- Configuración de Telescope
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next", -- Personaliza navegación
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
      })

      -- Atajos de teclado para funciones de Telescope
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fw', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'Telescope buffer fuzzy find' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end,
  },
}

