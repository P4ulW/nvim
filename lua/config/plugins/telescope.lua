return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').setup {
        theme = 'ivy',
        file_ignore_patterns = {
          ".git/", ".cache", "%.o", "%.a",
          "%.out", "%.pdf", "%.mkv", "%.mp4",
          "%.zip" },
      }

      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags, { desc = "  Tags" })
      vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files, { desc = "  Files" })
      vim.keymap.set("n", "<space>fb", require("telescope.builtin").buffers, { desc = "  Buffers" })
      vim.keymap.set("n", "<space>fs", require("telescope.builtin").lsp_document_symbols, { desc = "  LSP Symbols" })
      vim.keymap.set("n", "<space>fc", require("telescope.builtin").current_buffer_fuzzy_find,
        { desc = "  Current buffer" })
      vim.keymap.set("n", "<space>fg", require("telescope.builtin").live_grep, { desc = "  Live Grep" })
      vim.keymap.set("n", "<space>en", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
      vim.keymap.set("n", "<space>ep", function()
        require('telescope.builtin').find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end)
    end
  }
}
