return {
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = "VeryLazy",
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = ' ' },
        change = { text = ' ' },
        delete = { text = ' ' },
        topdelete = { text = ' ' },
        changedelete = { text = '' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
        vim.keymap.set('n', '<leader>hb', ":Gitsigns toggle_current_line_blame<CR>",
          { buffer = bufnr, desc = 'Preview git line blame' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
      end,
    },
  },
  {
    "sindrets/diffview.nvim",
    evebt = "VeryLazy",
    config = function()
      vim.keymap.set('n', '<leader>gd', '<CMD>DiffviewOpen<CR>', { desc = "Open [G]it [D]iffview" })
      vim.keymap.set('n', '<leader>gc', '<CMD>DiffviewClose<CR>', { desc = "Close [G]it [D]iffview" })
    end
  }
}
