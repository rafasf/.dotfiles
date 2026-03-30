return {
  "stevearc/oil.nvim",
  lazy = false,
  keys = {
    { "\\", "<cmd>Oil<cr>", desc = "Open parent directory" },
  },
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    view_options = {
      show_hidden = true,
    },
  },
}
