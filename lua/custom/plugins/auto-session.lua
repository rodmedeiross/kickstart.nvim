return {
  'rmagatti/auto-session',
  config = function()
    require("auto-session").setup {
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },

      -- ⚠️ This will only work if Telescope.nvim is installed
      -- The following are already the default values, no need to provide them if these are already the settings you want.
      session_lens = {
        -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
        buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
      pre_save_cmds = {
        "Neotree close"
      },
      auto_save_enabled = false,
    }

    -- ⚠️ This will only work if Telescope.nvim is installed
    vim.keymap.set("n", "<leader>sss", require("auto-session.session-lens").search_session, {
      noremap = true,
      desc = "Search [S]ession"
    })

    vim.keymap.set("n", "<leader>ssd", "<cmd>SessionDelete<CR>", {
      noremap = true,
      desc = "[S]ession [D]elete"
    })

    vim.keymap.set("n", "<leader>ssv", "<cmd>SessionSave<CR>", {
      noremap = true,
      desc = "[S]ession Sa[V]e"
    })
  end
}
