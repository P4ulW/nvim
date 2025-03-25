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

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     require("rose-pine").setup({
--       variant = "dawn",
--       styles = {
--         italic = true,
--         transparency = true,
--       },
--       highlight_groups = {
--         ["@variable"] = { fg = "text", italic = false },
--         ["@variable.parameter"] = { fg = "iris", italic = true },
--         ["@property"] = { fg = "foam", italic = false },
--         ["@variable.builtin"] = { fg = "love", bold = false, italic = true },
--       },
--     })
--     vim.cmd("colorscheme rose-pine")
--   end
-- }

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false,
      no_bold = false,
      no_underline = false,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "bold" },
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {},
      custom_highlights = {},
      default_integrations = true,
      integrations = {
        blink_cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        harpoon = true,
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
