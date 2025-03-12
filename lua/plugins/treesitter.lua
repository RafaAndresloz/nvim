return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate", -- Actualiza los parsers automáticamente después de instalar
		event = { "BufReadPost", "BufNewFile" }, -- Carga sólo cuando abras un archivo
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects", -- TextObjects
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { -- Idiomas que quieres soportar
					"lua",
					"javascript",
					"typescript",
					"tsx",
					"python",
					"html",
					"css",
					"java",
					"json",
					"bash",
					"markdown",
				},
				sync_install = false, -- Instala parsers en segundo plano
				highlight = {
					enable = true, -- Activa resaltado de sintaxis
					additional_vim_regex_highlighting = false, -- Mejora rendimiento
				},
				indent = {
					enable = true, -- Activa indentación basada en el árbol de sintaxis
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn", -- Inicia selección incremental
						node_incremental = "grn", -- Incrementa al siguiente nodo
						node_decremental = "grm", -- Reduce al nodo previo
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Mueve el cursor automáticamente al TextObject
						keymaps = {
							["af"] = "@function.outer", -- Selecciona una función completa
							["if"] = "@function.inner", -- Selecciona el contenido de la función
							["ac"] = "@class.outer", -- Selecciona una clase completa
							["ic"] = "@class.inner", -- Selecciona el contenido de la clase
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- Añade movimientos al historial de saltos
						goto_next_start = {
							["]m"] = "@function.outer", -- Ir al inicio de la próxima función
							["]]"] = "@class.outer", -- Ir al inicio de la próxima clase
						},
						goto_next_end = {
							["]M"] = "@function.outer", -- Ir al final de la próxima función
							["]["] = "@class.outer", -- Ir al final de la próxima clase
						},
						goto_previous_start = {
							["[m"] = "@function.outer", -- Ir al inicio de la función previa
							["[["] = "@class.outer", -- Ir al inicio de la clase previa
						},
						goto_previous_end = {
							["[M"] = "@function.outer", -- Ir al final de la función previa
							["[]"] = "@class.outer", -- Ir al final de la clase previa
						},
					},
				},
			})
		end,
	},
}
