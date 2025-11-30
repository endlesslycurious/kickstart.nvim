# Configure copilot for use in NeoVim
return {
  {
    "zbirenbaum/copilot.lua",
    lazy = false,              -- ← force load at startup
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
        },
      })
    end,
  },
}
