-- Neotest framework
return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- Add adapters for your specific language here
    'nvim-neotest/neotest-python', -- Python adapter
    'fredrikaverpil/neotest-golang', -- Go adapter
  },
  config = function()
    require('neotest').setup {
      adapters = {
        -- Python specific configuration
        require 'neotest-python' {
          dap = { justMyCode = false },
        },
        -- Go specific configuration
        require 'neotest-golang' {
          go_test_args = {
            '-v',
            '-race',
            '-count=1',
            '-coverprofile=' .. vim.fn.getcwd() .. '/coverage.out',
          },
        },
      },
    }

    -- key mappings
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map('n', '<leader>tn', ":lua require('neotest').run.run()<CR>", opts) -- Run nearest test
    map('n', '<leader>tf', ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts) -- Run file
    map('n', '<leader>ts', ":lua require('neotest').summary.toggle()<CR>", opts) -- Toggle summary window
    map('n', '<leader>to', ":lua require('neotest').output.open({ enter = true })<CR>", opts) -- Open test output
  end,
}
