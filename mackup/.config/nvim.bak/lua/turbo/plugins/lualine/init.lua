return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    local lualine_config = require("turbo.plugins.lualine.setup")
    lualine_config.setup({
      float = false,
      separator = "bubble", -- bubble | triangle
      ---@type any
      colorful = true,
    })
    lualine_config.load()
  end,
};