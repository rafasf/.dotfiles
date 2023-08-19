local lsp = require("lsp-zero")
local cmp = require('cmp')

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "html",
    "jsonls",
    "gopls",
    "lua_ls",
    "rust_analyzer",
})

lsp.set_preferences({
    suggest_lsp_servers = false,
})

vim.diagnostic.config({
    virtual_text = true,
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()
end)


cmp.setup({
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        })
    }
})

lsp.setup()

require("mason-null-ls").setup({
    ensure_installed = {
        "prettier"
    },
    automatic_installation = false,
    handlers = {},
})
require("null-ls").setup({
    sources = {
        -- Anything not supported by mason.
    }
})
