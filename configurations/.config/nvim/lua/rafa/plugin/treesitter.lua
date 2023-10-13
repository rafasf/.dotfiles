local M = {}

M.configure = require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    incremental_selection = { enable = true },
    indent = { enable = true },
    rainbow = { enable = true },
    ensure_installed = {
        "astro",
        "javascript",
        "html",
        "json",
        "lua",
        "make",
        "markdown",
        "rust",
        "typescript",
    },
}

return M
