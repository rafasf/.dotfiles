local nnoremap = require("rafa.keybind").nnoremap

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
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
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local builtin = require("telescope.builtin")
    nnoremap("<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
    nnoremap("<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    nnoremap("<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    nnoremap("<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    nnoremap("<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    nnoremap("<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    nnoremap("<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    nnoremap("<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    nnoremap("<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    nnoremap("<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
  end,
}
