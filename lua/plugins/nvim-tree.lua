return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Opcional para iconos bonitos
    config = function()
      require("nvim-tree").setup({
  sort_by = "name", -- Ordenar archivos por nombre
  view = {
    width = 30, -- Anchura del panel
    side = "left", -- Mostrar el árbol en el lado izquierdo
    mappings = {
      list = {
        { key = "u", action = "dir_up" }, -- Subir un directorio
      },
    },
  },
  renderer = {
    group_empty = true, -- Agrupar carpetas vacías
    highlight_git = true, -- Resaltar cambios de Git
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  filters = {
    dotfiles = true, -- Mostrar u ocultar archivos ocultos
  },
})

    end,
  },
}

