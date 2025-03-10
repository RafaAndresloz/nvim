return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy", -- Carga diferida para optimizar inicio
    config = function()
      local wk = require("which-key")

      -- Tu configuración para which-key
      wk.add({
        { "<leader>f", group = "file" }, -- Grupo "file"
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
        { "<leader>fb", function() print("hello") end, desc = "Foobar" },
        { "<leader>fn", desc = "New File" },
        { "<leader>f1", hidden = true }, -- Ocultar esta tecla
        { "<leader>w", proxy = "<c-w>", group = "windows" }, -- Grupo "windows"
        { "<leader>b", group = "buffers", expand = function()
            return require("which-key.extras").expand.buf()
          end
        },
        {
          -- Mapeos anidados permitidos
          mode = { "n", "v" }, -- NORMAL y VISUAL
          { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
          { "<leader>w", "<cmd>w<cr>", desc = "Write" },
        }
      })
    end,
  }
}

