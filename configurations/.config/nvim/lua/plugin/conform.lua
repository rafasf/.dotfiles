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
      formatters_by_ft = {
        sh = { "shfmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        astro = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        svg = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
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
