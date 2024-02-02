return {
	"nvim-treesitter/nvim-treesitter",

	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"typescript",
				"javascript",
				"python",
				"html",
				"css",
			},
			auto_install = true,
			--			ignore_install = { "javascript", "typescript" },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
