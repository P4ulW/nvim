vim.g.iron_map_defaults = 0
return {
  {
    "vigemus/iron.nvim",
    vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<CR>'),
    config = function()
      require("iron.core").setup({
        config = {
          python = {
            command = { 'ipython', '-i', '--no-autoindent', '--nosep' },
            format = require("iron.fts.common").bracketed_paste_python
          },
          repl_open_cmd = "vertical botright 80 split",
        },
        keymaps = {
          send_motion = "<space>sc",
          visual_send = "<space>sc",
          send_file = "<space>sf",
          send_line = "<space>sl",
          send_paragraph = "<space>sp",
          send_until_cursor = "<space>su",
          send_mark = "<space>sm",
          mark_motion = "<space>mc",
          mark_visual = "<space>mc",
          remove_mark = "<space>md",
          cr = "<space>s<cr>",
          interrupt = "<space>s<space>",
          exit = "<space>sq",
          clear = "<space>cl",
        },
        ignore_blank_lines = true,
      })
    end
  }
}
