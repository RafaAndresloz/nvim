return {
	  "folke/tokyonight.nvim",
	  lazy =  false,
	  priority = 1000,
	  
	  config = function ()
		style = "storm"
		   light_style = "day"
		   transparent = true
		   terminal_colors = true
		  vim.cmd('colorscheme tokyonight')
		end
	 
	}
