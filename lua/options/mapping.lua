local map = vim.keymap.set

-- insert mode nav
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- window nav
map({ "n", "t" }, "<C-h>", "<C-w>h", { desc = "switch window left" })
map({ "n", "t" }, "<C-l>", "<C-w>l", { desc = "switch window right" })
map({ "n", "t" }, "<C-j>", "<C-w>j", { desc = "switch window down" })
map({ "n", "t" }, "<C-k>", "<C-w>k", { desc = "switch window up" })
map({ "n" }, "<leader>x", "<cmd>bunload <CR>", { desc = "unload current buffer" })

-- highlight clearing for searching etc.
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })


-- floaterminal
map({ 'n', 't' }, "<A-i>", "<cmd>Floaterminal<CR>", { desc = "toggle floaterminal" })


-- Center screen when jumping
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Better indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Buffer navigation
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })


-- LSP
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "<space>sh", vim.lsp.buf.signature_help, { desc = "Show signature help" })
map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
map("n", "<space>df", function() vim.diagnostic.open_float { border = "rounded" } end, { desc = "Show diagnostic float" })

map("n", "<space>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

map("n", "<space>D", vim.lsp.buf.type_definition, { desc = "Go to type definition" })

map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
