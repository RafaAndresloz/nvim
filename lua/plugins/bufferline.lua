return {
	-- Bufferline para gestión de pestañas
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons", "DaikyXendo/nvim-material-icon"},
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers", -- Modo de buffers
					numbers = "none", -- Sin números en las pestañas
					diagnostics = "nvim_lsp", -- Mostrar diagnósticos de LSP
					diagnostics_indicator = function(count, level, _, _)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,
					show_close_icon = false, -- Ocultar el ícono de cierre global
					separator_style = "thin", -- Línea fina para separar los buffers
					always_show_bufferline = true, -- Siempre mostrar el bufferline
					offsets = {
						{
							filetype = "NvimTree", -- Detecta el nvim-tree
							text = "Explorador de Archivos", -- Texto sobre el offset
							text_align = "center", -- Centra el texto en el offset
							separator = true, -- Separador visual entre bufferline y nvim-tree
						},
					},
					close_command = function(bufnum)
						require("bufdelete").bufdelete(bufnum, true) -- Cierra el buffer sin cerrar la ventana
					end,
					right_mouse_command = "vert sbuffer %d", -- Opcional: comando clic derecho
				},
				highlights = {
					buffer_selected = {
						guifg = "#FFFFFF", -- Texto blanco para buffer seleccionado
						guibg = "#3b4252", -- Fondo oscuro para buffer seleccionado
						gui = "bold", -- Negrita para destacar buffer activo
					},
					diagnostic = {
						guifg = "#FF0000", -- Diagnóstico en rojo en buffers inactivos
					},
					diagnostic_selected = {
						guifg = "#FF0000", -- Diagnóstico en rojo para buffer seleccionado
						gui = "bold,underline", -- Negrita y subrayado
					},
					separator = {
						guifg = "#282c34", -- Color del separador en buffers inactivos
						guibg = "#282c34",
					},
					separator_selected = {
						guifg = "#282c34", -- Separador para buffer seleccionado
						guibg = "#282c34",
					},
					error = {
						guifg = "#FF0000", -- Resalta errores en buffers inactivos
					},
					error_selected = {
						guifg = "#FF0000", -- Resalta errores en buffer seleccionado
					},
				},
			})
		end,
	},

	-- Bufdelete para cerrar buffers sin cerrar ventanas
	{
		"famiu/bufdelete.nvim",
	},

	-- nvim-tree para exploración de archivos
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				view = {
					side = "left", -- Mostrar explorador a la izquierda
				},
			})
		end,
	},

	-- nvim-web-devicons para iconos bonitos
	{ "nvim-tree/nvim-web-devicons" },
}
