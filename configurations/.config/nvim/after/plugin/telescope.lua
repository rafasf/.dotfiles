local nnoremap = require("rafa.keybind").nnoremap

local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.load_extension("fzf")

local function find_files()
    return builtin.find_files({
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }
    })
end

nnoremap("<leader>ff", find_files)
nnoremap("<leader>fg", builtin.live_grep)
nnoremap("<leader>fb", builtin.buffers)
nnoremap("<leader>fh", builtin.help_tags)
