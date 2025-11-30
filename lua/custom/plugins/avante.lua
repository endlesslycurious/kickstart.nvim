# Use Avante for LLM integration, use either Copilot or Chat-GPT depending on environment variables being defined
return {
  "yetone/avante.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  build = "make",
  event = "VeryLazy",
  config = function()
    local opts = {
      provider = nil,
      providers = {},
    }

    if vim.env.GITHUB_TOKEN then
      opts.provider = "copilot"
      opts.providers.copilot = {
        api_key = vim.env.GITHUB_TOKEN,
        model = "gpt-4-copilot", -- change as needed
      }
    elseif vim.env.OPENAI_API_KEY then
      opts.provider = "openai"
      opts.providers.openai = {
        api_key = vim.env.OPENAI_API_KEY,
        model = "gpt-4.1-mini", -- change as needed
        extra_request_body = {
          temperature = 0.2,
          max_completion_tokens = 512,
        }
      }
    else
      vim.notify("Avante: no provider configured (set OPENAI_API_KEY or GITHUB_TOKEN)", vim.log.levels.WARN)
      return
    end

    require("avante").setup(opts)

    -- Unified keymaps
    vim.keymap.set("n", "<leader>a", "<cmd>AvanteAsk<cr>", { desc = "AI: start / resume chat" })
    vim.keymap.set("v", "<leader>ae", "<cmd>AvanteEdit<cr>", { desc = "AI: edit selection with instructions" })
    vim.keymap.set("n", "<leader>as", "<cmd>AvanteSuggest<cr>", { desc = "AI: get inline suggestion / code suggestion" })
  end,
}
