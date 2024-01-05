
local highlight_expiration_time = 1000

local M = {
    turn_off_highlight_after_expiration = function()
        vim.defer_fn(function() vim.cmd('nohlsearch') end, highlight_expiration_time)
    end
}

local lua_command_string =  ":lua require('user.time-highlight-test').turn_off_highlight_after_expiration()<CR>"

vim.api.nvim_set_keymap('n', 'n', lua_command_string .. 'n', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', lua_command_string .. 'N', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("CmdlineLeave", {
    callback = function()
        local cmd_type = vim.fn.expand("<afile>")
        vim.schedule(
            function()
                if cmd_type ~= nil and (cmd_type == '/' or cmd_type == '?') then
                    require('user.time-highlight-test').turn_off_highlight_after_expiration()
                end
            end
        )
    end
})

return M
