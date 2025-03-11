return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- Configurar Noice para ignorar los mensajes de Mason
    routes = {
      {
        filter = {
          event = "msg_show", -- Filtrar eventos de tipo 'msg_show'
          kind = "", -- No especifica un tipo de mensaje
          find = "Mason", -- Busca cualquier mensaje relacionado con Mason
        },
        opts = { skip = true }, -- Ignorar estos mensajes
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}

