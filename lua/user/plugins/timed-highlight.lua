
local function timed_highlight_config()
    require("timed-highlight").setup({
        highlight_timeout_ms = 2000
    })
end

return {dir = "~/custom_neovim_plugins/timed-highlight.nvim", config = timed_highlight_config}
