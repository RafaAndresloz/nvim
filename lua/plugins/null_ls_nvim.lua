return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.phpcsfixer,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.google_java_format,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.diagnostics.flake8,
			},
			on_attach = function(client, bufnr)
				if not bufnr or bufnr == 0 or not vim.api.nvim_buf_is_loaded(bufnr) then
					return
				end

				local opts = { noremap = true, silent = true }
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-f>", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
			end,
		})
	end,
}
