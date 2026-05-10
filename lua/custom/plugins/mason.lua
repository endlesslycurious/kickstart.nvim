-- Install mason managed tools

local tools = {
    'ansible-lint',         -- Ansible linter
    'black',                -- Python formatter
    'clangd',               -- C++ language server
    'debugpy',              -- Python debugger
    'delve',                -- Go debugger
    'golangci-lint',        -- Go linter
    'gopls',                -- Go language server
    'hadolint',             -- Docker linter
    'isort',                -- Python import sorter
    'jedi-language-server', -- Python language server
    'lua-language-server',  -- Lua lanugage server
    'markdownlint',         -- Markdown linter
    'pylint',               -- Python linter
    'stylua',               -- Lua formatter
}

local ok, installer = pcall(require, 'mason-tool-installer')
if not ok then
    -- mason-tool-installer not available; noop
    return
end

installer.setup {
    ensure_installed = tools,
    auto_update = false,
    run_on_start = true, -- set to false if you don't want installs during interactive startup
}
