local function toggle_bottom_terminal()
    local exists, win = pcall(vim.api.nvim_get_var, "bottom_terminal_win")
    if exists then
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
            vim.api.nvim_del_var("bottom_terminal_win")
            return
        end
    end

    local buf_exists, term_buf = pcall(vim.api.nvim_get_var, "bottom_terminal_buf")
    if not buf_exists then
        vim.cmd("botright split term://$SHELL")
        local terminal_win = vim.api.nvim_get_current_win()
        local terminal_buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_set_var("bottom_terminal_win", terminal_win)
        vim.api.nvim_set_var("bottom_terminal_buf", terminal_buf)
    else
        vim.cmd("botright split")
        vim.cmd("buffer " .. term_buf)
        local terminal_win = vim.api.nvim_get_current_win()
        vim.api.nvim_set_var("bottom_terminal_win", terminal_win)
    end
    vim.cmd("resize 10")
end

local function toggle_right_terminal()
    local exists, win = pcall(vim.api.nvim_get_var, "right_terminal_win")
    if exists then
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
            vim.api.nvim_del_var("right_terminal_win")
            return
        end
    end

    local buf_exists, term_buf = pcall(vim.api.nvim_get_var, "right_terminal_buf")
    if not buf_exists then
        vim.cmd("botright vsplit term://$SHELL")
        local terminal_win = vim.api.nvim_get_current_win()
        local terminal_buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_set_var("right_terminal_win", terminal_win)
        vim.api.nvim_set_var("right_terminal_buf", terminal_buf)
    else
        vim.cmd("botright vsplit")
        vim.cmd("buffer " .. term_buf)
        local terminal_win = vim.api.nvim_get_current_win()
        vim.api.nvim_set_var("right_terminal_win", terminal_win)
    end
    vim.cmd("vertical resize 45")
end

local function clear_all_terminals()
    local buffers = vim.api.nvim_list_bufs()
    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end

    if pcall(vim.api.nvim_get_var, "bottom_terminal_buf") then
        vim.api.nvim_del_var("bottom_terminal_buf")
    end
    if pcall(vim.api.nvim_get_var, "right_terminal_buf") then
        vim.api.nvim_del_var("right_terminal_buf")
    end
    if pcall(vim.api.nvim_get_var, "bottom_terminal_win") then
        vim.api.nvim_del_var("bottom_terminal_win")
    end
    if pcall(vim.api.nvim_get_var, "right_terminal_win") then
        vim.api.nvim_del_var("right_terminal_win")
    end
end

-- Autocommand to clear all terminal buffers before quitting Neovim
vim.api.nvim_create_autocmd("QuitPre", {
    callback = function()
        require("custom.terminals").clear_all_terminals()
    end
})

vim.api.nvim_set_keymap('n', '<A-1>', ':lua require("custom.terminals").toggle_bottom_terminal()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-2>', ':lua require("custom.terminals").toggle_right_terminal()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-3>', ':lua require("custom.terminals").clear_all_terminals()<CR>', { noremap = true, silent = true })

return {
    toggle_bottom_terminal = toggle_bottom_terminal,
    toggle_right_terminal = toggle_right_terminal,
    clear_all_terminals = clear_all_terminals,
}

