
local function config_function()  
    vim.cmd.colorscheme("solarized")
    vim.opt.background = "light"
end

return {
    "shaunsingh/solarized.nvim",
    lazy = false,
    priority = 1000,
    config = config_function,
}
