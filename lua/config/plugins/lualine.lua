return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = { theme = 'rose-pine' }
      -- options = { theme = 'catppuccin' }
    })
  end
}
