require "nvchad.options"

require("nvim-tree").setup({
    view={side="right"}
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

vim.opt.scrolloff = 10
vim.opt.spell = true
vim.opt.spelllang = "en"
vim.opt.relativenumber = true
-- add yours here!

-- local o = vim.o
vim.o.cursorlineopt ='both' -- to enable cursorline!

-- set pwsh as windows terminal
local is_windows = vim.fn.environ()['OS'] == 'Windows_NT'
if is_windows then
  vim.opt.shell = 'pwsh'

end
