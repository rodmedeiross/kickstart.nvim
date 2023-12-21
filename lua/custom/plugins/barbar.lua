return {
  'romgrk/barbar.nvim',
  version = '^1.0.0',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.g.barbar_auto_setup = false
    vim.keymap.set('n', "<C-e>", '<Cmd>BufferClose<CR>', { silent = true })
    vim.keymap.set('n', "<Tab>", '<Cmd>BufferNext<CR>', { silent = true })
    vim.keymap.set('n', "<S-Tab>", '<Cmd>BufferPrevious<CR>', { silent = true })
  end,
  opts = {
    animation = false,
    insert_at_start = true,

    sidebar_filetypes = {
      ['neo-tree'] = { event = 'BufWipeout' },
    },
  }
}
