local highlight_group = vim.api.nvim_create_augroup(
  'YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    if vim.opt.buftype:get() == "terminal" then
      vim.cmd(":startinsert")
    end
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.opt_local.formatprg = "latexindent -m -l ~/.config/latexindent/localSettings.yaml -"
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
callback = function(args)
  local client = vim.lsp.get_client_by_id(args.data.client_id)
  if not client then return end

  if client.supports_method("textDocument/formatting") then
    -- Format the current buffer on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
      end,
    })
  end
end,
})

-- NOTE: The BufWritePre autocmd is not included here but is required to run the formatting.

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.tex",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd('normal! gggqG')
    vim.fn.winrestview(view)
  end,
})
