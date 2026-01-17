vim.wo.wrap = false
vim.wo.linebreak = false
vim.wo.list = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.textwidth = 80

vim.wo.colorcolumn = "+1"

vim.opt.cursorline = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.clipboard = "unnamedplus"

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.wildignore = { "*.o", "*.a", "*.so", "*.swp", "__pycache__", "node_modules" }

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.termguicolors = true

vim.opt.scrolloff = 10

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  virtual_text = true,
})

-- Enable undo file
-- Default XDG_STATE_HOME if needed
if vim.env.XDG_STATE_HOME == nil or vim.env.XDG_STATE_HOME == "" then
  vim.env.XDG_STATE_HOME = vim.env.HOME .. "/.local/state"
end

local undodir = vim.env.XDG_STATE_HOME .. "/nvim/undo"

-- Create the directory if it doesn't exist
vim.fn.mkdir(undodir, "p", "448") -- 448 = 0700 in decimal

vim.opt.undofile = true
vim.opt.undodir = undodir
