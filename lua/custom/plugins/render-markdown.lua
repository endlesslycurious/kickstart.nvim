-- render-markdown.nvim: render markdown in the buffer (headings, lists, code
-- blocks) using tree-sitter, no browser required.
-- Requires the `markdown` and `markdown_inline` tree-sitter parsers, which are
-- already installed in init.lua.

vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }

require('render-markdown').setup {}