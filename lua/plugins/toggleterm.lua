return {

	"akinsho/toggleterm.nvim",
	version = "*",

	config = function()
		require("toggleterm").setup({
			size = 20, -- Tamaño de la terminal flotante
			open_mapping = [[<Leader>t]], -- Mapeo para abrir la terminal
			hide_numbers = true, -- Ocultar números en las terminales
			direction = "horizontal", -- Dirección de la terminal flotante (horizontal)
			shell = vim.o.shell, -- Shell que se utilizará en la terminal
			float_opts = {
				border = "single", -- Borde de la terminal flotante
				highlights = {
					border = "Normal", -- Color del borde
					background = "Normal", -- Color de fondo
				},
			},
			-- Otras opciones de configuración según tus preferencias
		})
	end,
}
