local nnoremap = require("rafa.keybind").nnoremap
local vnoremap = require("rafa.keybind").vnoremap

vim.g.mapleader = ","

nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')

nnoremap("<leader>n", ":set invhls<CR>:set hls?<CR>")
nnoremap("^", ':setl hls<CR>:let @/="<C-r><C-w>"<CR>')

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
