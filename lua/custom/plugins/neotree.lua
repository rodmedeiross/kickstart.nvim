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
    vim.keymap.set('n', "<leader>ge", "<Cmd>Neotree float git_status<cr>",
      { silent = true, desc = "Opens [G]it Neotre[e] Status" })                              -- opens git status in float window

    require('neo-tree').setup({
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added     = " ", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified  = " ", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted   = " ", -- this can only be used in the git_status source
            renamed   = " ", -- this can only be used in the git_status source
            -- Status type
            untracked = " ",
            ignored   = " ",
            unstaged  = "󰄱 ",
            staged    = " ",
            conflict  = " ",
          }
        },
      },
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
