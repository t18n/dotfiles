return {
  "loctvl842/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, position = "left", dir = require("turbo.util").get_root() })
      end,
      desc = "Explorer (root dir)",
      remap = true,
    },
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          position = "float",
          dir = require("turbo.util").get_root(),
        })
      end,
      desc = "Explorer Float (root dir)",
    },
  },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree")
      end
    end
  end,
  config = function()
    require("turbo.plugins.neo-tree.config")
  end,
};