local set          = vim.opt
set.clipboard      = "unnamedplus"
set.grepprg        = "rg --vimgrep"
set.grepformat     = "%f:%l:%c:%m"

-- Basic settings
set.number         = true
set.relativenumber = true
set.scrolloff      = 10
set.breakindent    = true
set.showbreak      = '...'
set.signcolumn     = 'yes:1'
set.colorcolumn    = '80'
set.winborder      = "rounded"

-- indentation
set.shiftwidth     = 4
set.tabstop        = 4
set.expandtab      = true
set.autoindent     = true

-- spelling
set.spell          = true
set.spelllang      = "en"
--
-- Search settings
set.ignorecase     = true -- Case insensitive search
set.smartcase      = true -- Case sensitive if uppercase in search
set.hlsearch       = true -- Don't highlight search results
set.incsearch      = true -- Show matches as you type

-- File handling
set.backup         = false                           -- Don't create backup files
set.writebackup    = false                           -- Don't create backup before writing
set.swapfile       = false                           -- Don't create swap files
set.undofile       = true                            -- Persistent undo
set.undodir        = vim.fn.expand("~/.vim/undodir") -- Undo directory
set.updatetime     = 300                             -- Faster completion
set.timeoutlen     = 500                             -- Key timeout duration
set.ttimeoutlen    = 0                               -- Key code timeout
set.autoread       = true                            -- Auto reload files changed outside vim
set.autowrite      = false                           -- Don't auto save

-- Split behavior
set.splitbelow     = true -- Horizontal splits go below
set.splitright     = true -- Vertical splits go right


require("nvim-tree").setup({
  view = { side = "right" }
})


-- Tab display settings
set.showtabline = 1 -- Always show tabline (0=never, 1=when multiple tabs, 2=always)
set.tabline = ''    -- Use default tabline (empty string uses built-in)

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
