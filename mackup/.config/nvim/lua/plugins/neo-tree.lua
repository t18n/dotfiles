return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  opts = {
    default_component_configs = {
      indent = {
        expander_collapsed = "",
        expander_expanded = "",
      },
    },
    -- show absolute line number by default
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.wo.number = true
        end,
      },
    },
  },
}