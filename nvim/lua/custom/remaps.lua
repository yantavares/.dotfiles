-- File explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, {})

-- Split window
vim.keymap.set('n', '<leader>hs', vim.cmd.split, {})
vim.keymap.set('n', '<leader>vs', vim.cmd.vsplit, {})

-- Move selected line(s) up and down
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

vim.api.nvim_set_keymap('x', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })


-- Map Esc to exit Terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Map Ctrl-a to select all text
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-a>', 'ggVG', { noremap = true, silent = true })

