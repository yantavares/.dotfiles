return { "catppuccin/nvim", name = "catppuccin", priority = 999,
    config = function ()
        require("catppuccin").setup()
        vim.cmd.colorscheme "catppuccin"
    end
}

