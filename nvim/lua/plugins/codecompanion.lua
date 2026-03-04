return {
  {
    "olimorris/codecompanion.nvim",
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "gemini",
            model = "gemini-2.5-flash",
          },
          inline = {
            adapter = "gemini",
            model = "gemini-2.5-flash",
          },
        },
        adapters = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              env = {
                api_key = "api-key",
              },
            })
          end,
        },
      })
    end,
  },
}
