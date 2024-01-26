------------------------------
---------- keymap ------------
------------------------------
local map = vim.keymap.set
local option = { silent = true }

map('n', '<ESC>', ':nohl<CR>', option)
-- copy to system clipboard
map('v', '<leader>y', '"+y', option)
map('n', '<leader>y', 'ggVG"+y', option)

map('i', '<C-w>', '<C-g>u<C-w>', option)
map('i', '<C-u>', '<C-g>u<C-u>', option)
map('i', '<CR>', '<C-g>u<CR>', option)

map('n', '<leader><Space>', '<cmd> wa<CR>')


