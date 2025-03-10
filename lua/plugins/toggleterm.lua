return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<leader>lg]], -- Atajo para abrir el terminal flotante
      direction = "float", -- Terminal flotante
      float_opts = {
        border = "curved", -- Borde estilizado
      },
    })
  end,
}

