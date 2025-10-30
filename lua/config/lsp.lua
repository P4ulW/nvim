local map = vim.keymap.set

vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
})

vim.lsp.config('*', {
  root_markers = { '.git' },
})

vim.lsp.enable({
  "clangd",
  "lua_ls",
  "ruff",
  "rust_analyzer",
  "basedpyright",
})
