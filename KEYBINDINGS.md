# 🧭 Neovim Key Bindings & Commands Reference

> **Leader key:** `<Space>`
>
> **which-key:** Configured with zero delay — it appears automatically whenever you pause after pressing a key that has sub-mappings (e.g. `<leader>`, `gr`, `<leader>h`, `<leader>s`, `<leader>t`). There is no separate key to trigger it manually.

---

## 📦 General

| Key              | Mode   | Action                                      |
|------------------|--------|---------------------------------------------|
| `<Esc>`          | Normal | Clear search highlights                     |
| `<leader>q`      | Normal | Open diagnostic quickfix list               |
| `<Esc><Esc>`     | Terminal | Exit terminal mode                        |
| `<C-h>`          | Normal | Move focus to the left window               |
| `<C-l>`          | Normal | Move focus to the right window              |
| `<C-j>`          | Normal | Move focus to the lower window              |
| `<C-k>`          | Normal | Move focus to the upper window              |

---


## ⚡ Plugin: blink.cmp (Autocompletion)

| Key                   | Mode   | Action                              |
|-----------------------|--------|-------------------------------------|
| `<C-y>`               | Insert | Accept completion                   |
| `<Tab>` / `<S-Tab>`   | Insert | Next / prev snippet placeholder     |
| `<C-Space>`           | Insert | Open completion menu or show docs   |
| `<C-n>` / `<C-p>`     | Insert | Select next / previous completion   |
| `<C-e>`               | Insert | Close completion menu               |
| `<C-k>`               | Insert | Toggle signature help               |

---

## 🐞 Plugin: Debug (nvim-dap)

| Key              | Mode   | Action                          |
|------------------|--------|---------------------------------|
| `<F5>`           | Normal | Debug: Start / Continue         |
| `<F1>`           | Normal | Debug: Step Into                |
| `<F2>`           | Normal | Debug: Step Over                |
| `<F3>`           | Normal | Debug: Step Out                 |
| `<F7>`           | Normal | Debug: See last session result  |
| `<leader>b`      | Normal | Debug: Toggle Breakpoint        |
| `<leader>B`      | Normal | Debug: Set Breakpoint condition |

---

## 🔧 Plugin: Fugitive

| Key | Mode | Action |
|-----|------|--------|
| (No key bindings — use `:Git` commands) | | |

Useful commands:

- `:Git` — run git commands
- `:Git status` — show status
- `:Git blame` — blame current file
- In the Fugitive buffer: `cc` to commit, `dd` to diff, `-` to stage/unstage

---

## 🐙 Plugin: Gitsigns.nvim

| Key            | Mode          | Action                                        |
|----------------|---------------|-----------------------------------------------|
| `]c`           | Normal        | Jump to next git change                       |
| `[c`           | Normal        | Jump to previous git change                   |
| `<leader>hs`   | Normal/Visual | Git: stage hunk                               |
| `<leader>hr`   | Normal/Visual | Git: reset hunk                               |
| `<leader>hS`   | Normal        | Git: stage buffer                             |
| `<leader>hR`   | Normal        | Git: reset buffer                             |
| `<leader>hp`   | Normal        | Git: preview hunk                             |
| `<leader>hi`   | Normal        | Git: preview hunk inline                      |
| `<leader>hb`   | Normal        | Git: blame line (full)                        |
| `<leader>hd`   | Normal        | Git: diff against index                       |
| `<leader>hD`   | Normal        | Git: diff against last commit                 |
| `<leader>hq`   | Normal        | Git: hunk quickfix list (current file)        |
| `<leader>hQ`   | Normal        | Git: hunk quickfix list (all files in repo)   |
| `<leader>tb`   | Normal        | Toggle git blame line                         |
| `<leader>tw`   | Normal        | Toggle git intra-line word diff               |
| `ih`           | Object/Visual | Select hunk (text object)                     |

---

## 🔍 Plugin: LSP

These keymaps are active when an LSP server is attached to the buffer.

| Key        | Mode          | Action                              |
|------------|---------------|-------------------------------------|
| `grn`      | Normal        | Rename symbol under cursor          |
| `gra`      | Normal/Visual | Code action                         |
| `grD`      | Normal        | Go to declaration                   |
| `grr`      | Normal        | Go to references (Telescope)        |
| `gri`      | Normal        | Go to implementation (Telescope)    |
| `grd`      | Normal        | Go to definition (Telescope)        |
| `grt`      | Normal        | Go to type definition (Telescope)   |
| `gO`       | Normal        | Open document symbols (Telescope)   |
| `gW`       | Normal        | Open workspace symbols (Telescope)  |
| `<leader>th` | Normal      | Toggle inlay hints                  |

---

## 🧰 Plugin: MRU

| Key | Mode | Action |
|-----|------|--------|
| (No key bindings — use `:MRU` commands) | | |

Useful commands:

- `:MRU` — open MRU dialog
- `:MRU <pattern>` — search MRU entries

---

## 📁 Plugin: Neo-tree

| Key  | Mode   | Action         |
|------|--------|----------------|
| `\\` | Normal | NeoTree reveal |

---

## 🔬 Plugin: Neotest

| Key           | Mode   | Action                 |
|---------------|--------|------------------------|
| `<leader>tn`  | Normal | Run nearest test       |
| `<leader>tf`  | Normal | Run file tests         |
| `<leader>ts`  | Normal | Toggle summary window  |
| `<leader>to`  | Normal | Open test output       |

---

## 🔭 Plugin: Telescope

| Key            | Mode          | Action                                     |
|----------------|---------------|--------------------------------------------|
| `<leader>sh`   | Normal        | Search help tags                           |
| `<leader>sk`   | Normal        | Search keymaps                             |
| `<leader>sf`   | Normal        | Search files                               |
| `<leader>ss`   | Normal        | Search / select Telescope pickers          |
| `<leader>sw`   | Normal/Visual | Search current word                        |
| `<leader>sg`   | Normal        | Search by grep (live grep)                 |
| `<leader>sd`   | Normal        | Search diagnostics                         |
| `<leader>sr`   | Normal        | Search resume (reopen last search)         |
| `<leader>s.`   | Normal        | Search recent files                        |
| `<leader>sc`   | Normal        | Search commands                            |
| `<leader>sn`   | Normal        | Search Neovim config files                 |
| `<leader>/`    | Normal        | Fuzzy search in current buffer             |
| `<leader>s/`   | Normal        | Live grep across open files                |
| `<leader><leader>` | Normal   | Find existing buffers                      |

---

## 🎨 Plugin: Conform (Formatting)

| Key         | Mode          | Action         |
|-------------|---------------|----------------|
| `<leader>f` | Normal/Visual | Format buffer  |