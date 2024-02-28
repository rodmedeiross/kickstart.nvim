-- Elements configuration
local searchcount = {
  'searchcount',
  padding = { left = 1, right = 1 },
}

local selectioncount = {
  'selectioncount',
  icon = '󰫙',
  padding = { left = 1, right = 1 },
}

local branch = {
  'branch',
  icon = '󰊢 '
}

local diagnostics = {
  'diagnostics',
  update_in_insert = false,
  -- always_visible = true,
  symbols = { error = "  ", warn = "  ", hint = "󰌶  ", info = "󰋽  " },
}

local progress = {
  'progress',
  icon = " ",
  padding = { left = 1, right = 1 }

}

local diff = {
  'diff',
  symbols = { added = '  ', modified = '  ', removed = '  ' },
  padding = { left = 1, right = 1 }
}

local encoding = {
  'encoding',
  fmt = function(str) return string.upper(str) end,
  padding = { left = 1, right = 1 }
}

local tabsize = {
  function()
    local type = vim.bo.expandtab and "Spaces" or "Tabs"
    local size = vim.bo.expandtab and vim.bo.shiftwidth or vim.bo.tabstop
    return type .. ":" .. size
  end,
  padding = { left = 1, right = 1 },
  cond = function()
    return vim.bo.filetype ~= ""
  end,
}

local file_name = {
  'filename',
  file_status = false,
  path = 3,
  color = { fg = "#ea9a97" }
}

local debug_status = {
  function() return "  " .. require("dap").status() end,
  cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
}

local commandHistory = {
  function() return " : " .. require("noice").api.status.command.get() end,
  cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
}

-- local statusMode = {
--   function() return require("noice").api.status.mode.get() end,
--   cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
-- }

local autosessions = {
  require('auto-session.lib').current_session_name,
}

local lsp_clients = function()
  local clients = vim.lsp.get_active_clients()
  local clients_lists = {}

  for _, client in pairs(clients) do
    local name = client.name
    if client.name == "copilot" then
      name = "  "
    end
    table.insert(clients_lists, name)
  end

  return '  LSP: ' .. table.concat(clients_lists, " ")
end

return {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy",
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        globalstatus = true,
        theme = 'rose-pine',
        component_separators = { left = ' ', right = '' },
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode', searchcount, selectioncount },
        lualine_b = { branch, diff, diagnostics },
        -- lualine_c = { 'filename', 'filetype'},
        -- lualine_c = { commandHistory, statusMode },
        lualine_c = { file_name, autosessions },
        lualine_x = { commandHistory, lsp_clients, debug_status, tabsize, encoding, 'fileformat' },
        lualine_y = { progress },
        lualine_z = { 'location' }
      },
    }
  end,
}
