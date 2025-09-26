local set            = vim.opt
local map            = vim.keymap.set
set.clipboard        = "unnamedplus"
set.grepprg          = "rg --vimgrep"
set.grepformat       = "%f:%l:%c:%m"

-- Basic settings
set.number           = true
set.relativenumber   = true
set.scrolloff        = 10
set.breakindent      = true
set.showbreak        = '...'
set.signcolumn       = 'yes:1'
set.colorcolumn      = '80'

-- indentation
set.shiftwidth       = 4
set.tabstop          = 4
set.expandtab        = true
set.autoindent       = true

-- spelling
set.spell            = true
set.spelllang        = "en"
--
-- Search settings
set.ignorecase       = true -- Case insensitive search
set.smartcase        = true -- Case sensitive if uppercase in search
set.hlsearch         = true -- Don't highlight search results
set.incsearch        = true -- Show matches as you type

-- File handling
set.backup           = false                           -- Don't create backup files
set.writebackup      = false                           -- Don't create backup before writing
set.swapfile         = false                           -- Don't create swap files
set.undofile         = true                            -- Persistent undo
set.undodir          = vim.fn.expand("~/.vim/undodir") -- Undo directory
set.updatetime       = 300                             -- Faster completion
set.timeoutlen       = 500                             -- Key timeout duration
set.ttimeoutlen      = 0                               -- Key code timeout
set.autoread         = true                            -- Auto reload files changed outside vim
set.autowrite        = false                           -- Don't auto save

-- Split behavior
set.splitbelow       = true -- Horizontal splits go below
set.splitright       = true -- Vertical splits go right

-- Key mappings
vim.g.mapleader      = " " -- Set leader key to space
vim.g.maplocalleader = " " -- Set local leader key (NEW)


require("nvim-tree").setup({
  view = { side = "right" }
})


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

-- Tab display settings
set.showtabline = 1 -- Always show tabline (0=never, 1=when multiple tabs, 2=always)
set.tabline = ''    -- Use default tabline (empty string uses built-in)

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

-- set pwsh as windows terminal
if vim.g.neovide then
  local is_windows = vim.fn.environ()['OS'] == 'Windows_NT'
  if is_windows then
    set.shell = 'pwsh'
  end

  -- neovide
  vim.o.guifont = "IosevkaIBM Nerd Font:h13" -- text below applies for VimScript

  local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  end
  vim.g.neovide_opacity = 0.0
  vim.g.transparency = 0.8
  vim.g.neovide_background_color = "#0f1117" .. alpha()
end
