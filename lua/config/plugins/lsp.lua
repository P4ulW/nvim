local map = vim.keymap.set

local renamer = function()
  local api = vim.api
  local var = vim.fn.expand "<cword>"
  local buf = api.nvim_create_buf(false, true)
  local opts = { height = 1, style = "minimal", border = "rounded", row = 1, col = 1 }

  opts.relative, opts.width = "cursor", #var + 15
  opts.title, opts.title_pos = { { " Rename ", "@comment.danger" } }, "center"

  local win = api.nvim_open_win(buf, true, opts)
  vim.wo[win].winhl = "Normal:Normal,FloatBorder:Removed"
  api.nvim_set_current_win(win)

  api.nvim_buf_set_lines(buf, 0, -1, true, { " " .. var })

  vim.bo[buf].buftype = "prompt"
  vim.fn.prompt_setprompt(buf, "")
  vim.api.nvim_input "A"

  vim.keymap.set({ "i", "n" }, "<Esc>", "<cmd>q<CR>", { buffer = buf })

  vim.fn.prompt_setcallback(buf, function(text)
    local newName = vim.trim(text)
    api.nvim_buf_delete(buf, { force = true })

    if #newName > 0 and newName ~= var then
      local params = vim.lsp.util.make_position_params()
      params.newName = newName
      vim.lsp.buf_request(0, "textDocument/rename", params)
    end
  end)
end

local M = {}

-- taken from nvchad
M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "<space>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
  map("n", "<space>df", vim.diagnostic.open_float, opts "Show diagnostic float")
  map("n", "<space>ra", renamer, opts "Rename")

  map("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<space>D", vim.lsp.buf.type_definition, opts "Go to type definition")

  map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts "Code action")
  map("n", "gr", vim.lsp.buf.references, opts "Show references")
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        'saghen/blink.cmp',
      },
    },

    opts = {
      servers = {
        lua_ls = {

          settings = {
            Lua = {
              filetype = { "lua" },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = {
                  vim.fn.expand "$VIMRUNTIME/lua",
                  vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                  vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                  "${3rd}/luv/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
              },
            },
          },
        },
        pyright = {
          filetype = { "python" }
        },
        ruff = {
          filetype = { "python" },
          init_options = {
            settings = {
              lineLength = 80,
              lint = { enable = false },
            }
          },
        },

        clangd = {
          filetype = { "c" }
        },

        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {
              diagnostics = {
                enable = true,
              }
            }
          }
        },

      },
    },


    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        config.on_attach = M.on_attach
        lspconfig[server].setup(config)
      end


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
    end,
  }
}
