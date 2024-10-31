require "nvchad.options"
require("nvim-tree").setup({
    view={side="right"}
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

vim.opt.scrolloff = 20
vim.opt.spell = true
vim.opt.spelllang = "en"
vim.opt.relativenumber = true
-- vim.highlight.priorities.semantic_tokens = 95
-- vim.cmd("highlight Warning guifg=black guibg=yellow")
-- vim.cmd("highlight Error guifg=white guibg=red")
-- vim.cmd("highlight DiagnosticWarning guifg=black guibg=yellow")
-- vim.cmd("highlight DiagnosticError guifg=white guibg=red")
-- vim.cmd("highlight DiagnosticFloatingError guifg=white guibg=red")
-- vim.cmd("highlight ErrorMsg guifg=white guibg=red")
-- vim.cmd("highlight WarningMsg guifg=white guibg=red")
-- vim.cmd("highlight st_lspError guifg=white guibg=red")
vim.cmd("highlight DiagnosticError guifg=white guibg=red")
vim.cmd("highlight DiagnosticWarning guifg=black guibg=yellow")
vim.cmd("highlight DiagnosticInfo guifg=blue guibg=white")
vim.cmd("highlight DiagnosticHint guifg=green guibg=white")
-- add yours here!

-- local o = vim.o
vim.o.cursorlineopt ='both' -- to enable cursorline!
vim.o.shell = 'pwsh'
