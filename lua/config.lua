-- Configuración general del editor
local opt = vim.opt

-- Activar la numeración de líneas
opt.number = true
-- opt.relativenumber = true

-- Activar la copia y pegado con el sistema
opt.clipboard = "unnamedplus"

-- Configuración de tabulación e identación
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Configuración de búsqueda
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Visibilidad y navegación
opt.cursorline = false

opt.wrap = true
opt.scrolloff = 8
opt.mouse = "a"

-- Configuración de interfaz
opt.termguicolors = true -- Habilitar soporte para colores en la terminal
opt.signcolumn = "no" -- Sin columna de signos
-- opt.signcolumn = "yes"
-- opt.colorcolumn = "120"

-- Desactivar archivos de backup y swap
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Tiempo de espera para mapeos
opt.timeoutlen = 500

-- -- -- Configuración para íconos con colores
-- -- require("nvim-web-devicons").setup({
-- -- 	override = {},
-- -- 	color_icons = true, -- Activar colores de íconos
-- -- 	default = true,
-- -- })
-- --
-- -- -- Establecer fondo oscuro y habilitar colores en terminal
-- -- vim.opt.background = "dark"
-- -- vim.opt.termguicolors = true
-- --
-- -- -- Configuración de grupos de resaltado con fondo transparente
-- -- vim.cmd([[
-- --   " Fondo completamente transparente
-- --   highlight Normal guifg=#d1c4e9 guibg=NONE
-- --   highlight NormalFloat guifg=#d1c4e9 guibg=NONE
-- --   highlight EndOfBuffer guifg=#593646 guibg=NONE
-- --
-- --   " Comentarios
-- --   highlight Comment guifg=#a996c4 gui=italic
-- --
-- --   " Palabras clave y funciones
-- --   highlight Keyword guifg=#ff80ab gui=bold
-- --   highlight Function guifg=#82b1ff gui=bold
-- --
-- --   " Números de línea
-- --   highlight LineNr guifg=#8796b0 guibg=NONE
-- --
-- --   " Resaltado visual
-- --   highlight CursorLine guibg=NONE                " Transparente para línea actual
-- --   highlight Visual guibg=#6C445A                " Fondo lavanda oscuro para selección
-- --
-- --   " Separadores y barra de estado
-- --   highlight VertSplit guifg=#6C445A guibg=NONE  " Separadores en tonos vinotinto
-- --   highlight StatusLine guifg=#ffffff guibg=NONE gui=bold " Barra de estado transparente
-- --
-- --   " Diagnóstico (errores, advertencias, etc.)
-- --   highlight DiagnosticError guifg=#ff5252
-- --   highlight DiagnosticWarning guifg=#ffc107
-- --   highlight DiagnosticInfo guifg=#29b6f6
-- --   highlight DiagnosticHint guifg=#ba68c8
--
--   " Resaltado de pares
--   highlight MatchParen guifg=#ff4081 guibg=NONE gui=bold
-- ]])
