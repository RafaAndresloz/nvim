-- Configuración General
vim.g.mapleader = " " -- Configura la tecla líder como "Espacio"

local opts = { noremap = true, silent = true }

-- Salir de modo insertar
vim.keymap.set("i", "<C-e>", "<Esc>", opts)

-- Explorador de Archivos (nvim-tree)
vim.keymap.set(
	"n",
	"<leader>e",
	":NvimTreeToggle<CR>",
	{ noremap = true, silent = true, desc = "Abrir/cerrar NvimTree" }
)

-- Navegación entre Ventanas
vim.keymap.set("n", "<C-h>", "<C-w>h", opts) -- Moverse a la ventana izquierda
vim.keymap.set("n", "<C-j>", "<C-w>j", opts) -- Moverse a la ventana inferior
vim.keymap.set("n", "<C-k>", "<C-w>k", opts) -- Moverse a la ventana superior
vim.keymap.set("n", "<C-l>", "<C-w>l", opts) -- Moverse a la ventana derecha

-- Navegación entre ventanas
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Navegación entre buffers
vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- Cerrar buffers
vim.api.nvim_set_keymap("n", "<leader>bd", ":Bdelete<CR>", { noremap = true, silent = true })

-- Dividir horizontalmente
vim.api.nvim_set_keymap("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true })

-- Dividir verticalmente
vim.api.nvim_set_keymap("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true })

-- Comentarios (Comment.nvim)
vim.keymap.set(
	"n",
	"<leader>/",
	':lua require("Comment.api").toggle.linewise.current()<CR>',
	{ desc = "Comentar línea" }
)
vim.keymap.set(
	"v",
	"<leader>/",
	':lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
	{ desc = "Comentar selección" }
)

-- Resaltado y Búsqueda
vim.keymap.set("n", "<leader>hl", ":noh<CR>", opts) -- Limpiar resaltados después de una búsqueda

-- Movimiento en Texto
vim.keymap.set("v", "<", "<gv", opts) -- Disminuir indentación y mantener selección
vim.keymap.set("v", ">", ">gv", opts) -- Aumentar indentación y mantener selección

-- Permitir movimiento con Ctrl + hjkl en Modo Insert
vim.keymap.set("i", "<C-h>", "<Left>", opts) -- Mover a la izquierda
vim.keymap.set("i", "<C-l>", "<Right>", opts) -- Mover a la derecha
vim.keymap.set("i", "<C-j>", "<Down>", opts) -- Mover hacia abajo
vim.keymap.set("i", "<C-k>", "<Up>", opts) -- Mover hacia arriba

-- LSP (Lenguajes y Funciones)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Ir a la definición" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Mostrar información flotante" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renombrar símbolo" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Acción de código" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Mostrar diagnóstico flotante" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Ir al diagnóstico anterior" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Ir al siguiente diagnóstico" })

-- Quickfix y Loclist
vim.keymap.set("n", "[q", ":cprev<CR>", opts) -- Ir al error anterior en Quickfix
vim.keymap.set("n", "]q", ":cnext<CR>", opts) -- Ir al siguiente error en Quickfix
vim.keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "Abrir Quickfix" })
vim.keymap.set("n", "<leader>qc", ":cclose<CR>", { desc = "Cerrar Quickfix" })

-- Guardar y Salir
vim.keymap.set("n", "<C-s>", ":w<CR>", opts) -- Guardar archivo
--vim.keymap.set("n", "<C-q>", ":qa!<CR>", { noremap = true, silent = true, desc = "Guardar y salir forzando" })
vim.api.nvim_set_keymap("n", "<C-q>", ":Bdelete<CR>", { noremap = true, silent = true })

-- Terminal Flotante (toggleterm + Lazygit)
vim.keymap.set("n", "<leader>gg", function()
	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
	lazygit:toggle()
end, { desc = "Abrir Lazygit en terminal flotante" })

-- Salir del modo TERMINAL con Esc
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Salir del modo Terminal" })

-- Selector de Tema
vim.keymap.set("n", "<leader>st", function()
	require("theme_picker").select_theme()
end, { desc = "Seleccionar Tema" })

--Descartar mensajes (Noice)
vim.keymap.set("n", "<leader>q", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

-- Función para crear un nuevo archivo en la ruta del archivo actual
local function crear_archivo()
	-- Obtener la ruta completa del archivo actual en el buffer
	local current_file = vim.fn.expand("%:p")
	if current_file == "" then
		print("No hay un archivo asociado al buffer actual.")
		return
	end

	-- Extraer solo el directorio del archivo actual
	local current_dir = vim.fn.fnamemodify(current_file, ":h")

	-- Solicitar el nombre del nuevo archivo
	local nuevo_nombre = vim.fn.input("Nombre del nuevo archivo: ")

	-- Verificar si se ingresó un nombre válido
	if nuevo_nombre == "" then
		print("Operación cancelada.")
		return
	end

	-- Crear la ruta completa del nuevo archivo
	local nuevo_archivo = current_dir .. "/" .. nuevo_nombre

	-- Crear el archivo vacío usando Lua
	local file = io.open(nuevo_archivo, "w") -- Modo "w" crea un archivo vacío si no existe
	if file then
		file:close() -- Cierra el archivo después de crearlo
		print("Archivo creado: " .. nuevo_archivo)
	else
		print("Error al crear el archivo: " .. nuevo_archivo)
	end
end

-- Asignar una combinación de teclas para invocar la función
vim.keymap.set("n", "<leader>nf", crear_archivo, { desc = "Crear un nuevo archivo en la ruta actual" })
