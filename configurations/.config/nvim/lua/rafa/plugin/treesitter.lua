local M = {}

M.configure = require("nvim-treesitter.configs").setup {
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true },
    ensure_installed = {
        "astro",
        "help",
        "javascript",
        "json", 
        "lua",
        "make",
        "markdown",
        "rust",
        "typescript",
    },
}

return M

