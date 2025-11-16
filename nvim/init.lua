-- ~/.config/nvim/init.lua

-- Setup Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"

vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- Load plugins
require("lazy").setup("plugins")
-- require("catppuccin").setup()
-- Load settings
require("config.options")
require("config.keymaps")

