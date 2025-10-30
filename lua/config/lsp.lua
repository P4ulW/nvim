local map = vim.keymap.set


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
