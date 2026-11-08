-- Catppuccin Color Scheme
-- Match the system light/dark mode. The OS is queried directly so a stale
-- THEME_MODE inherited from a long-lived terminal session (e.g. a herdr or tmux
-- pane) cannot force the wrong flavour; THEME_MODE is only a last-resort
-- fallback when no platform signal is available.

vim.pack.add { 'https://github.com/catppuccin/nvim' }

local mode
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
elseif vim.fn.executable 'gsettings' == 1 then
    -- Linux desktops (GNOME/Ubuntu): read the live scheme so long-lived panes
    -- stay correct, falling back to the GTK theme name if the key is unset.
    local scheme = vim.fn.system { 'gsettings', 'get', 'org.gnome.desktop.interface', 'color-scheme' }
    if scheme:find('prefer-dark', 1, true) then
        mode = 'dark'
    elseif scheme:find('prefer-light', 1, true) then
        mode = 'light'
    else
        local gtk = vim.fn.system { 'gsettings', 'get', 'org.gnome.desktop.interface', 'gtk-theme' }
        if gtk:lower():find('dark', 1, true) then
            mode = 'dark'
        elseif gtk:lower():find('light', 1, true) then
            mode = 'light'
        end
    end
end
if not mode then
    mode = os.getenv 'THEME_MODE'
    if mode ~= 'light' and mode ~= 'dark' then mode = nil end
end
if mode == 'light' or mode == 'dark' then
    vim.o.background = mode
end

require('catppuccin').setup {
    flavour = 'auto',
    background = { light = 'latte', dark = 'frappe' },
}

vim.cmd.colorscheme 'catppuccin'
