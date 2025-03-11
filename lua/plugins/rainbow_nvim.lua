return {
	{
		"p00f/nvim-ts-rainbow",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				rainbow = {
					enable = false,
					extended_mode = true, -- También colorea etiquetas como <div> y </div>
					max_file_lines = nil, -- No hay límite de líneas para habilitar
					colors = {
						"#F08080", -- Rojo claro para el primer nivel
						"#98FB98", -- Verde claro para el segundo nivel
						"#ADD8E6", -- Azul claro para el tercer nivel
						"#FFFF00", -- Amarillo para el cuarto nivel
						"#DCDCDC", -- Gris claro para el quinto nivel
					},
				},
			})
		end,
	},
}
