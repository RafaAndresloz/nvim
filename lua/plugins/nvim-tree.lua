return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons", "DaikyXendo/nvim-material-icon" },
		config = function()
			require("nvim-tree").setup({
				sort_by = "name", -- Ordenar archivos por nombre
				view = {
					width = 30, -- Anchura del panel
					side = "left", -- Mostrar el árbol en el lado izquierdo
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
						git = {
							unstaged = "✗",
							staged = "✓",
							untracked = "★",
							renamed = "➜",
							deleted = "",
							ignored = "◌",
						},
					},
				},
				filters = {
					dotfiles = true, -- Mostrar u ocultar archivos ocultos
				},
				-- Nuevo método para personalizar mapeos
				on_attach = function(bufnr)
					local api = require("nvim-tree.api")
					local opts = { noremap = true, silent = true, buffer = bufnr }

					-- Personalización de teclas
					vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts) -- Subir un directorio
					vim.keymap.set("n", "r", api.fs.rename, opts) -- Renombrar archivo
					vim.keymap.set("n", "d", api.fs.remove, opts) -- Eliminar archivo
					vim.keymap.set("n", "<CR>", api.node.open.edit, opts) -- Abrir archivo o carpeta
				end,
			})
		end,
	},
}
