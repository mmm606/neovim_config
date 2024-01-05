
local function lsp_zero_config()
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_lspconfig()

    -- We set up keybindings in which-key
    -- lsp_zero.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        -- lsp_zero.default_keymaps({buffer = bufnr})
    -- end)

    require("neodev").setup({}) -- This helps with the config, set it up before lsp
    require('mason').setup({})
    require('mason-lspconfig').setup({
        ensure_installed = {'lua_ls'},
        handlers = {
            lsp_zero.default_setup,
        },
    })
end

local function cmp_config()
    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()
    cmp.setup({
        mapping = cmp.mapping.preset.insert({

            ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

            -- `Enter` key to confirm completion
            ['<CR>'] = cmp.mapping.confirm({select = false}),

            -- Ctrl+Space to trigger completion menu
            ['<C-Space>'] = cmp.mapping.complete(),

            -- Navigate between snippet placeholder
            ['<Tab>'] = cmp_action.luasnip_jump_forward(),
            ['<S-Tab>'] = cmp_action.luasnip_jump_backward(),
            -- Not sure about supertab, could make it hard to not accept completion during snippet population
            -- ['<Tab>'] = cmp_action.luasnip_supertab(),
            -- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

            -- Scroll up and down in the completion documentation
            ['<C-M-j>'] = cmp.mapping.scroll_docs(4),
            ['<C-M-k>'] = cmp.mapping.scroll_docs(-4),

        })
    })
end

return {
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', dependencies = "folke/neodev.nvim", config = lsp_zero_config},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp', config = cmp_config},
    {'L3MON4D3/LuaSnip'},
}
