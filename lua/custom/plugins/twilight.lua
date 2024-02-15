return {
  "folke/twilight.nvim",
  event = "VeryLazy",
  opts = {
    dimming = {
      alpha = 0.25,
      color = { "Normal", "#424553" },
      inactive = false,
    },
    context = 15,
    treesitter = true,
    expand = {
      "function",
      "method",
      "table",
      "if_statement",
    },
  },
  config = function()
    vim.keymap.set('n', '<leader>tt', ':Twilight<CR>', { desc = 'Enable [T]wilight' })
  end
}
