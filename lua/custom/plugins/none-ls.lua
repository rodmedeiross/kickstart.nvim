return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = "LSP: [C]ode [F]ormat" })
    require("null-ls").setup({})
    require("mason-null-ls").setup({
      ensure_installed = { "stylua", "jq", "buf", "fantomas", "eslint_d", "prettier" },

      methods = {
        diagnostics = false,
        formatting = true,
        code_actions = false,
        completion = true,
        hover = false,
      },
    })
  end,
}
