-- return {
--   {
--     'deparr/tairiki.nvim',
--     lazy = false,
--     priority = 1000, -- only necessary if you use tairiki as default theme
--     config = function()
--       require('tairiki').setup {
--         -- optional configuration here
--       }
--       require('tairiki').load() -- only necessary to use as default theme, has same behavior as ':colorscheme tairiki'
--     end,
--   }
-- }

return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      variant = "moon",
      styles = {
        italic = true,
        transparency = true,
      },
      highlight_groups = {
        ["@variable"] = { fg = "text", italic = false },
        ["@variable.parameter"] = { fg = "iris", italic = true },
        ["@property"] = { fg = "foam", italic = false },
        ["@variable.builtin"] = { fg = "love", bold = false, italic = true },
      },
    })
    vim.cmd("colorscheme rose-pine")
  end
}
