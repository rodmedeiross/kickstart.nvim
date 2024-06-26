-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',  event = { "BufEnter" }, opts = {} },

  -- Add multi cursor
  'mg979/vim-visual-multi',

  -- Import everthing in lua/custom/plugin/*.lua
  { import = 'custom.plugins' },

}, {})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move Lines
vim.keymap.set('n', '<A-k>', "<Cmd>m .-2<CR>==", { silent = true })
vim.keymap.set('n', '<A-j>', "<Cmd>m .+1<CR>==", { silent = true })
vim.keymap.set('i', '<A-k>', "<Esc><Cmd>m .-2<CR>==gi", { silent = true })
vim.keymap.set('i', '<A-j>', "<Esc><Cmd>m .+1<CR>==gi", { silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { silent = true })

-- Keep window centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Navigate between Buffers
vim.keymap.set('n', "<C-e>", '<Cmd>bdelete<CR>', { silent = true })
vim.keymap.set('n', "<Tab>", '<Cmd>bnext<CR>', { silent = true })
vim.keymap.set('n', "<S-Tab>", '<Cmd>bprevious<CR>', { silent = true })
vim.keymap.set('t', "<Esc>", [[<C-\><C-n>]])
vim.keymap.set('t', "<C-h>", [[<C-\><C-n><C-w>h]])
vim.keymap.set('t', "<C-j>", [[<C-\><C-n><C-w>j]])
vim.keymap.set('t', "<C-k>", [[<C-\><C-n><C-w>k]])
vim.keymap.set('t', "<C-l>", [[<C-\><C-n><C-w>l]])

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
