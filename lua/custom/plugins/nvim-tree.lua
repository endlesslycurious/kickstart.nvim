-- leader ee to toggle find file
-- leader ef to open file tree at current file

return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {
        hijack_netrw = false,
      }
      vim.keymap.set('n', '<leader>ee', ':NvimTreeFindFileToggle<CR>')
      vim.keymap.set('n', '<leader>ef', ':NvimTreeFindFile<CR>')
    end,
  },
}
