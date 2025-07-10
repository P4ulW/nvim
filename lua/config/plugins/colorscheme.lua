-- return {
--   "rebelot/kanagawa.nvim",
--   name = "kanagawa",
--   config = function()
--     require('kanagawa').setup({
--       compile = false,  -- enable compiling the colorscheme
--       undercurl = true, -- enable undercurls
--       commentStyle = { italic = true },
--       functionStyle = {},
--       keywordStyle = { italic = true },
--       statementStyle = { bold = true },
--       typeStyle = {},
--       transparent = false,   -- do not set background color
--       dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
--       terminalColors = true, -- define vim.g.terminal_color_{0,17}
--       theme = "dragon",      -- Load "wave" theme
--       background = {         -- map the value of 'background' option to a theme
--         dark = "dragon",     -- try "dragon" !
--         light = "dragon"
--       },
--     })
--     vim.cmd("colorscheme kanagawa")
--   end
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

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup({
--       flavour = "mocha",
--       background = {
--         light = "latte",
--         dark = "mocha",
--       },
--       transparent_background = false,
--       show_end_of_buffer = false,
--       term_colors = false,
--       dim_inactive = {
--         enabled = false,
--         shade = "dark",
--         percentage = 0.15,
--       },
--       no_italic = false,
--       no_bold = false,
--       no_underline = false,
--       styles = {
--         comments = { "italic" },
--         conditionals = { "italic" },
--         loops = {},
--         functions = {},
--         keywords = { "italic" },
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = { "bold" },
--         properties = {},
--         types = {},
--         operators = {},
--         -- miscs = {}, -- Uncomment to turn off hard-coded styles
--       },
--       color_overrides = {},
--       custom_highlights = {},
--       default_integrations = true,
--       integrations = {
--         blink_cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         treesitter = true,
--         notify = false,
--         harpoon = true,
--       },
--     })
--     vim.cmd.colorscheme "catppuccin"
--   end
-- }
