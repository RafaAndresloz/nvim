return {
	-- PLUGINS CONFIGURATIONS
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.nvim-tree"),
	require("plugins.which-key"),
	require("plugins.comment-vim"),
	require("plugins.nvim-autopairs"),
	require("plugins.vim-surround"),
	require("plugins.toggleterm"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.vim_multicursor"),
	require("plugins.dashboard_nvim"),
	require("plugins.rainbow_nvim"),
	require("plugins.themes"),
	-- LSP CONFIGS
	require("plugins.lsp.mason"),
	require("plugins.lsp.lspconfig"),
	require("plugins.lsp.cmp"),
	require("plugins.lsp.snippets"),
}
