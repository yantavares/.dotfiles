vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("se shiftwidth=4")

vim.opt.number = true
vim.opt.relativenumber = true

-- Create an augroup named 'numbertoggle' to manage our autocmds
vim.api.nvim_create_augroup('numbertoggle', { clear = true })

-- Create autocmds to toggle relative line numbers
vim.api.nvim_create_autocmd(
  {'BufEnter', 'FocusGained', 'InsertLeave'},
  {pattern = '*', command = 'set relativenumber', group = 'numbertoggle'}
)
vim.api.nvim_create_autocmd(
  {'BufLeave', 'FocusLost', 'InsertEnter'},
  {pattern = '*', command = 'set norelativenumber number', group = 'numbertoggle'}
)
