-- Neotest framework

vim.pack.add {
    'https://github.com/nvim-neotest/neotest',
    'https://github.com/nvim-neotest/nvim-nio',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/antoinemadec/FixCursorHold.nvim',
    'https://github.com/nvim-neotest/neotest-python',
    'https://github.com/fredrikaverpil/neotest-golang',
}

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

-- Key mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>tn', function() require('neotest').run.run() end,
    vim.tbl_extend('force', opts, { desc = 'Run nearest test' }))
map('n', '<leader>tf', function() require('neotest').run.run(vim.fn.expand '%') end,
    vim.tbl_extend('force', opts, { desc = 'Run test file' }))
map('n', '<leader>ts', function() require('neotest').summary.toggle() end,
    vim.tbl_extend('force', opts, { desc = 'Toggle test summary' }))
map('n', '<leader>to', function() require('neotest').output.open { enter = true } end,
    vim.tbl_extend('force', opts, { desc = 'Open test output' }))
