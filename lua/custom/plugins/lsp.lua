-- Enable LSP servers for Go, C++, and Python
-- (Tools are installed by Mason in custom/plugins/mason.lua)

vim.lsp.config('gopls', {})
vim.lsp.enable('gopls')

vim.lsp.config('clangd', {})
vim.lsp.enable('clangd')

vim.lsp.config('jedi_language_server', {})
vim.lsp.enable('jedi_language_server')