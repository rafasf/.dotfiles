local nnoremap = require("rafa.keybind").nnoremap

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
    })

    nnoremap("<leader>m", ":NvimTreeToggle<cr>")
    nnoremap("<leader>mf", ":NvimTreeFindFile<cr>")
  end,
}
