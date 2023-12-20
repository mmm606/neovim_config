local function telescope_config()
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
      return
    end
    local actions = require("telescope.actions")
    telescope.setup{
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            mappings = {
                i = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,

                    -- ["<C-c>"] = actions.close,

                    -- ["<Down>"] = actions.move_selection_next,
                    -- ["<Up>"] = actions.move_selection_previous,

                    ["<CR>"] = actions.select_default,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,

                    
                    ["<Up>"] = actions.preview_scrolling_up,
                    ["<Down>"] = actions.preview_scrolling_down,
                    -- ["<C-f>"] = actions.preview_scrolling_left,
                    -- ["<C-k>"] = actions.preview_scrolling_right,

                    -- ["<PageUp>"] = actions.results_scrolling_up,
                    -- ["<PageDown>"] = actions.results_scrolling_down,
                    -- ["<M-f>"] = actions.results_scrolling_left,
                    -- ["<M-k>"] = actions.results_scrolling_right,

                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    ["<C-l>"] = actions.complete_tag,
                    ["<C-/>"] = actions.which_key,
                    ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                    ["<C-w>"] = { "<c-s-w>", type = "command" },

                    -- disable c-j because we dont want to allow new lines #2123
                    -- ["<C-j>"] = actions.nop,
                },

                n = {
                    ["<esc>"] = actions.close,
                    ["<CR>"] = actions.select_default,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,

                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                    -- TODO: This would be weird if we switch the ordering.
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    -- ["H"] = actions.move_to_top,
                    ["M"] = actions.move_to_middle,
                    -- ["L"] = actions.move_to_bottom,

                    -- ["<Down>"] = actions.move_selection_next,
                    -- ["<Up>"] = actions.move_selection_previous,
                    ["gg"] = actions.move_to_top,
                    ["G"] = actions.move_to_bottom,

                    ["<C-k>"] = actions.preview_scrolling_up,
                    ["<C-j>"] = actions.preview_scrolling_down,

                    -- ["<PageUp>"] = actions.results_scrolling_up,
                    -- ["<PageDown>"] = actions.results_scrolling_down,

                    ["?"] = actions.which_key,
                    -- map actions.which_key to <C-h> (default: <C-/>)
                    -- actions.which_key shows the mappings for your picker,
                    -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                    ["<C-h>"] = "which_key"
                },    
            }
        },
        pickers = {
            -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
      }
    }

    -- Now lets map keys that will interact activate telescope
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "find file"})
    vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc = "find git file"})
    vim.keymap.set('n', '<leader>fs', function() builtin.grep_string() end, {desc = "search for words"})
end

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = telescope_config,
}
