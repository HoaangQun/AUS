-- ~/.config/nvim/lua/plugins/init.lua
return {
  -- opening
  {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "lua", "cpp"},
      highlight = { enable = true },
      indent = { enable = true },
    }
  end
  },
  {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("dashboard").setup {
      theme = "doom",
      config = {
        header = { [[]],[[]],[[]],[[]],[[]],[[]],
		  [[ Linux -  Ubuntu]],[[]],
          [[██╗  ██╗ ██████╗  █████╗  █████╗ ███╗   ██╗ ██████╗ ]],
          [[██║  ██║██╔═══██╗██╔══██╗██╔══██╗████╗  ██║██╔════╝ ]],
          [[███████║██║   ██║███████║███████║██╔██╗ ██║██║  ███╗]],
          [[██╔══██║██║   ██║██╔══██║██╔══██║██║╚██╗██║██║   ██║]],
          [[██║  ██║╚██████╔╝██║  ██║██║  ██║██║ ╚████║╚██████╔╝]],
          [[╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ]],
          [[                                                    ]],
          [[ ██████╗ ██╗   ██╗███╗   ██╗                        ]],
          [[██╔═══██╗██║   ██║████╗  ██║                        ]],
          [[██║   ██║██║   ██║██╔██╗ ██║                        ]],
          [[██║▄▄ ██║██║   ██║██║╚██╗██║                        ]],
          [[╚██████╔╝╚██████╔╝██║ ╚████║                        ]],
          [[ ╚══▀▀═╝  ╚═════╝ ╚═╝  ╚═══╝                        ]],
		  [[]],[[]],
        },
		center = {
          {
            icon = "  ",
            desc = "New file",
            key = "n",
            action = "enew",
          },
          {
            icon = "  ",
            desc = "File Explorer",
            key = "e",
            action = "Neotree toggle",
          },
          {
            icon = "  ",
            desc = "Find File",
            key = "f",
            action = "Telescope find_files",
          },
          {
            icon = "  ",
            desc = "Config",
            key = "c",
            action = "e ~/.config/nvim/init.lua",
          },
          {
            icon = "󰅚  ",
            desc = "Quit",
            key = "q",
            action = "q!",
          },
        },
        footer = { "BUG x3.14" }
      }
    }

    -- đổi màu highlight
    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#d4eeff", bold = true })
    vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#3e73b5" })
    vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#ff4d67", italic = true })
  end
  },
  -- theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- Using Lazy
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      -- Enable theme
      require('onedark').load()
    end
  },
  
  -- status line
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, config = function()
    require("lualine").setup {
      options = { theme = "onedark" }
    }
  end },

  -- file explorer
  { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  }},

  -- LSP + Autocomplete
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim", config = function()
    require("mason-lspconfig").setup {
      ensure_installed = { "clangd",}
    }
  end },
  { "neovim/nvim-lspconfig", config = function()
    require("lspconfig").clangd.setup {}
  end },
  { "hrsh7th/nvim-cmp", dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  }, config = function()
    local cmp = require("cmp")
    cmp.setup {
      snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      })
    }
  end },

  -- integrated terminal
  { "akinsho/toggleterm.nvim", version = "*", config = function()
    require("toggleterm").setup {
      size = 20,
      direction = "float",
      float_opts = { border = "curved", width = 140, height = 25 }
    }
  end },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()

    -- Thêm keymap custom
    vim.keymap.set("v", "<localleader>/", "gc", { remap = true, desc = "Toggle comment (visual)" })
    vim.keymap.set("n", "<localleader>/", "gcc", { remap = true, desc = "Toggle comment (normal)" })
  end
  },
}

