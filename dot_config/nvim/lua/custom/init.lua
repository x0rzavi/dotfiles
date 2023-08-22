local opt = vim.opt

opt.relativenumber = true
opt.shiftwidth = 8
opt.tabstop = 8
opt.softtabstop = 8

-- if vim.fn.has('wsl') == 1 then
--     vim.g.clipboard = {
--         name = 'WslClipboard',
--         copy = {
--             ['+'] = '/mnt/c/Windows/System32/clip.exe',
--             ['*'] = '/mnt/c/Windows/System32/clip.exe',
--         },
--         paste = {
--             ['+'] = '/mnt/c/Program Files/PowerShell/7/pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--             ['*'] = '/mnt/c/Program Files/PowerShell/7/pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--         },
--         cache_enabled = 0,
--     }
-- end
