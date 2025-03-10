return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- Carga al entrar en el modo INSERT
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true, -- Habilitar integración con Treesitter para detección más inteligente
      ts_config = {
        lua = { "string", "source" }, -- No agregar pares dentro de strings o código fuente en Lua
        javascript = { "string", "template_string" }, -- Similar para JavaScript
        java = false, -- Deshabilitar completamente para Java
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" }, -- Evitar conflictos en ciertos tipos de archivo
      fast_wrap = {
        map = "<M-e>", -- Mapea Alt + e para usar envolturas rápidas
        chars = { "{", "[", "(", '"', "'" }, -- Caracteres que se pueden envolver
        pattern = string.gsub([[ [%'%"%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Ajusta el cursor fuera del par
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl", -- Teclas rápidas
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    })

    -- Integración con nvim-cmp (autocompletado)
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}

