# 🧭 Neovim Key Bindings & Commands Reference

> **Leader key:** `<Space>`

This file documents the key mappings configured in your Neovim setup,
combining both default and plugin-specific mappings for clarity.

---

## 📦 General

(General key mappings will be appended in context if available.)

---

## 🧩 Plugin: Avante.nvim

| Key          | Mode   | Action                                   |
|--------------|--------|------------------------------------------|
| `<leader>a`  | Normal | AI: start / resume chat                  |
| `<leader>ae` | Visual | AI: edit selection with instructions     |
| `<leader>as` | Normal | AI: get inline suggestion / code         |

Useful command(s):

- `:AvanteAsk` — start / resume chat
- `:AvanteEdit` — edit selection
- `:AvanteSuggest` — inline / code suggestion

---

## ⚡ Plugin: blink.cmp (Autocompletion)

| Key                 | Mode   | Action                                |
|--------------------:|:------:|--------------------------------------|
| `<C-y>`             | Insert | Accept completion (default)           |
| `<Tab>` / `<S-Tab>` | Insert | Next/prev snippet placeholder or      |
|                     |        | accept                                |
| `<C-Space>`         | Insert | Open completion menu or show docs    |
| `<C-n>` / `<C-p>`   | Insert | Select next/previous completion      |
| `<C-e>`             | Insert | Close completion menu                |
| `<C-k>`             | Insert | Toggle signature help                |

Notes:

- The 'default' preset maps `<C-y>` to accept completion.
  The 'super-tab' preset maps `<Tab>` for accept. The 'enter'
  preset maps `<CR>` for accept.

- Presets provide snippet navigation. Use `<Tab>` / `<S-Tab>`
  to jump through snippet placeholders when using LuaSnip.

- Blink.cmp supports multiple sources: copilot, lsp, path,
  snippets and lazydev. See `lua/custom/plugins` for the
  active preset and further customization.

---

## 🐞 Plugin: Debug (nvim-dap)

| Key     | Mode   | Action                        |
|---------|--------|-------------------------------|
| `<F5>`  | Normal | Debug: Start / Continue       |
| `<F1>`  | Normal | Debug: Step Into              |
| `<F2>`  | Normal | Debug: Step Over              |
| `<F3>`  | Normal | Debug: Step Out               |
| `<leader>b` | Normal | Debug: Toggle Breakpoint  |
| `<leader>B` | Normal | Debug: Set Breakpoint     |
| `<F7>`  | Normal | Debug: See last session       |

---

## 🔧 Plugin: Fugitive

- Usage: Use `:Git` to access Git functionality.
  - `cc`: Commit
  - `dd`: Diff
  - `-`: Stage / Unstage

Useful command(s):

- `:Git` — run git commands
- `:Git status` — show status
- `:Git blame` — blame current file

---

## 🐙 Plugin: Gitsigns.nvim

| Key           | Mode   | Action                         |
|---------------|--------|--------------------------------|
| `]c`          | Normal | Jump to next git change        |
| `[c`          | Normal | Jump to previous git change    |
| `<leader>hs`  | Normal | Git: stage hunk                |
| `<leader>hr`  | Normal | Git: reset hunk                |
| `<leader>hS`  | Normal | Git: stage buffer              |
| `<leader>hu`  | Normal | Git: undo stage hunk           |
| `<leader>hR`  | Normal | Git: reset buffer              |
| `<leader>hp`  | Normal | Git: preview hunk              |
| `<leader>hb`  | Normal | Git: blame line                |
| `<leader>hd`  | Normal | Git: diff against index        |
| `<leader>hD`  | Normal | Git: diff against last commit  |
| `<leader>tb`  | Normal | Toggle git blame line          |
| `<leader>tD`  | Normal | Toggle git show deleted        |

---

## 🧰 Plugin: MRU

Useful command(s):

- `:MRU` — open MRU dialog
- `:MRU <pattern>` — search MRU entries

---

## 📁 Plugin: Neo-tree

| Key   | Mode   | Action         |
|-------|--------|----------------|
| `\\`  | Normal | NeoTree reveal |

---

## 🔍 Plugin: Neotest

| Key             | Mode   | Action                 |
|-----------------|--------|------------------------|
| `<leader>tn`    | Normal | Run nearest test       |
| `<leader>tf`    | Normal | Run file tests         |
| `<leader>ts`    | Normal | Toggle summary window  |
| `<leader>to`    | Normal | Open test output       |

Useful command(s):

- `:lua require('neotest').run.run()` — run nearest test
- `:lua require('neotest').run.run(vim.fn.expand('%'))` — run file
- `:lua require('neotest').summary.toggle()` — toggle summary
  window
- `:lua require('neotest').output.open()` — open test output

---

## 🧭 Plugin: Telescope

Useful command(s):

- `:Telescope` — open Telescope
- `:Telescope find_files` — find files
- `:Telescope live_grep` — live grep
- `:Telescope buffers` — list buffers

---

(Additional plugin key mappings can be appended here.)
