-- maps

local map = vim.keymap
local opts = { noremap = true, silent = true }

-- Crea el comando y asigna la función al atajo de teclado
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>:w<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>a", opts)

-- quit
map.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

--movimiento mientras escribes
map.set("i", "<C-h>", "<Left>", opts)
map.set("i", "<C-j>", "<Down>", opts)
map.set("i", "<C-K>", "<Up>", opts)
map.set("i", "<C-l>", "<Right>", opts)

--Moviminento entre ventanas
map.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

--redimencionamiento de ventanas
map.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

--comandos de nvimTree

-- Abrir/cerrar el árbol de archivos con <leader>+e
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
-- Abrir el archivo seleccionado con <leader>+a
vim.api.nvim_set_keymap("n", "<leader>a", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
-- NvimTreeFindFile: Mover el cursor en el árbol para resaltar el archivo del buffer actual
vim.api.nvim_set_keymap("n", "<leader>nn", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
-- NvimTreeCollapse: Colapsar el árbol de archivos de manera recursiva
vim.api.nvim_set_keymap("n", "<leader>cc", ":NvimTreeCollapse<CR>", { noremap = true, silent = true })

-- better indenting
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

-- lazy
map.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- tabs
map.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
