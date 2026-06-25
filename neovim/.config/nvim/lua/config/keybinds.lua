vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex, { desc = "Open file explorer" })

vim.keymap.set("n", "<A-h>", "<C-w><C-h>", { desc = "Focus: Move left" })
vim.keymap.set("n", "<A-l>", "<C-w><C-l>", { desc = "Focus: Move right" })
vim.keymap.set("n", "<A-j>", "<C-w><C-j>", { desc = "Focus: Move down" })
vim.keymap.set("n", "<A-k>", "<C-w><C-k>", { desc = "Focus: Move up" })

vim.keymap.set("n", "<A-v>", "<cmd>vsplit<cr>", { desc = "Split: Create vertical" })
vim.keymap.set("n", "<A-s>", "<cmd>split<cr>",  { desc = "Split: Create horizontal" })
vim.keymap.set("n", "<A-c>", "<cmd>close<cr>",  { desc = "Split: Close current" })

vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<CR>", { desc = "Split: Increase height", silent = true })
vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<CR>", { desc = "Split: Decrease height", silent = true })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<CR>", { desc = "Split: Decrease width", silent = true })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<CR>", { desc = "Split: Increase width", silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

vim.keymap.del("n", "gx") -- Remove default open URL bind
vim.keymap.set("n", "<leader>o", function()
    vim.ui.open(vim.fn.expand("<cfile>")) -- TODO: Improve this with treesitter
end, { desc = "Open URL under cursor" })
