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
  icon = '󰊢'
}

local diagnostics = {
  'diagnostics',
  update_in_insert = false,
  -- always_visible = true,
  symbols = { error = " ", warn = " ", hint = "󰌶 ", info = "󰋽 " },
}

local progress = {
  'progress',
  icon = "",
  padding = { left = 1, right = 1 }

}

local diff = {
  'diff',
  symbols = { added = ' ', modified = ' ', removed = ' ' },
  padding = { left = 1, right = 1 }
}

local encoding = {
  'encoding',
  fmt = function(str) return string.upper(str) end,
  padding = { left = 1, right = 0 }
}

local tabsize = {
  function()
    local type = vim.bo.expandtab and "Spaces" or "Tabs"
    local size = vim.bo.expandtab and vim.bo.shiftwidth or vim.bo.tabstop
    return type .. ":" .. size
  end,
  padding = { left = 1, right = 0 },
  cond = function()
    return vim.bo.filetype ~= ""
  end,
}

return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        -- theme = 'tokyonight',
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode', searchcount, selectioncount },
        lualine_b = { branch, diff, diagnostics },
        -- lualine_c = { 'filename', 'filetype'},
        lualine_c = {},
        lualine_x = { tabsize, encoding, 'fileformat' },
        lualine_y = { progress },
        lualine_z = { 'location' }
      },
    }
  end,
}
