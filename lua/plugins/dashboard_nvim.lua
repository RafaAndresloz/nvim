return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	config = function()
		local logo = [[





   ▄████████  ▄█               ▄███████▄    ▄████████  ▄█    ▄▄▄▄███▄▄▄▄    ▄██████▄
  ███    ███ ███              ███    ███   ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ███    ███
  ███    █▀  ███              ███    ███   ███    ███ ███▌ ███   ███   ███ ███    ███
 ▄███▄▄▄     ███              ███    ███  ▄███▄▄▄▄██▀ ███▌ ███   ███   ███ ███    ███
▀▀███▀▀▀     ███            ▀█████████▀  ▀▀███▀▀▀▀▀   ███▌ ███   ███   ███ ███    ███
  ███    █▄  ███              ███        ▀███████████ ███  ███   ███   ███ ███    ███
  ███    ███ ███▌    ▄        ███          ███    ███ ███  ███   ███   ███ ███    ███
  ██████████ █████▄▄██       ▄████▀        ███    ███ █▀    ▀█   ███   █▀   ▀██████▀
             ▀                             ███    ███





]]

		require("dashboard").setup({
			theme = "doom",
			config = {
				header = vim.split(logo, "\n"),
				center = {
					{ icon = " ", desc = "Find File", action = "Telescope find_files", key = "f" },
					{ icon = " ", desc = "New File", action = "enew", key = "n" },
					{ icon = "⟳ ", desc = "Recent Files", action = "Telescope oldfiles", key = "r" },
					{ icon = " ", desc = "Find Text", action = "Telescope live_grep", key = "t" },
					{
						icon = " ",
						desc = "Find Directory",
						action = function()
							require("telescope.builtin").find_files({
								prompt_title = "Find Directory",
								find_command = { "find", ".", "-type", "d" }, -- Busca solo directorios
								cwd = "~/work/", -- Cambia esta ruta base si lo necesitas
							})
						end,
						key = "p",
					},
					{ icon = "✗ ", desc = "Exit", action = "qa", key = "q" }, -- Acción para salir
				},
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return { "Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
				end,
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
