
local function config_function()  
    vim.cmd.colorscheme("kanagawa-wave")
end

return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = config_function,
}
