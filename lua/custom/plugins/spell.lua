-- Built-in spell checking: comment/prose only in treesitter buffers
-- (via spelloptions=noplainbuffer + @spell captures), and full-buffer for
-- prose filetypes. Restricted to the filetypes I work in.

vim.o.spelllang = 'en_us'

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('spell', { clear = true }),
    callback = function()
        local spell_filetypes = { 'lua', 'go', 'python', 'cpp', 'markdown', 'text', 'gitcommit', 'dockerfile', 'yaml',
        'sh', 'zsh', 'bash', 'sql', 'swift', 'terraform', 'hcl' }
        if vim.tbl_contains(spell_filetypes, vim.bo.filetype) then
            vim.opt_local.spell = true
        end
    end,
})