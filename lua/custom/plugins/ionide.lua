-- F# LSP and Syntax Hightlight ConfigSchema
local vim = vim

local function ionide_setup()
  -- ionode settings
  vim.g["fsharp#show_signature_on_cursor_move"] = 0
  vim.g["fsharp#lsp_auto_setup"] = 0
  vim.g["fsharp#workspace_mode_peek_deep_level"] = 4

  vim.api.nvim_create_user_command("FSharpRefreshCodeLens", function()
    vim.lsp.codelens.refresh()
    print "[FSAC] Refresh CodeLens"
  end, { bang = true })
end

return {
  "ionide/ionide-vim",
  ft = "fsharp",
  dependencies = {
    "neovim/nvim-lspconfig"
  },
  config = {
    ionide_setup()
  }
}
