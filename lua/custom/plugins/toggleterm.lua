return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      local Terminal = require('toggleterm.terminal').Terminal

      local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        dir = "git_dir",
        hidden = true,
        float_opts = {
          border = "double",
        },
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _lazygit_toggle()<CR>",
        { noremap = true, silent = true, desc = "Opens [L]azy Git" })

      require('toggleterm').setup {
        open_mapping = [[<C-t>]],
        direction = 'float',
      }
    end
  }
}
