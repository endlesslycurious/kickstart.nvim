-- Additional linters on top of kickstart's lint config
-- Runs after kickstart/plugins/lint.lua sets up linters_by_ft.

local lint = require 'lint'
lint.linters_by_ft = lint.linters_by_ft or {}
lint.linters_by_ft['go'] = { 'golangcilint' }
lint.linters_by_ft['markdown'] = { 'rumdl' } -- rumdl is Rust-based (no Node.js required)

-- Disable MD013 (line length): noise for prose-heavy markdown.
-- Inserted after `check` so the rest of nvim-lint's default rumdl args are preserved.
table.insert(lint.linters.rumdl.args, 2, '--disable')
table.insert(lint.linters.rumdl.args, 3, 'MD013')
