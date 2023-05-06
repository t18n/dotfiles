return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
  keys = { { "<leader>0", "<cmd>Dashboard<CR>", desc = "Dashboard" } },
  config = function()
    require("turbo.plugins.dashboard.config")
  end,
};