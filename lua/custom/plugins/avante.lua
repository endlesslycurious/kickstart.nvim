# Use Avante for LLM integration, with Github Copilot.
return {
  "yetone/avante.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  build = "make",
  event = "VeryLazy",
  config = function()
    -- Configuration for Copilot as a provider only
    local opts = {
      provider = "copilot",
      providers = {
        copilot = {
          -- Default model balancing cost and performance
          model = "gpt-5-mini",
        }
      },
    }

    require("avante").setup(opts)

    -- Your unified keymaps
    vim.keymap.set("n", "<leader>a",  "<cmd>AvanteAsk<cr>",     { desc = "AI: start / resume chat" })
    vim.keymap.set("v", "<leader>ae", "<cmd>AvanteEdit<cr>",    { desc = "AI: edit selection with instructions" })
    vim.keymap.set("n", "<leader>as", "<cmd>AvanteSuggest<cr>", { desc = "AI: get inline suggestion / code suggestion" })
  end,
}
