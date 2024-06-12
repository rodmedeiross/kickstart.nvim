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

      local lazydocker = Terminal:new({
        cmd = "lazydocker",
        direction = "float",
        hidden = true,
        float_opts = {
          border = "double",
        },
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      function _lazydocker_toggle()
        lazydocker:toggle()
      end

      vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _lazygit_toggle()<CR>",
        { noremap = true, silent = true, desc = "Opens [L]azy Git" })

      vim.api.nvim_set_keymap("n", "<leader>ud", "<cmd>lua _lazydocker_toggle()<CR>",
        { noremap = true, silent = true, desc = "Opens [L]azy Docker" })

      require('toggleterm').setup {
        open_mapping = [[<C-t>]],
        direction = 'float',
      }
    end
  }
}
