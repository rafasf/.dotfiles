local lspconfig = require("lspconfig")
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
  }
})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "<C-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

  -- Format file or range
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("x", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Highlight variable and usages in the current buffer
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi link LspReferenceRead Visual
      hi link LspReferenceText Visual
      hi link LspReferenceWrite Visual
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Set up capabilities
local capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig["bashls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "nix-shell",
    "-p",
    "nodePackages.bash-language-server",
    "--run",
    "bash-language-server start"}
}

lspconfig["diagnosticls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "nix-shell",
    "-p",
    "nodePackages.diagnostic-languageserver",
    "--run",
    "diagnostic-languageserver --stdio"}
}

lspconfig["html"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "nix-shell",
    "-p",
    "nodePackages.vscode-html-languageserver-bin",
    "--run",
    "vscode-html-language-server --stdio"}
}

lspconfig["jsonls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "nix-shell",
    "-p",
    "nodePackages.vscode-json-languageserver-bin",
    "--run",
    "vscode-json-language-server --stdio"}
}

lspconfig["rls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "nix-shell",
    "-p",
    "rust-analyzer",
    "--run",
    "rls"}
}

lspconfig["clojure_lsp"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "nix-shell",
    "-p",
    "clojure-lsp",
    "--run",
    "clojure-lsp"}
}

lspconfig["tsserver"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "nix-shell",
    "-p",
    "nodePackages.typescript",
    "nodePackages.typescript-language-server",
    "--run",
    "typescript-language-server --stdio"}
}

-- The following settings works with the bleeding edge neovim.
-- See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
