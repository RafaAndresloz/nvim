-- lua/conf.lua
-- Arquivo onde ficam as configurações gerais do editor

local opt = vim.opt

-- Ativar a numeração de linhas
opt.number = true
--opt.relativenumber = true

-- Ativar a cópia e colagem com o sistema operacional
opt.clipboard = "unnamedplus"

-- Configurações de tabulação e identação
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Configurações de busca
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Visibilidade e navegação
opt.cursorline = true
opt.wrap = true
opt.scrolloff = 8
opt.mouse = "a"

-- Configurações de interface
opt.termguicolors = true
opt.signcolumn = "no"
--opt.signcolumn = "yes"
--opt.colorcolumn = "120"

-- Desativar arquivos de backup e swap
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Tempo de espera para mapeamentos
opt.timeoutlen = 500
