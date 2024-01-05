vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true


vim.opt.scrolloff = 8 -- 999

-- vim.opt.virtualedit = "block"

vim.opt.inccommand = "split" -- show find and replace change in a new window

vim.opt.ignorecase = true -- ignores cases in command mode, can help with :help bc vim commands are lowercase but plugin commands are uppercase

vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"

-- Fixes clipboard issue on wsl
vim.opt.wrap = false
if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end
