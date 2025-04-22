local map = vim.keymap.set

return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  config = function()
    vim.g.vimtex_view_general_viewer = 'okular'
    -- vim.g.vimtex_view_general_options = '--unique file:@pdf/#src:@line@tex'
    vim.g.tex_flavor = 'latex'
    map('n', "<space>ll", "<cmd>VimtexCompile<CR>")
  end,
}
