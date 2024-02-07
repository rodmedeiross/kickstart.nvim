return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup()
    vim.keymap.set("n", "<leader>pp", function() harpoon:list():append() end,
      { desc = 'Harpoon: Mark file of current buffer' })
    vim.keymap.set("n", "<leader>ph", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = 'Harpoon: Open list of marked files' })
    -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
    -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
    -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
  end
}
