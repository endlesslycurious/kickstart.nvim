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
    -- Default provider: GitHub Copilot (via the Copilot plugin)
    local opts = {
      provider = "copilot",
      providers = {
        copilot = {
          -- model = "gpt-4.1",
        },
      },
    }

    -- Optional: add OpenAI as a secondary provider when the env var is present
    if vim.env.OPENAI_API_KEY then
      opts.providers.openai = {
        api_key = vim.env.OPENAI_API_KEY,
        model = "gpt-4.1-mini",
        extra_request_body = {
          temperature = 0.2,
          max_completion_tokens = 512,
        },
      }
    end

    require("avante").setup(opts)

    -- Your unified keymaps
    vim.keymap.set("n", "<leader>a",  "<cmd>AvanteAsk<cr>",     { desc = "AI: start / resume chat" })
    vim.keymap.set("v", "<leader>ae", "<cmd>AvanteEdit<cr>",    { desc = "AI: edit selection with instructions" })
    vim.keymap.set("n", "<leader>as", "<cmd>AvanteSuggest<cr>", { desc = "AI: get inline suggestion / code suggestion" })
  end,
}
