-- Additional linters on top of kickstart's lint config
-- Runs after kickstart/plugins/lint.lua sets up linters_by_ft.

local lint = require 'lint'
lint.linters_by_ft = lint.linters_by_ft or {}
lint.linters_by_ft['go'] = { 'golangci_lint' }
lint.linters_by_ft['markdown'] = { 'rumdl' } -- rumdl is Rust-based (no Node.js required)