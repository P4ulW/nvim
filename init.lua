vim.opt.termguicolors = true
vim.loader.enable()
require("config.lazy")
require("options.options")
require("options.mapping")
require("options.groups")
require("config.lsp")
require("custom.floaterminal")

vim.g.vscode_snippets_path = "./lua/snippets"
