return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  config = function()
    local conform = require("conform")

    conform.setup({
      default_format_opts = {
        stop_after_first = true,
      },
      formatters_by_ft = {
        sh = { "shfmt" },
        javascript = { "biome", "prettier", "deno_fmt" },
        typescript = { "biome", "prettier", "deno_fmt" },
        javascriptreact = { "biome", "prettier", "deno_fmt" },
        typescriptreact = { "biome", "prettier", "deno_fmt" },
        css = { "biome", "prettier" },
        html = { "biome", "prettier" },
        svg = { "prettier" },
        json = { "biome", "prettier" },
        yaml = { "biome", "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        ruby = { "rubocop" },
        go = { "gofmt" },
        rust = { "rustfmt" },
        ocaml = { "ocamlformat" },
        templ = { "templ" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })
  end,
}
