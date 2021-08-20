--
-- Load classic config
vim.cmd("source ~/.config/nvim/vimrc")

-- Load LSP config
require("lsp")

-- Load lualine
require("lualine").setup()
