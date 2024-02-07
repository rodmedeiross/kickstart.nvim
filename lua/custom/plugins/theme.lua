-- {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme 'catppuccin-macchiato'
--   end,
--   opt = {
--     styles = {
--       types = { 'italic' },
--       -- booleans = { 'italic' }
--       functions = { 'bold' },
--     }
--   }
-- },

return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup({
      variant = 'moon',
      dark_variant = 'moon',
      extend_background_behind_borders = true,
      -- dim_inactive_windows = true,

      enable = {
        terminal = true,
      },

      styles = {
        transparency = true,
      }
    })
    vim.cmd('colorscheme rose-pine')
  end,
}

-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     vim.cmd('colorscheme tokyonight-moon')
--   end
-- }
