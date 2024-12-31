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
  end,
}
