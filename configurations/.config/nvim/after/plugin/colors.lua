require("catppuccin").setup({
    flavour = "frappe", -- latte, frappe, macchiato, mocha
    background = {
        light = "latte",
        dark = "frappe",
    },
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#E5C07B" })
