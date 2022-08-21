local M = {}

local function configure()
    local null_ls = require("null-ls")

    local null_ls_sources = {
        null_ls.builtins.diagnostics.vale,
        null_ls.builtins.completion.vsnip,
        null_ls.builtins.diagnostics.markdownlint.with({
            command = "nix-shell",
            args = {
                "-p",
                "nodePackages_latest.markdownlint-cli",
                "--run",
                "markdownlint --stdin"
            }
        }),

        null_ls.builtins.diagnostics.yamllint.with({
            command = "nix-shell",
            args = {
                "-p",
                "yamllint",
                "--run",
                "yamllint --format parsable -"
            }
        }),

        null_ls.builtins.formatting.prettier.with({
            command = "nix-shell",
            args = {
                "-p",
                "nodePackages.prettier",
                "--run",
                "prettier"
            }
        })
    }

    null_ls.setup {
        sources = null_ls_sources
    }
end

M.configure = configure

return M
