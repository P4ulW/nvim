require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
map("n", "<leader>gg", "<cmd> LazyGit <CR>")

map('i', '<C-BS>', '<C-W>', {noremap = true})
map('i', '<C-Del>', '<Esc>vedi', {noremap = true})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

