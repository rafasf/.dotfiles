local M = {}

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local attach_mappings = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

local function configure_lsp(capabilities)
    local lspconfig = require("lspconfig")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    lspconfig["bashls"].setup {
      on_attach = attach_mappings,
      capabilities = capabilities,
      cmd = {
        "nix-shell",
        "-p",
        "nodePackages.bash-language-server",
        "--run",
        "bash-language-server start"}
    }

    lspconfig["diagnosticls"].setup {
      on_attach = attach_mappings,
      capabilities = capabilities,
      cmd = {
        "nix-shell",
        "-p",
        "nodePackages.diagnostic-languageserver",
        "--run",
        "diagnostic-languageserver --stdio"}
    }

    lspconfig["html"].setup {
      on_attach = attach_mappings,
      capabilities = capabilities,
      cmd = {
        "nix-shell",
        "-p",
        "nodePackages.vscode-html-languageserver-bin",
        "--run",
        "html-languageserver --stdio"}
    }

    lspconfig["jsonls"].setup {
      on_attach = attach_mappings,
      capabilities = capabilities,
      cmd = {
        "nix-shell",
        "-p",
        "nodePackages.vscode-json-languageserver-bin",
        "--run",
        "json-languageserver --stdio"},
        commands = {
          Format = {
            function()
              vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
            end
          }
        }
    }

    lspconfig["rls"].setup {
      on_attach = attach_mappings,
      capabilities = capabilities,
      cmd = {
        "nix-shell",
        "-p",
        "rust-analyzer",
        "--run",
        "rls"}
    }

    lspconfig["clojure_lsp"].setup {
      on_attach = attach_mappings,
      capabilities = capabilities,
      cmd = {
        "nix-shell",
        "-p",
        "clojure-lsp",
        "--run",
        "clojure-lsp"}
    }

    -- lspconfig["tsserver"].setup {
    --   on_attach = attach_mappings,
    --   cmd = {
    --     "nix-shell",
    --     "-p",
    --     "nodePackages.typescript",
    --     "nodePackages.typescript-language-server",
    --     "--run",
    --     "typescript-language-server --stdio"}
    -- }

    lspconfig["denols"].setup {
      on_attach = attach_mappings,
      capabilities = capabilities,
      cmd = {
        "nix-shell",
        "-p",
        "deno",
        "--run",
        "deno lsp"}
    }

    lspconfig["gopls"].setup {
      on_attach = attach_mappings,
      capabilities = capabilities,
      cmd = {
        "nix-shell",
        "-p",
        "gopls",
        "--run",
        "gopls"}
    }

    lspconfig["elixirls"].setup {
      on_attach = attach_mappings,
      capabilities = capabilities,
      cmd = {
        "nix-shell",
        "-p",
        "elixir_ls",
        "--run",
        "elixir-ls"}
    }
end

local function configure_all()
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = false,
    })

    configure_lsp()
end

M.configure = configure_lsp

return M
