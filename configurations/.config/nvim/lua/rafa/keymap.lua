local nnoremap = require("rafa.keybind").nnoremap
local vnoremap = require("rafa.keybind").vnoremap

vim.g.mapleader = ","

nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')

nnoremap("<leader>n", ":set invhls<CR>:set hls?<CR>")

nnoremap("<leader>h", ":wincmd h<CR>")
nnoremap("<leader>j", ":wincmd j<CR>")
nnoremap("<leader>k", ":wincmd k<CR>")
nnoremap("<leader>l", ":wincmd l<CR>")

nnoremap("^", ':setl hls<CR>:let @/="<C-r><C-w>"<CR>')
