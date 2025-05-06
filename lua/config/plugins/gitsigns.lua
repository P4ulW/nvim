return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({ ']c', bang = true })
            else
              gitsigns.nav_hunk('next')
            end
          end)

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({ '[c', bang = true })
            else
              gitsigns.nav_hunk('prev')
            end
          end)

          -- Actions
          map('n', '<space>hs', gitsigns.stage_hunk, { desc = "stage hunk" })
          map('n', '<space>hr', gitsigns.reset_hunk, { desc = "reset hunk" })
          map('v', '<space>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
            { desc = "stage hunk visual" })
          map('v', '<space>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
            { desc = "reset hunk visual" })
          map('n', '<space>hS', gitsigns.stage_buffer, { desc = "stage buffer" })
          map('n', '<space>hu', gitsigns.undo_stage_hunk, { desc = "undo stage buffer" })
          map('n', '<space>hR', gitsigns.reset_buffer, { desc = "reset buffer" })
          map('n', '<space>hp', gitsigns.preview_hunk, { desc = "preview hunk" })
          map('n', '<space>hb', function() gitsigns.blame_line { full = true } end, { desc = "blame line" })
          map('n', '<space>tb', gitsigns.toggle_current_line_blame, { desc = "toggle line blame" })
          map('n', '<space>hd', gitsigns.diffthis, { desc = "diff this" })
          map('n', '<space>hD', function() gitsigns.diffthis('~') end, { desc = "diff this" })
          map('n', '<space>td', gitsigns.toggle_deleted, { desc = "toggle deleted" })
        end
      })
    end
  }
}
