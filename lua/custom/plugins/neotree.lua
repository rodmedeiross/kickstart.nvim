-- File tree to Neovim - Like sidebar in VSCode
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', "<A-n>", '<Cmd>Neotree toggle<cr>', { silent = true })               -- opens file system in sidebar
    vim.keymap.set('n', "<A-b>", "<Cmd>Neotree toggle buffers right<cr>", { silent = true }) -- opens buffers in sidebar
    -- vim.keymap.set('n', "<C-e>", "<Cmd>Neotree float git_status<cr>", { silent = true })       -- opens git status in float window
    require('neo-tree').setup({
      filesystem = {
        bind_to_cwd = true,  -- true creates a 2-way binding between vim's cwd and neo-tree's root
        cwd_target = {
          sidebar = "tab",   -- sidebar is when position = left or right
          current = "window" -- current is when position = current
        },
        window = {
          mappings = {
            ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
          }
        },
      },
      nesting_rules = {
        ["package.json"] = {
          pattern = "^package%.json$",             -- <-- Lua pattern
          files = { "package-lock.json", "yarn*" } -- <-- glob pattern
        },
        ["docker"] = {
          pattern = "^dockerfile$",
          ignore_case = true,
          files = { ".dockerignore", "docker-compose.*", "dockerfile*" },
        }
      }
    })
  end,
}
