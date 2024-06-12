local theme_table = {
  'rose-pine',
  'dracula',
  'catppuccin-macchiato'
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
  { "Mofiqul/dracula.nvim" },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        variant = 'moon',
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
    end
  },
}
