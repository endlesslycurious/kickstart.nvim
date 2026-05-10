-- Catppuccin Color Scheme
-- Configure theme in macchiato flavor

vim.pack.add { 'https://github.com/catppuccin/nvim' }

require('catppuccin').setup {
    flavour = 'macchiato',
}

vim.cmd.colorscheme 'catppuccin'
