return {
  "folke/which-key.nvim",
  optional = true,
  opts = {
    defaults = {
      ["<leader>t"] = { name = "+test" },
      ["<leader>d"] = { name = "+debug" },
      ["<leader>da"] = { name = "+adapters" },
    },
  },
}
