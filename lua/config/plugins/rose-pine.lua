return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      variant = "dark",
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
