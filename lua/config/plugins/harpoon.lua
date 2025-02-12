local map = vim.keymap.set

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon").setup()
    map("n", "<space>ha", function() harpoon:list():add() end, { desc = "harpoon current file" })
    map("n", "<space>hd", function() harpoon:list():clear() end, { desc = "harpoon clear list" })
    map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "harpoon toogle quick" })
    map("n", "<space>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "harpoon toogle quick" })

    map("n", "<C-1>", function() harpoon:list():select(1) end)
    map("n", "<C-2>", function() harpoon:list():select(2) end)
    map("n", "<C-3>", function() harpoon:list():select(3) end)
    map("n", "<C-4>", function() harpoon:list():select(4) end)
  end,
}
