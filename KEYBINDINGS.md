# 🧭 Neovim Key Bindings Reference

> **Leader key:** `<Space>`

This file documents the key mappings configured in your Neovim setup, combining both default and plugin-specific mappings for clarity.

---

## 📦 General

(General key mappings will be appended in context if available.)

---

## 🧩 Plugin: Avante.nvim

| Key        | Mode   | Action                                    |
|------------|--------|-------------------------------------------|
| `<leader>a`  | Normal | AI: start / resume chat                   |
| `<leader>ae` | Visual | AI: edit selection with instructions      |
| `<leader>as` | Normal | AI: get inline suggestion / code suggestion |

---

## 🐙 Plugin: Gitsigns.nvim

| Key           | Mode    | Action                              |
|---------------|---------|-------------------------------------|
| `]c`            | Normal  | Jump to next git change             |
| `[c`            | Normal  | Jump to previous git change         |
| `<leader>hs`    | Normal | Git: stage hunk                     |
| `<leader>hr`    | Normal | Git: reset hunk                     |
| `<leader>hS`    | Normal | Git: stage buffer                   |
| `<leader>hu`    | Normal | Git: undo stage hunk                |
| `<leader>hR`    | Normal | Git: reset buffer                   |
| `<leader>hp`    | Normal | Git: preview hunk                   |
| `<leader>hb`    | Normal | Git: blame line                     |
| `<leader>hd`    | Normal | Git: diff against index             |
| `<leader>hD`    | Normal | Git: diff against last commit       |
| `<leader>tb`    | Normal | Toggle git blame line               |
| `<leader>tD`    | Normal | Toggle git show deleted             |

---

## 🐞 Plugin: Debug (nvim-dap)

| Key           | Mode    | Action                            |
|---------------|---------|-----------------------------------|
| `<F5>`          | Normal  | Debug: Start/Continue             |
| `<F1>`          | Normal  | Debug: Step Into                  |
| `<F2>`          | Normal  | Debug: Step Over                  |
| `<F3>`          | Normal  | Debug: Step Out                   |
| `<leader>b`     | Normal  | Debug: Toggle Breakpoint          |
| `<leader>B`     | Normal  | Debug: Set Breakpoint             |
| `<F7>`          | Normal  | Debug: See last session result.   |

---

## 🔍 Plugin: Neotest

| Key           | Mode    | Action                            |
|---------------|---------|-----------------------------------|
| `<leader>tn`    | Normal  | Run nearest test                  |
| `<leader>tf`    | Normal  | Run file tests                    |
| `<leader>ts`    | Normal  | Toggle summary window             |
| `<leader>to`    | Normal  | Open test output                  |

---

## 📁 Plugin: Neo-tree

| Key      | Mode   | Action           |
|----------|--------|------------------|
| `\\`       | Normal | NeoTree reveal   |

---

## 🔧 Plugin: Fugitive

- Usage: Use `:Git` to access Git functionality.
  - `cc`: Commit
  - `dd`: Diff
  - `-`: Stage/Unstage

---

(Additional plugin key mappings can be appended here.)

