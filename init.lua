--|get my init.lua config:
--|
--|git clone https://github.com/HoaangQun/AUS
--|
--| 
--|
--|   ██    ██   █████     ███      ███    ██    ██   ██████       █████    ██   ██  ██    ██  
--|   ██    ██  ██   ██   ██ ██    ██ ██   ███   ██  ██           ██   ██   ██   ██  ███   ██  
--|   ████████  ██   ██  ██   ██  ██   ██  ██ ██ ██  ██   ███     ██   ██   ██   ██  ██ ██ ██ 
--|   ██    ██  ██   ██  ███████  ███████  ██  ████  ██    ██     ██ ▄ ██   ██   ██  ██  ████  
--|   ██    ██   █████   ██   ██  ██   ██  ██    ██   ██████       ████ ██   █████   ██    ██
--|
--|
--|
--| gmail   : hoangquanken97@gmail.com  
--|         : hoangquanken47@gmail.com
--| 
--| facebook: @hoaangqun
--| tiktok  : @hoaangqun
--| github  : HoaangQun
--|
--|
--|
--|
--|
--|
--|
-- Init.lua for Neovim configuration with essential plugins and features
 
-- Ensure packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Packer plugin management
require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  -- LSP and autocompletion
  use {
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
  }

  -- Terminal integration
  use { 'akinsho/toggleterm.nvim', tag = '*' }

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  }

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- Git integration
  use 'lewis6991/gitsigns.nvim'

  -- VSCode theme
  use 'Mofiqul/vscode.nvim'

  -- Bootstrap plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Basic settings
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Key mappings
vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>f', ':Telescope find_files<CR>', opts)
map('n', '<leader>g', ':Telescope live_grep<CR>', opts)
map('t', '<Esc>', [[<C-\><C-n>]], opts)

-- NvimTree setup
require('nvim-tree').setup {}

-- Telescope setup
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Lualine setup
require('lualine').setup {
  options = {
    theme = 'vscode',
    section_separators = '',
    component_separators = '',
  },
}

-- ToggleTerm setup
require('toggleterm').setup {
  open_mapping = [[<C-t>]],
  direction = 'float',
}

-- Treesitter setup
require('nvim-treesitter.configs').setup {
  ensure_installed = 'all',
  highlight = {
    enable = true,
  },
}

-- Gitsigns setup
require('gitsigns').setup {}

-- LSP and autocompletion
local lspconfig = require('lspconfig')
local cmp = require('cmp')

cmp.setup {
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
  },
  sources = {
    { name = 'nvim_lsp' },
  },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig['lua_ls'].setup {
  capabilities = capabilities,
}

-- VSCode theme setup
vim.cmd [[colorscheme vscode]]

-- Auto-reload config on save
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]
-- Tự động đóng ngoặc
vim.api.nvim_set_keymap('i', '(', '() <left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{', '{} <left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[] <left>', { noremap = true, silent = true })

-- init.lua
require('packer').startup(function()
  -- Plugin quản lý
  use 'wbthomason/packer.nvim'

  -- Autocomplete plugin
  use 'hrsh7th/nvim-cmp'        -- Plugin chính cho autocomplete
  use 'hrsh7th/cmp-nvim-lsp'    -- Kết nối nvim-cmp với LSP
  use 'hrsh7th/cmp-buffer'      -- Autocomplete từ nội dung buffer
  use 'hrsh7th/cmp-path'        -- Autocomplete đường dẫn file
  use 'hrsh7th/cmp-cmdline'     -- Autocomplete lệnh cmdline

  -- Snippets
  use 'L3MON4D3/LuaSnip'        -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip' -- Kết nối LuaSnip với nvim-cmp

  -- LSP Config
  use 'neovim/nvim-lspconfig'   -- Cài đặt và quản lý LSP
end)

-- Tự động đóng dấu nháy đơn và nháy kép
vim.api.nvim_set_keymap('i', "'", "'' <left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '"', '"" <left>', { noremap = true, silent = true })

-- Tắt thông báo thông tin phiên bản mặc định
vim.opt.shortmess:append("I")

