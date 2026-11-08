-- Catppuccin Color Scheme
-- Pinned to the light Catppuccin Latte flavour. To switch to Frappe, change
-- `flavour` to 'frappe' and the background to 'dark'; the dark mapping below
-- is kept so the change is a small edit.

vim.pack.add { 'https://github.com/catppuccin/nvim' }

vim.o.background = 'light'

require('catppuccin').setup {
    flavour = 'latte',
    background = { light = 'latte', dark = 'frappe' },
}

vim.cmd.colorscheme 'catppuccin'
