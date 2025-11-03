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
    local provider = "none"
    local opts = {}

    -- Work setup: Copilot
    if vim.env.GITHUB_TOKEN then
      provider = "copilot"
      opts = {
        provider = "copilot",
        copilot = {
          api_key = vim.env.GITHUB_TOKEN,
          model = "gpt-4-copilot", -- adjust if needed
        },
      }
    end

    -- Home setup: OpenAI
    if vim.env.OPENAI_API_KEY then
      provider = "openai"
      opts = {
        provider = "openai",
        openai = {
          api_key = vim.env.OPENAI_API_KEY,
          model = "gpt-5",
          temperature = 0.7,
          max_tokens = 2000,
        },
      }
    end

    -- Fallback if no provider is active
    if provider == "none" then
      vim.notify("Avante: no provider configured (set OPENAI_API_KEY or GITHUB_TOKEN)", vim.log.levels.WARN)
      return
    end

    require("avante").setup(opts)

    -- Unified keymaps for both backends
    vim.keymap.set("n", "<leader>a", "<cmd>AvanteAsk<cr>", { desc = "AI: start / resume chat" })
    vim.keymap.set("v", "<leader>ae", "<cmd>AvanteEdit<cr>", { desc = "AI: edit selection with instructions" })
    vim.keymap.set("n", "<leader>as", "<cmd>AvanteSuggest<cr>", { desc = "AI: get inline suggestion / code suggestion" })
  end,
}
