return{
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPost",
  config = function()
    require("colorizer").setup({
      user_default_options = {
        names = false,       -- No resaltar nombres de colores (e.g., "red", "blue")
        RRGGBBAA = true,     -- Soporta colores en formato #RRGGBBAA
        rgb_fn = true,       -- Soporta rgb(), rgba() y hsl()
        css = true,          -- Activa para archivos CSS
        css_fn = true,       -- Permite resaltar en funciones CSS como rgba()
        tailwind = true,     -- Compatible con Tailwind CSS
      },
    })
  end,
}

