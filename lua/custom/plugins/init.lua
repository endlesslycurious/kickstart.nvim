-- custom config  - overriding things in ../../init.lua

-- tab key bindings
local tab_bindings = function()
  vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = '[T]ab [N]ew' })
  vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = '[T]ab [C]lose' })
  vim.keymap.set('n', '<leader>tt', ':tabnext<CR>', { desc = '[T]ab next' })
  vim.keymap.set('n', '<leader>TT', ':tabprev<CR>', { desc = '[T]ab prev' })
  vim.keymap.set('n', '<leader>tT', ':tabprev<CR>', { desc = '[T]ab prev' })
  vim.keymap.set('n', '<leader>t1', '1gt', { desc = '[T]ab [1]' })
  vim.keymap.set('n', '<leader>t2', '2gt', { desc = '[T]ab [2]' })
  vim.keymap.set('n', '<leader>t3', '3gt', { desc = '[T]ab [3]' })
  vim.keymap.set('n', '<leader>t4', '4gt', { desc = '[T]ab [4]' })
  vim.keymap.set('n', '<leader>t5', '5gt', { desc = '[T]ab [5]' })
  vim.keymap.set('n', '<leader>t6', '6gt', { desc = '[T]ab [6]' })
  vim.keymap.set('n', '<leader>t7', '7gt', { desc = '[T]ab [7]' })
  vim.keymap.set('n', '<leader>t8', '8gt', { desc = '[T]ab [8]' })
  vim.keymap.set('n', '<leader>t9', '9gt', { desc = '[T]ab [9]' })
  vim.keymap.set('n', '<leader><tab>', ':tabnext<CR>', { desc = 'tab next' })
  vim.keymap.set('n', '<leader><s-tab>', ':tabprev<CR>', { desc = 'tab prev' })

  -- bind with which-key
  local status, wk = pcall(require, 'which-key')
  if status then
    wk.register {
      ['<leader>t'] = { name = 'Tab stuff', _ = 'which_key_ignore' },
    }
  end
end

--
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.updatetime = 500

-- Return to last edit position when opening files
vim.cmd [[
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
]]

tab_bindings()
return {}
