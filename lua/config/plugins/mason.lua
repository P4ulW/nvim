return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = {
          "autopep8",
          "debugpy",
          "mypy",
          "ruff",
          "pyright",
          "ruff_lsp",
          "black",
        }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
}
