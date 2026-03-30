return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },
  {
    "williamboman/mason.nvim",
    dependencies = {
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "saghen/blink.cmp" },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
              end,
            })
          end
        end,
      })

      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = { disable = { "missing-fields" } },
          },
        },
      })

      require("mason").setup()
      require("mason-lspconfig").setup({ automatic_enable = true })
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- LSP
          "lua-language-server",
          "bash-language-server",
          "gopls",
          "rust-analyzer",
          "astro-language-server",
          "clojure-lsp",
          "elixir-ls",
          "html-lsp",
          "json-lsp",
          "marksman",
          "ocaml-lsp",
          "ruby-lsp",
          "tinymist",
          "vtsls",
          -- Linters
          "eslint_d",
          -- Formatters
          "stylua",
          "shfmt",
          "prettier",
          "ocamlformat",
          "templ",
          "rubocop",
        },
      })
    end,
  },
}
