return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.after.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.after.event_exited["dapui_config"] = function ()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft="python",
    dependencies={
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap",
    },
    config = function (_, opts)
      local path = "~/.local/share/nvim/mason/packages/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        "autopep8",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
        "ruff_lsp",
        "black",
      }
    }
  },
  {
    "stevearc/conform.nvim",
  -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
    }
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    'vskrishna1082/vim-cytosim',
    lazy=false,
  },
  {
    'stevearc/aerial.nvim',
    lazy = false,
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "python"
      },
    },
  },
  {
    "chadvoegele/nvim-slime",
    ft={"python"},
  },
  {
    'jpalardy/vim-slime',
    config = function()
      vim.g.slime_target = 'tmux'
      vim.g.slime_paste_file = vim.fn.tempname()
      vim.g.slime_bracketed_paste = 1
    end,
  },
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    config = function()
       vim.g.vimtex_view_general_viewer = 'okular'
    end,
  },
  {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {},
      lazy=false,
  },
}
