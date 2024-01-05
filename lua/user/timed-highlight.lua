
local highlight_expiration_time = 1000
local highlight_timer

local M = {
    turn_off_highlight_after_expiration = function()
        -- Cancel the existing timer if it exists
        if highlight_timer then
            vim.fn.timer_stop(highlight_timer)
        end

        -- Set a new timer
        highlight_timer = vim.fn.timer_start(highlight_expiration_time, function()
            vim.cmd('nohlsearch')
        end)
    end
}

-- ensure n and N highlight for only a brief time
local lua_command_string = ":lua require('user.timed-highlight').turn_off_highlight_after_expiration()<CR>"

vim.api.nvim_set_keymap('n', 'n', lua_command_string .. 'n', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', lua_command_string .. 'N', { noremap = true, silent = true })

-- ensure the initial lookup using / or ? highlight for only a brief time
vim.api.nvim_create_autocmd("CmdlineLeave", {
    callback = function()
        local cmd_type = vim.fn.expand("<afile>")
        vim.schedule(
            function()
                if cmd_type ~= nil and (cmd_type == '/' or cmd_type == '?') then
                    require('user.timed-highlight').turn_off_highlight_after_expiration()
                end
            end
        )
    end
})

return M
