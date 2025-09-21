require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


map("i", "<C-s>", "<Esc><cmd> w <cr>", { desc = "Save and exit insert mode" })
map({ "n", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save file" })

