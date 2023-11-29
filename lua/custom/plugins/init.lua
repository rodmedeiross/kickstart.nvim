return {

  -- Setting a theme to neovim
  -- https://github.com/catppuccin/nvim
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
    opt = {
      styles = {
        types = { 'italic' },
        booleans = { 'italic' }
      }

    }
  },

  -- Set tabs buffers
  -- https://github.com/akinsho/bufferline.nvim
  -- See config in tabbar.lua
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.keymap.set({ 'n' }, "<Tab>", "<Cmd>BufferLineCycleNext<cr>", { silent = true })
    end,
  },

  -- Dashboard with init commands
  -- https://github.com/goolord/alpha-nvim
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },

  -- https://github.com/windwp/nvim-autopairs
  {
    "windwp/nvim-autopairs",
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require("nvim-autopairs").setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  }

}
