return {
  {
    "saghen/blink.cmp",
    dependencies = { "folke/lazydev.nvim" },

    version = "v1.*",
    opts = {
      keymap = { preset = "default" },

      appearance = {
        nerd_font_variant = "mono",
      },

      sources = {
        default = { "lsp", "path", "snippets", "lazydev" },
        providers = {
          lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
        },
      },

      snippets = { preset = "default" },
      fuzzy = { implementation = "lua" },
      signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
  },
}
