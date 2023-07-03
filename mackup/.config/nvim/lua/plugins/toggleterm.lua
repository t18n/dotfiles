return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      close_on_exit = true, -- close the terminal window when the process exits
      autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
      auto_scroll = true, -- automatically scroll to the bottom on terminal output
      persist_size = true,
      persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
      start_in_insert = true,

      winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end,
      },
      float_opts = {
        border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        winblend = 3,
      },
    },
    keys = {
      -- { [[<C-\>]] }, -- Open mapping
      -- Caveats: Having multiple terminals with different directions open at the same time is unsupported
      { "<leader>wt", "<Cmd>ToggleTerm direction=horizontal<Cr>", desc = "Open horizontal terminal" },
      -- { "<leader>w|", "<Cmd>ToggleTerm direction=vertical<Cr>", desc = "Open vertical terminal" },
      { "<leader>wT", "<Cmd>TermSelect<Cr>", desc = "Select opened terminals" },
    },
  },
}
