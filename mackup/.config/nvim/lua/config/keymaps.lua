-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

vim.keymap.set("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" })
vim.keymap.set("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" })
vim.keymap.set("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" })
vim.keymap.set("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to buffer 4" })
vim.keymap.set("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to buffer 5" })
vim.keymap.set("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "Go to buffer 6" })
vim.keymap.set("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "Go to buffer 7" })
vim.keymap.set("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "Go to buffer 8" })
vim.keymap.set("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "Go to buffer 9" })
