local M = {}

local function configure()
    local nnoremap = require("rafa.keybind").nnoremap
    nnoremap("<leader>t", ":FzfLua files<CR>")
    nnoremap("<leader>b", ":FzfLua buffers<CR>")
end

M.configure = configure

return M
