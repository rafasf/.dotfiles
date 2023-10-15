local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.DEBUG,
    -- All formatter configurations are opt-in
    filetype = {
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        html = { require("formatter.defaults.prettier")("html") },
        css = { require("formatter.defaults.prettier")("css") },
        json = { require("formatter.defaults.prettier")("json") },
        javascript = { require("formatter.defaults.prettier") },
        javascriptreact = { require("formatter.defaults.prettier") },
        typescript = { require("formatter.defaults.prettier") },
        typescriptreact = { require("formatter.defaults.prettier") },
        sh = {
            require("formatter.filetypes.sh").shfmt,
        },
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}

-- Format on save
local group = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*",
    command = "FormatWrite",
    group = group
})
