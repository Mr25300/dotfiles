vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex, { desc = "Open file explorer" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

vim.keymap.set("n", "<A-h>", "<C-w><C-h>", { desc = "Focus: Move left" })
vim.keymap.set("n", "<A-l>", "<C-w><C-l>", { desc = "Focus: Move right" })
vim.keymap.set("n", "<A-j>", "<C-w><C-j>", { desc = "Focus: Move down" })
vim.keymap.set("n", "<A-k>", "<C-w><C-k>", { desc = "Focus: Move up" })

vim.keymap.set("n", "<A-H>", "<C-w>H", { desc = "Split: Move left" })
vim.keymap.set("n", "<A-L>", "<C-w>L", { desc = "Split: Move right" })
vim.keymap.set("n", "<A-J>", "<C-w>J", { desc = "Split: Move down" })
vim.keymap.set("n", "<A-K>", "<C-w>K", { desc = "Split: Move up" })

vim.keymap.set("n", "<A-v>", "<cmd>vsplit<cr>", { desc = "Split: Create vertical" })
vim.keymap.set("n", "<A-s>", "<cmd>split<cr>", { desc = "Split: Create horizontal" })
vim.keymap.set("n", "<A-c>", "<cmd>close<cr>", { desc = "Split: Close current" })
vim.keymap.set("n", "<A-w>", "<cmd>only<cr>", { desc = "Split: Close all but current" })

vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<CR>", { desc = "Split: Increase height", silent = true })
vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<CR>", { desc = "Split: Decrease height", silent = true })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<CR>", { desc = "Split: Decrease width", silent = true })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<CR>", { desc = "Split: Increase width", silent = true })

vim.keymap.set("n", "<A-t>", "<cmd>tab split<CR>", { desc = "Tab: Create new empty" })
vim.keymap.set("n", "<A-T>", "<cmd>tabclose<CR>", { desc = "Tab: Close current" })
vim.keymap.set("n", "<A-p>", "<cmd>tabprevious<CR>", { desc = "Tab: Move to previous" })
vim.keymap.set("n", "<A-n>", "<cmd>tabnext<CR>", { desc = "Tab: Move to next" })

vim.keymap.set("n", "<leader>o", "gx", { desc = "Open: File" })
vim.keymap.set("n", "<A-f>", "<C-w>f", { desc = "Open: In horizontal split" })
vim.keymap.set("n", "<A-F>", "<cmd>vsplit <cfile><CR>", { desc = "Open: In vertical split" })
vim.keymap.set("n", "<A-gf>", "<C-w>gf", { desc = "Open: In new tab" })
