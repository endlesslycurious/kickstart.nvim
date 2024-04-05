-- leader ct to toggle context view

return {
  -- tree-sitter context, displays context at top of buffer
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = { 'nvim-treesitter' },
  config = function()
    require('treesitter-context').setup {
      enable = true,
      throttle = true,
    }
    vim.keymap.set('n', '<leader>ct', ':TSContextToggle<CR>', { desc = 'toggle treesitter [c]ontext view' })
  end,
}
