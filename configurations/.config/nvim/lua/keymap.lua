vim.g.mapleader = ","

vim.keymap.set("n", "<leader>n", ":set invhls<CR>:set hls?<CR>", { desc = "Toggle search highlight" })
vim.keymap.set("n", "^", ':setl hls<CR>:let @/="<C-r><C-w>"<CR>', { desc = "Highlight word under cursor" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Paste over a visual selection without clobbering the clipboard/unnamed register:
-- normally `p` in visual mode yanks the replaced selection first, overwriting
-- whatever you just copied. Route the replaced text to the black hole register instead.
vim.keymap.set("x", "p", '"_dP', { desc = "Paste over selection without overwriting register" })
