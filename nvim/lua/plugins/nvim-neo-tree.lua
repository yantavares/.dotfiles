return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require('neo-tree').setup({
            close_if_last_window = true,
            git_status = {
                show_untracked = true,
            },
           -- window = {
           --    width = 30,
           -- }
        })
    end,
    keys = {
        { "<leader>e", ":Neotree toggle<CR>", desc = "Toggle Neo-tree" },
        { "<leader>o", ":Neotree focus<CR>", desc = "Focus Neo-tree" },
    }
}

