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
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          -- "__pycache__",
          ".git",
          ".vscode",
          ".DS_Store",
        },
        never_show = {
          ".php-cs-fixer.cache",
        },
        never_show_by_pattern = {
          ".null-ls_*",
        },
      },
    },
    window = {
      mappings = {
        -- Based on https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/370#discussioncomment-4144005
        -- TODO: Fix this
        ["Y"] = function(state)
          -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
          -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
          local node = state.tree:get_node()
          local filepath = node:get_id()
          local filename = node.name
          local modify = vim.fn.fnamemodify

          local results = {
            filepath,
            modify(filepath, ":."),
            modify(filepath, ":~"),
            filename,
            modify(filename, ":r"),
            modify(filename, ":e"),
          }

          -- absolute path to clipboard
          local i = vim.fn.inputlist({
            "Choose to copy to clipboard:",
            "1. Absolute path: " .. results[1],
            "2. Path relative to CWD: " .. results[2],
            "3. Path relative to HOME: " .. results[3],
            "4. Filename: " .. results[4],
            "5. Filename without extension: " .. results[5],
            "6. Extension of the filename: " .. results[6],
          })

          if i > 0 then
            local result = results[i]
            if not result then
              return print("Invalid choice: " .. i)
            end
            vim.fn.setreg('"', result)
          end
        end,
      },
    },
  },
}
