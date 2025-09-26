return {
  {
    'jpalardy/vim-slime',
    config = function()
      vim.g.slime_target = 'kitty'
      vim.g.slime_paste_file = vim.fn.tempname()
      vim.g.slime_bracketed_paste = 1
      vim.g.slime_cell_delimiter = "#%%"
      vim.keymap.set("n", "<C-c><C-c>", "<cmd>%SlimeSend<CR>")
    end,
  },
}
