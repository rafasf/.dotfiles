return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    local parsers = {
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "bash",
      "lua",
      "dockerfile",
      "gitignore",
      "make",
    }

    for _, parser in ipairs(parsers) do
      ts.install(parser):wait(3000)
    end

    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

    vim.api.nvim_create_autocmd("FileType", {
      pattern = parsers,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
