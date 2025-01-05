local map = vim.keymap.set
return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
  },
  map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })
}
