local function toggle_bottom_terminal()
    local exists, win = pcall(vim.api.nvim_get_var, "bottom_terminal_win")
    if exists then
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
            vim.api.nvim_del_var("bottom_terminal_win")
            return
        end
    end

    -- Check if terminal buffer exists
    local buf_exists, term_buf = pcall(vim.api.nvim_get_var, "bottom_terminal_buf")
    if not buf_exists then
        -- Create a new terminal buffer
        vim.cmd("botright split term://$SHELL")
        local terminal_win = vim.api.nvim_get_current_win()
        local terminal_buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_set_var("bottom_terminal_win", terminal_win)
        vim.api.nvim_set_var("bottom_terminal_buf", terminal_buf)
    else
        -- Use the existing terminal buffer
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

    -- Check if terminal buffer exists
    local buf_exists, term_buf = pcall(vim.api.nvim_get_var, "right_terminal_buf")
    if not buf_exists then
        -- Create a new terminal buffer
        vim.cmd("botright vsplit term://$SHELL")
        local terminal_win = vim.api.nvim_get_current_win()
        local terminal_buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_set_var("right_terminal_win", terminal_win)
        vim.api.nvim_set_var("right_terminal_buf", terminal_buf)
    else
        -- Use the existing terminal buffer
        vim.cmd("botright vsplit")
        vim.cmd("buffer " .. term_buf)
        local terminal_win = vim.api.nvim_get_current_win()
        vim.api.nvim_set_var("right_terminal_win", terminal_win)
    end
    -- Resize the terminal window
    vim.cmd("vertical resize 40")
end

vim.api.nvim_set_keymap('n', '<A-1>', ':lua require("custom.terminals").toggle_bottom_terminal()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<A-2>', ':lua require("custom.terminals").toggle_right_terminal()<CR>', { noremap = true, silent = true })

return {
    toggle_bottom_terminal = toggle_bottom_terminal,
    toggle_right_terminal = toggle_right_terminal,
}
