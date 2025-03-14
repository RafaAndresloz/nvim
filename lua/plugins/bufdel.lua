return {
	"ojroques/nvim-bufdel",
	config = function()
		require("bufdel").setup({
			next = "cycle", -- Cambia al siguiente buffer automáticamente
			quit = true, -- Cierra la ventana si es el último buffer
		})
	end,
}
