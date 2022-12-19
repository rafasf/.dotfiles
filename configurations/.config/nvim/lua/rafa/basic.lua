vim.wo.wrap = false
vim.wo.linebreak = false
vim.wo.list = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.textwidth = 80
vim.wo.colorcolumn = "+1"

vim.opt.cursorline = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.wildignore = {"*.o", "*.a", "*.so", "*.swp", "__pycache__", "node_modules"}

vim.opt.completeopt = {"menu", "menuone", "noselect"}

vim.opt.list = true
vim.opt.listchars:append "eol:↴"

vim.opt.termguicolors = true
