-- Catppuccin Color Scheme
-- Match the system light/dark mode: THEME_MODE from the shell, with
-- macOS and Windows fallbacks for GUI launches.

vim.pack.add { 'https://github.com/catppuccin/nvim' }

local mode = os.getenv 'THEME_MODE'
if mode ~= 'light' and mode ~= 'dark' then
    if vim.fn.has 'macunix' == 1 then
        vim.fn.system { 'defaults', 'read', '-g', 'AppleInterfaceStyle' }
        mode = vim.v.shell_error == 0 and 'dark' or 'light'
    elseif vim.fn.has 'win32' == 1 then
        local out = vim.fn.system {
            'reg', 'query',
            'HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize',
            '/v', 'AppsUseLightTheme',
        }
        local value = out:match 'AppsUseLightTheme%s+REG_DWORD%s+0x(%x+)'
        if value then
            mode = value == '0' and 'dark' or 'light'
        end
    end
end
if mode == 'light' or mode == 'dark' then
    vim.o.background = mode
end

require('catppuccin').setup {
    flavour = 'auto',
    background = { light = 'latte', dark = 'frappe' },
}

vim.cmd.colorscheme 'catppuccin'
