return {"mg979/vim-visual-multi", 
    config = function()
        vim.api.nvim_set_keymap('n', '<C-d>', '<Plug>(VM-Find-Under)', {})
        vim.api.nvim_set_keymap('v', '<C-d>', '<Plug>(VM-Find-Subword-Under)', {})
    end
}
