local theme_table = {
  'rose-pine',
  'catppuccin-macchiato',
  'tokyonight',
  'kanagawa'
}

local function set_theme(theme)
  vim.cmd('colorscheme ' .. theme)
end

math.randomseed(os.time())

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup {
        transparent = vim.g.transparent_enabled
      }
    end
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        variant = 'auto',
        dark_variant = 'moon',
        extend_background_behind_borders = true,
        enable = {
          terminal = true,
        },
      })

      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          local next_theme = theme_table[math.random(#theme_table)]
          set_theme(next_theme)
          print("Switched to " .. next_theme)
        end
      })
    end,
  },
  {
    'xiyaowong/transparent.nvim',
    config = function()
      vim.keymap.set('n', '<leader>tr', '<cmd>TransparentToggle<CR>', { desc = "Enable t[R]ansparency UI" })
      require("transparent").setup({
        extra_groups = {
          "NormalFloat",
          "NvimTreeNormal"
        },
      })
    end
  },
}
