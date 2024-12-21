local set = vim.opt
local map = vim.keymap.set
set.clipboard = "unnamedplus"


require("nvim-tree").setup({
  view = { side = "right" }
})
vim.g.vscode_snippets_path = "./lua/snippets"

local highlight_group = vim.api.nvim_create_augroup(
  'YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    if vim.opt.buftype:get() == "terminal" then
      vim.cmd(":startinsert")
    end
  end
})

-- insert mode nav
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- window nav
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- highlight clearing for searching etc.
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })


-- floaterminal
map({ 'n', 't' }, "<A-f>", "<cmd>Floaterminal<CR>", { desc = "toggle floaterminal" })


set.scrolloff      = 10
set.spell          = true
set.spelllang      = "en"
set.relativenumber = true
set.breakindent    = true
set.showbreak      = '...'
set.signcolumn     = 'yes:2'
set.colorcolumn    = '80'


-- set pwsh as windows terminal
local is_windows = vim.fn.environ()['OS'] == 'Windows_NT'
if is_windows then
  set.shell = 'pwsh'
end
