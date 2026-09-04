-- Format on save for the languages I use.
-- Re-setup conform (loaded after init.lua's setup) so we can extend the
-- enabled filetypes without editing init.lua.

require('conform').setup {
    notify_on_error = false,
    format_on_save = function(bufnr)
        local enabled_filetypes = {
            python = true,
            go = true,
            cpp = true,
            lua = true,
        }
        if enabled_filetypes[vim.bo[bufnr].filetype] then
            return { timeout_ms = 500 }
        else
            return nil
        end
    end,
    default_format_opts = {
        lsp_format = 'fallback', -- go/cpp format via gopls/clangd; lua via stylua
    },
    formatters_by_ft = {
        python = { 'ruff_fix', 'ruff_format' },
    },
}