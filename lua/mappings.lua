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

map('n', '<leader>a', ':AerialToggle!<CR>')
map('n', '<C-p>', 'vip')

map('n', '<leader>rf', function ()
    local ft = vim.bo.filetype
    local file = vim.fn.expand('%')
    if ft == 'python' then
      require('nvchad.term').runner {
        pos = 'float',
        cmd = 'python ' .. file,
        id = 'floatTerm',
      }
    end
    if ft == 'c' then
      require('nvchad.term').runner {
        pos = 'float',
        cmd = 'clear && gcc -o out ' .. file .. ' && ./out',
        id = 'floatTerm',
      }
    end
  end,
  {desc='run file in terminal'})

local M = {}
M.dap = {
  plugin = true,
  n = {
    ['<leader>db'] = {'<cmd> DapToggleBreakpoint <CR>'}
  }
}
M.dap_python = {
  plugin = true,
  n = {
    ['<leader>dpr'] = {
      function ()
        require('dap_python').test_method()
      end
    }
  }
}
return M
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

