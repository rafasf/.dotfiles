local nnoremap = require("rafa.keybind").nnoremap

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
    })

    telescope.load_extension("fzf")

    nnoremap("<leader>ff", "<cmd>Telescope find_files find_command=fd,--type,f,--hidden,--exclude,.git<cr>")
    nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
    nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
  end,
}
