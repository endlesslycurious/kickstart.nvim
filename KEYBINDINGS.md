# 🧭 Neovim Key Bindings Reference

> **Leader key:** `<Space>`

This file documents the key mappings configured in your Neovim setup, combining Kickstart’s latest defaults with your custom mappings.  
Mappings are grouped by plugin or functionality for clarity.

---

## 📦 General

| Key | Mode | Action |
|-----|------|---------|
| `<leader>w` | Normal | Save current file (`:write`) |
| `<leader>q` | Normal | Quit window (`:quit`) |
| `<leader>Q` | Normal | Quit all (`:qa!`) |
| `<Esc>` | Normal | Clear search highlight (`:nohlsearch`) |
| `<C-h>` | Normal | Move to window left |
| `<C-l>` | Normal | Move to window right |
| `<C-j>` | Normal | Move to window below |
| `<C-k>` | Normal | Move to window above |
| `<leader>nh` | Normal | Clear highlights |

---

## 🔍 Telescope

| Key | Mode | Action |
|-----|------|---------|
| `<leader>sf` | Normal | Search files |
| `<leader>sg` | Normal | Live grep across project |
| `<leader>sb` | Normal | Search open buffers |
| `<leader>sh` | Normal | Search help tags |
| `<leader>sd` | Normal | Search diagnostics (new in Kickstart 2025) |
| `<leader>sr` | Normal | Resume last Telescope search |
| `<leader>sk` | Normal | Search keymaps |
| `<leader>sc` | Normal | Search Neovim commands |
| `<leader>ss` | Normal | Search current word (ripgrep) |

---

## ⚙️ LSP (Language Server Protocol)

| Key | Mode | Action |
|-----|------|---------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gr` | Normal | List references (Kickstart 0.11 default) |
| `gI` | Normal | Go to implementation |
| `<leader>rn` | Normal | Rename symbol (custom retained mapping) |
| `<leader>ca` | Normal | Code action |
| `<leader>f` | Normal | Format buffer using Conform (replaces LSP format) |
| `<leader>ds` | Normal | Document symbols |
| `<leader>ws` | Normal | Workspace symbols |
| `<leader>e` | Normal | Show diagnostics (floating) |
| `[d` | Normal | Go to previous diagnostic |
| `]d` | Normal | Go to next diagnostic |
| `<leader>dl` | Normal | List diagnostics (Telescope) |
| `<leader>cl` | Normal | Restart LSP client |

---

## 🧩 Treesitter

| Key | Mode | Action |
|-----|------|---------|
| `:TSUpdate` | Command | Update all parsers |
| `:TSInstall <lang>` | Command | Install a parser for a language |
| `:TSEnable highlight` | Command | Enable syntax highlighting |
| `:TSDisable highlight` | Command | Disable syntax highlighting |

---

## 🧰 Git (via `lewis6991/gitsigns.nvim`)

| Key | Mode | Action |
|-----|------|---------|
| `<leader>gb` | Normal | Show current line blame |
| `<leader>gd` | Normal | Show diff (in split) |
| `<leader>gp` | Normal | Preview hunk |
| `<leader>gr` | Normal | Reset hunk |
| `<leader>gs` | Normal | Stage hunk |
| `<leader>gu` | Normal | Undo stage hunk |

---

## 🗂️ File Tree (`neo-tree.nvim`)

| Key | Mode | Action |
|-----|------|---------|
| `<leader>e` | Normal | Toggle Neo-tree |
| `<leader>o` | Normal | Focus Neo-tree window |
| `<leader>fe` | Normal | Open file explorer at current file |

---

## 💡 Snippets (`LuaSnip`)

| Key | Mode | Action |
|-----|------|---------|
| `<C-k>` | Insert | Expand snippet or jump forward |
| `<C-j>` | Insert | Jump backward through snippet fields |
| `<C-l>` | Insert | Cycle snippet choices |

---

## 🧭 Navigation (`which-key`)

| Key | Mode | Action |
|-----|------|---------|
| `<leader>` | Normal | Show which-key popup |
| `<leader>?` | Normal | Show available keymaps for current buffer |

---

## 🧹 Formatting & Linting (`stevearc/conform.nvim`)

| Key | Mode | Action |
|-----|------|---------|
| `<leader>f` | Normal | Format current buffer |
| `<leader>F` | Normal | Format all buffers |
| `:FormatInfo` | Command | Show formatter info |

---

## 🧪 Testing (`nvim-neotest` / `neotest-golang`)

| Key | Mode | Action |
|-----|------|---------|
| `<leader>tt` | Normal | Run nearest test |
| `<leader>tf` | Normal | Run test file |
| `<leader>to` | Normal | Open test output |
| `<leader>ts` | Normal | Toggle test summary panel |
| `<leader>td` | Normal | Debug nearest test |
| `<leader>tS` | Normal | Stop running tests |

---

## 🧱 Buffer & Tab Management

| Key | Mode | Action |
|-----|------|---------|
| `<leader>bn` | Normal | Next buffer |
| `<leader>bp` | Normal | Previous buffer |
| `<leader>bd` | Normal | Close buffer |
| `<leader>bo` | Normal | Close all other buffers |
| `<leader>tn` | Normal | New tab |
| `<leader>tc` | Normal | Close tab |
| `<leader>to` | Normal | Close other tabs |

---

## 🕹️ Miscellaneous Custom Mappings

| Key | Mode | Action |
|-----|------|---------|
| `<leader>ss` | Normal | Search word under cursor |
| `<leader>r` | Normal | Reload configuration |
| `<leader>u` | Normal | Toggle Undotree |
| `<leader>hl` | Normal | Toggle highlight groups |
| `<leader>z` | Normal | Toggle Zen Mode (if installed) |

---

## ⚙️ System Integrations

| Key | Mode | Action |
|-----|------|---------|
| `<leader>t` | Normal | Open integrated terminal |
| `<leader>x` | Normal | Close terminal split |
| `<leader>y` | Visual | Copy to system clipboard |
| `<leader>p` | Normal | Paste from system clipboard |
| `<leader>P` | Normal | Paste without overwriting default register |

---

### 📝 Notes

- `<leader>` = `<Space>`  
- `<C-*>` = Control key  
- `<S-*>` = Shift key  
- Some bindings are context-aware and may change depending on active LSP, filetype, or buffer.

---

## 🔄 Last Sync

- **Kickstart Base:** Upstream as of November 2025  
- **Config Version:** `endlesslycurious/kickstart.nvim` (local custom build)
- **Generated:** Automatically updated after Treesitter + LSP merge
