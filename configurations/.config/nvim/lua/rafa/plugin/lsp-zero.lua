return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    local lsp_zero = require("lsp-zero")
    lsp_zero.on_attach(function(client, bufnr)
      -- :help lsp-zero-keybindings
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "html",
        "jsonls",
        "gopls",
        "lua_ls",
        "rust_analyzer",
      },
      automatic_installation = false,
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require("lspconfig").lua_ls.setup(lua_opts)
        end,
      },
    })

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local cmp_format = require("lsp-zero").cmp_format({ details = true })

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      },
      format = cmp_format,
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),

        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        ["<C-y>"] = cmp.mapping.confirm({ select = true }),

        ["<C-Space>"] = cmp.mapping.complete(),

        ["<C-l>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
      }),
    })
  end,
}
