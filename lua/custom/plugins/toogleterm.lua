-- \\ to toggle terminal window, remeber to hit i to interact
-- Setup normal window/buffer switch commands

return {
  'akinsho/toggleterm.nvim',
  version = 'v2.*',
  priority = 999,
  config = function()
    require('toggleterm').setup { enable = true }
    vim.keymap.set('n', '<C-\\><C-\\>', ':ToggleTerm<CR>', { desc = 'toggle terminal' })
    vim.keymap.set('t', '<C-\\><C-\\>', '<C-\\><C-n>:ToggleTerm<CR>', { desc = 'toggle terminal' })
    vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>', { desc = 'exit insert mode on terminal' })
    if vim.fn.exists 't:zoomwintab' then
      vim.keymap.set('t', '<C-w>o', [[<Cmd>ZoomWinTabToggle<CR>]], { desc = 'zoom window' })
    end
    vim.keymap.set('t', '<C-w>j', [[<Cmd>wincmd j<CR>]], {})
    vim.keymap.set('t', '<C-w>k', [[<Cmd>wincmd k<CR>]], {})
    vim.keymap.set('t', '<C-w><C-j>', [[<Cmd>wincmd j<CR>]], {})
    vim.keymap.set('t', '<C-w><C-k>', [[<Cmd>wincmd k<CR>]], {})
    vim.keymap.set('t', '<C-w><up>', [[<Cmd>wincmd k<CR>]], {})
    vim.keymap.set('t', '<C-w><down>', [[<Cmd>wincmd j<CR>]], {})
  end,
} -- toggleterm
