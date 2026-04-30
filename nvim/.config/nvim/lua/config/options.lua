vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = false
vim.opt.splitbelow = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.iskeyword:append("-")
vim.opt.path:append("**")

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = '␣' }

vim.opt.inccommand = "split"

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.confirm = true

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end
})
