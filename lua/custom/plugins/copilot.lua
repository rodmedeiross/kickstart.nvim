return {
  -- {
  --   'github/copilot.vim',
  --   config = function()
  --     -- Copilot Key Remap
  --     vim.g.copilot_no_tab_map = true
  --     vim.api.nvim_set_keymap("i", "<A-c>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  --     -- Set Whitelist to Copilot
  --     vim.g.copilot_filetypes = {
  --       ["*"] = false,
  --       ["javascript"] = true,
  --       ["typescript"] = true,
  --       ["lua"] = false,
  --       ["rust"] = true,
  --       ["c"] = true,
  --       ["c#"] = true,
  --       ["c++"] = true,
  --       ["go"] = true,
  --       ["python"] = true,
  --     }
  --   end
  -- },
  {
    "zbirenbaum/copilot.lua",
    event = { "BufEnter" },
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false,
        },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    event = { "BufEnter" },
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
