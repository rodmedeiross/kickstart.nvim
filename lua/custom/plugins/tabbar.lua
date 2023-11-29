local bufferline = require 'bufferline'
vim.opt.termguicolors = true

return {
  bufferline.setup({
    options = {
      style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
      tab_size = 30,
      max_name_length = 15,
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      diagnostics = "nvim_lsp",
      show_close_icon = false,
      persist_buffer_sort = true,
      enforce_regular_tabs = true,
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and "" or ""
        return icon .. count
      end,
      indicator = {
        icon = '▎', -- this should be omitted if indicator style is not 'icon'
        style = 'none',
      },
      --separator_style = "slope",
      offsets = {
        {
          filetype = "NeoTree",
          text = "Explorer:",
          separator = true,
          text_align = "center"
        }
      },
    }
  })
}
