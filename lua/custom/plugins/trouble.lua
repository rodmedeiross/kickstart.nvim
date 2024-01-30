return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Diagnostic keymaps
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

    vim.keymap.set("n", "<leader>q", function()
      require("trouble").toggle()
    end, { desc = 'Open diagnostics list' })

    vim.keymap.set('n', '[d', function()
      require("trouble").next({ skip_groups = true, jump = true })
    end, { desc = 'Go to previous diagnostic message' })

    vim.keymap.set('n', ']d', function()
      require("trouble").previous({ skip_groups = true, jump = true })
    end, { desc = 'Go to next diagnostic message' })
  end
}
