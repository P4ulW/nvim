local augroup = vim.api.nvim_create_augroup("LspFormtatting", {})
local null_ls = require("null-ls")

local opts = {
  sources = {
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.formatting.autopep8,
  },
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds(
        {
          group = augroup,
          buffer = bufnr,
        })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({bufnr = bufnr})
        end,
      })
      vim.diagnostic.config({
        virtualtext = false,
        severity_highlights = {
          Error = { hl = "DiagnosticError" },
          Warning = { hl = "DiagnosticWarning" },
          Information = { hl = "DiagnosticInfo" },
          Hint = { hl = "DiagnosticHint" },
        },
      })
    end
  end,
}
return opts
