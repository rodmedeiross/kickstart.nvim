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
    vim.cmd('colorscheme rose-pine')
  end
}
