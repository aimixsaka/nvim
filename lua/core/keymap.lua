local map = vim.keymap.set
local option = { silent = true }

-- leader key
vim.g.mapleader = " "
------- ----- ----
--- global map ---
------------------
map('n', '<Esc>', '<Cmd> noh<CR>', option)
map('n', '<Space>', '<Nop>', option)
-- copy to system clipboard
map('v', '<leader>y', '"+y', option)
map('n', '<leader>y', 'ggVG"+y', option)

map('i', '<C-w>', '<C-g>u<C-w>', option)
map('i', '<C-u>', '<C-g>u<C-u>', option)
map('i', '<CR>', '<C-g>u<CR>', option)

map('n', '<leader><Space>', '<cmd> wa<CR>', option)
