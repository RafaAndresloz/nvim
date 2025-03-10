return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Para iconos bonitos
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox", -- Cambia esto por el tema de tu elección
          section_separators = '', -- Quita los separadores
          component_separators = '', -- Sin separadores de componentes
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}

