# NeoVim - Kick-Start

This is my personal NeoVim config, based on the [kickstart distribution](https://github.com/nvim-lua/kickstart.nvim).

## Programming languages

The main programming languages I use are the following:

- C++
- Go
- Python

### Secondary languages

At times I will also interact with the following file formats:

- Batch script
- Lua
- Markdown
- Shell script
- SQL
- Swift
- Terraform

## Kickstart divergences & additions

Limit modifications or divergences to the kickstart supplied files to simplify updates:

- New configuration goes in `lua/custom/plugins/*.lua`.
- Only list additions (e.g. adding a language/parser/tool) may go in kickstart files.

## Guidelines

1. Use the built-in `vim.pack` plugin manager.
2. Avoid plugins/tools that would require `node` or `NPM` to be installed.
3. The config needs to function on Mac OS, Windows 11 and Linux.
4. If in doubt ask the user for clarification.
5. If updating key bindings update `KEYBINDINGS.md` too.
