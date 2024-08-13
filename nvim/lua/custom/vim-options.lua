vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("se shiftwidth=4")

vim.opt.number = true
vim.opt.relativenumber = true

-- Enable relative numbers in normal mode, absolute numbers in insert mode
vim.api.nvim_create_augroup('numbertoggle', {}) 
vim.api.nvim_create_autocmd(
  {'BufEnter', 'FocusGained', 'InsertLeave'},
  {pattern = '*', command = 'set relativenumber', group = 'numbertoggle'}
)
vim.api.nvim_create_autocmd(
  {'BufLeave', 'FocusLost', 'InsertEnter'},
  {pattern = '*', command = 'set norelativenumber', group = 'numbertoggle'}
)
