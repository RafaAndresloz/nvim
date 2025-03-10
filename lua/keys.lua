vim.g.mapleader = " " -- Configura la tecla líder como "Espacio"

vim.g.mapleader = " " -- Configura la tecla líder como "Espacio"

local key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Intenta cargar el módulo de nvim-tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Abrir/cerrar NvimTree' }) -- Abrir/ cerrar árbol
local ok, api = pcall(require, 'nvim-tree.api')
if ok then
  -- **NvimTree (Explorador de Archivos)**
  vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Abrir/cerrar NvimTree' }) -- Abrir/ cerrar árbol
  vim.keymap.set('n', '<leader>nf', ':lua require("nvim-tree.api").fs.create()<CR>', { desc = "Nuevo archivo/carpeta" })
  vim.keymap.set('n', '<leader>nr', ':lua require("nvim-tree.api").fs.rename()<CR>', { desc = "Renombrar archivo/carpeta" })
  vim.keymap.set('n', '<leader>np', ':lua require("nvim-tree.api").fs.rename_sub()<CR>', { desc = "Mover archivo/carpeta" })
  vim.keymap.set('n', '<leader>nd', ':lua require("nvim-tree.api").fs.remove()<CR>', { desc = "Eliminar archivo/carpeta" })
  vim.keymap.set('n', '<leader>nt', ':NvimTreeRefresh<CR>', { desc = "Recargar árbol" })
end

-- **1. Navegación entre Ventanas**
key('n', '<C-h>', '<C-w>h', opts) -- Moverse a la ventana izquierda
key('n', '<C-j>', '<C-w>j', opts) -- Moverse a la ventana inferior
key('n', '<C-k>', '<C-w>k', opts) -- Moverse a la ventana superior
key('n', '<C-l>', '<C-w>l', opts) -- Moverse a la ventana derecha

-- **2. Gestión de Buffers**
key('n', '<leader>bd', ':bd<CR>', opts) -- Cerrar buffer actual
key('n', '<leader>bn', ':bnext<CR>', opts) -- Cambiar al siguiente buffer
key('n', '<leader>bp', ':bprevious<CR>', opts) -- Cambiar al buffer anterior

-- **5. Comentarios con Comment.nvim**
vim.keymap.set('n', '<leader>/', ':lua require("Comment.api").toggle.linewise.current()<CR>', { desc = 'Comentar línea' })
vim.keymap.set('v', '<leader>/', ':lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { desc = 'Comentar selección' })

-- **6. Resaltado y Búsqueda**
key('n', '<leader>hl', ':noh<CR>', opts) -- Limpiar resaltados después de una búsqueda

-- **7. Movimiento en Texto**
key('v', '<', '<gv', opts) -- Disminuir indentación y mantener selección
key('v', '>', '>gv', opts) -- Aumentar indentación y mantener selección

-- **8. Neovim LSP (Lenguajes y Funciones)**
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Ir a la definición' }) -- Ir a definición
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Mostrar información flotante' }) -- Mostrar información flotante
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Renombrar símbolo' }) -- Renombrar
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Acción de código' }) -- Acción de código
vim.keymap.set('n', '<leader>dl', vim.diagnostic.open_float, { desc = 'Mostrar diagnóstico flotante' }) -- Diagnósticos flotantes
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Ir al diagnóstico anterior' }) -- Diagnóstico anterior
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Ir al siguiente diagnóstico' }) -- Siguiente diagnóstico

-- -- **9. Terminal**
-- vim.keymap.set('n', '<leader>tt', ':term<CR>', { desc = 'Abrir terminal' })
-- vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Salir del modo terminal' })




-- **10. Quickfix y Loclist**
key('n', '[q', ':cprev<CR>', opts) -- Ir al error anterior en Quickfix
key('n', ']q', ':cnext<CR>', opts) -- Ir al siguiente error en Quickfix
vim.keymap.set('n', '<leader>qo', ':copen<CR>', { desc = 'Abrir Quickfix' }) -- Abrir Quickfix
vim.keymap.set('n', '<leader>qc', ':cclose<CR>', { desc = 'Cerrar Quickfix' }) -- Cerrar Quickfix

-- **11. Guardar y Salir**
key('n', '<leader>w', ':w<CR>', opts) -- Guardar archivo
key('n', '<leader>q', ':q<CR>', opts) -- Cerrar Neovim
key('n', '<leader>wq', ':wq<CR>', opts) -- Guardar y salir
key('n', '<leader>x', ':x<CR>', opts) -- Guardar y salir (equivalente a wq)

vim.keymap.set('n', '<leader>/', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', { desc = "Comentar línea" })
vim.keymap.set('v', '<leader>/', '<cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { desc = "Comentar selección" })

-- Mapeo para abrir Lazygit
vim.keymap.set("n", "<leader>gg", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
  lazygit:toggle()
end, { desc = "Abrir Lazygit en terminal flotante" })

-- Salir del modo TERMINAL con Esc
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Salir del modo Terminal" })

vim.keymap.set("n","<leader>q","<cmd>NoiceDismiss<CR>",{desc = "Dismiss Noice Message"})

-- THEME SELECTOR
vim.keymap.set("n", "<leader>st", function()
  require("theme_picker").select_theme()
end, { desc = "Seleccionar Tema" })




