-- Clear search highlight with <Esc> in normal mode
vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR>")

-- Center screen while cycling
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Remap jk / kj to <ESC> to exit insert mode
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("i", "kj", "<ESC>", { noremap = true })
