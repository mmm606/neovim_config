

local function config_function()  
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<Leader>ha", function() harpoon:list():append() end)
    vim.keymap.set("n", "<Leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<Leader>h1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<Leader>h2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<Leader>h3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<Leader>h4", function() harpoon:list():select(4) end)
    vim.keymap.set("n", "<Leader>h5", function() harpoon:list():select(5) end)
    vim.keymap.set("n", "<Leader>h6", function() harpoon:list():select(6) end)
    vim.keymap.set("n", "<Leader>h7", function() harpoon:list():select(7) end)
    vim.keymap.set("n", "<Leader>h8", function() harpoon:list():select(8) end)
    vim.keymap.set("n", "<Leader>h9", function() harpoon:list():select(9) end)
end

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = config_function,
}
