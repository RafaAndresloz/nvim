-- maps

local map = vim.keymap
local opts = { noremap = true, silent = true }

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

--autormat on save
--vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
--formateado
--vim.keymap.set("n", "<C-s>", "<cmd>vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })

