return {
  {
    "sphamba/smear-cursor.nvim",
    lazy = false, -- ← esto fuerza la carga inmediata
    config = function()
      require("smear_cursor").setup({
        smear_between_buffers = true,
        smear_between_neighbor_lines = true,
        scroll_buffer_space = true,
        legacy_computing_symbols_support = false,
        smear_insert_mode = true,
      })
    end,
  },
  {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
  },
},
}

