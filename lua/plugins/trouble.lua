return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Requiere íconos
	config = function()
		require("trouble").setup({
			position = "bottom", -- posición de la ventana
			height = 10, -- altura de la ventana
			auto_open = true, -- abrir automáticamente si hay diagnósticos
			auto_close = false, -- no cerrar automáticamente
			auto_preview = false, -- desactiva vista previa automática
			icons = true, -- muestra íconos para los diagnósticos
			indent_guides = true, -- guías de indentación
			use_diagnostic_signs = true, -- usar signos del sistema de diagnósticos
		})

		-- Abrir Trouble automáticamente al iniciar Neovim con diagnósticos del workspace
		vim.defer_fn(function()
			vim.cmd("TroubleToggle workspace_diagnostics")
		end, 100) -- Pequeño retraso para asegurar que LSP ya haya cargado
	end,
	keys = {
		{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Alternar Trouble" },
		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Diagnósticos del workspace" },
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Diagnósticos del documento" },
		{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Lista de ubicaciones" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix" },
	},
}
