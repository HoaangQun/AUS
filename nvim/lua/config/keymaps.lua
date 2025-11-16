-- ~/.config/nvim/lua/config/keymaps.lua

-- Đặt Space làm leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- Save nhanh
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", opts)

-- Quit không lưu
vim.keymap.set("n", "<leader>q", ":q!<CR>", opts)

-- Toggle NeoTree
vim.keymap.set("n", "<leader>l", ":Neotree toggle<CR>", opts)

-- Toggle Terminal
vim.keymap.set("n", "<leader>t", ":ToggleTerm direction=float<CR>", opts)

-- Build & Run C++
vim.keymap.set("n", "<leader>r", function()
  require("config.runner").build_and_run()
end, { noremap = true, silent = true, desc = "Build & Run C++" })

