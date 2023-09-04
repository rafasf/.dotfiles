require("catppuccin").setup({
    flavour = "frappe", -- latte, frappe, macchiato, mocha
    background = {
        light = "latte",
        dark = "frappe",
    },
    transparent_background = true,
    term_colors = false,
    no_italic = false, -- Force no italic
    no_bold = false,   -- Force no bold
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
